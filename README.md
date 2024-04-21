ERC-570 Token Standard
By: Alexander Reed


Methods
function name() public view returns (string): Returns the name of the token.
function symbol() public view returns (string): Returns the symbol of the token.
function decimals() public view returns (uint8): Returns the number of decimals the token uses.
function totalSupply() public view returns (uint256): Returns the total amount of tokens.
function balanceOf(address _owner) public view returns (uint256 balance): Returns the number of tokens that the specified address owns.
function transfer(address _to, uint256 _value) public returns (bool success): Transfers _value amount of tokens to the address _to, and returns true if the operation was successful.
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success): Transfers _value amount of tokens from address _from to address _to, and returns true if the operation was successful.
function approve(address _spender, uint256 _value) public returns (bool success): Allows _spender to withdraw from your account multiple times, up to the _value amount. If this function is called again it overwrites the current allowance with _value.
function allowance(address _owner, address _spender) public view returns (uint256 remaining): Returns the amount which _spender is still allowed to withdraw from _owner.
function setCompliance(string memory jurisdiction, bool status) public: Sets the compliance status for a specific jurisdiction.
function isCompliant(string memory jurisdiction) public view returns (bool): Returns the compliance status for a specified jurisdiction.

Events
event Transfer(address indexed _from, address indexed _to, uint256 _value): Emitted when value tokens are moved from one address (_from) to another (_to).
event Approval(address indexed _owner, address indexed _spender, uint256 _value): Emitted when the owner (_owner) approves a spender (_spender) to use _value tokens on their behalf.
event ComplianceStatusChanged(string jurisdiction, bool status): Emitted when the compliance status for a jurisdiction is updated.




--
XFT Labs
Website: https://xft.framer.website/
Docs: https://xft-docs.gitbook.io/xft-docs
Find me here: https://linktr.ee/alexander.reed
Email: alex@alexandros-securities.com


X FINANCIAL TECHNOLOGIES LLC
