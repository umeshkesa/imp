
contract BalanceTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Allows the contract to receive ETH
    receive() external payable {}

    // Returns the contract's ETH balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Restricts access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Transfers ETH from the contract to another address
    function transferAmount(address payable _to, uint256 _amount)
        public
        onlyOwner
    {
        require(
            address(this).balance >= _amount,
            "Insufficient contract balance"
        );

        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}
