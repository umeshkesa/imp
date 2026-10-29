
contract ExceptionHandling {

    uint public constant MAX_VALUE = 100;

    // 1. Using require()
    function testRequire(uint _input)
        public
        pure
        returns (string memory)
    {
        require(
            _input <= MAX_VALUE,
            "Input must be less than or equal to 100."
        );

        return "Input is valid.";
    }

    // 2. Using revert()
    function testRevert(uint _input)
        public
        pure
        returns (string memory)
    {
        if (_input > MAX_VALUE) {
            revert("Input exceeds maximum allowed value.");
        }

        return "Input is valid.";
    }

    // 3. Using assert()
    function testAssert(uint _a, uint _b)
        public
        pure
        returns (uint)
    {
        uint sum = _a + _b;

        assert(sum >= _a);

        return sum;
    }
}