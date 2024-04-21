// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IERC570 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    function setCompliance(string memory jurisdiction, bool status) external;
    function isCompliant(string memory jurisdiction) external view returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event ComplianceStatusChanged(string jurisdiction, bool status);
}

contract ERC570 is IERC570 {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    mapping(string => bool) private _complianceStatus;

    uint256 private _totalSupply;

    string public constant NAME = "ERC570Token";
    string public constant SYMBOL = "E570";
    uint8 public constant DECIMALS = 18;

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(_complianceStatus["Global"], "ERC570: Global compliance required");
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(_complianceStatus["Global"], "ERC570: Global compliance required");
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender] - amount);
        return true;
    }

    function setCompliance(string memory jurisdiction, bool status) public override {
        _complianceStatus[jurisdiction] = status;
        emit ComplianceStatusChanged(jurisdiction, status);
    }

    function isCompliant(string memory jurisdiction) public view override returns (bool) {
        return _complianceStatus[jurisdiction];
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC570: transfer from the zero address");
        require(recipient != address(0), "ERC570: transfer to the zero address");
        require(_balances[sender] >= amount, "ERC570: transfer amount exceeds balance");

        _balances[sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC570: approve from the zero address");
        require(spender != address(0), "ERC570: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}
