pragma solidity 0.5.16;

interface ChainPortMainBridge {
    function depositTokens(address token, uint256 value, uint256 toChainId) external;
    function burnTokens(address token, uint256 amount) external;
}

contract BridgeToMatic {

    address public chainPortMainBridgeBSC = 0x2CD90158baAE285010A5Ed7C549C2E5B4C0715F4;
    address public chainPortMainBridgeMatic = 0x0000000000000000000000000000000000000000;
    address public oks = 0x18aCf236eB40c0d4824Fb8f2582EBbEcD325Ef6a;

    /**
     * @dev Requires prior approval
     * @notice Bridges tokens to Polygon.
     * @param amount The amount to bridge.
     */
    function bridge(uint amount) external returns (bool success) {
        ( , ) = address(chainPortMainBridgeBSC).delegatecall(abi.encodeWithSignature("depositTokens(address, uint256, uint256)", oks, amount, 3));
    }

}

contract UnBridgeToBSC is BridgeToPolygon {
    /**
     * @dev Requires prior approval
     * @notice Unbridge tokens back to BSC.
     * @param amount The amount to unbridge.
     */
    function unbridge(uint amount) external returns (bool success) {
        ( , ) = address(chainPortMainBridgeMatic).delegatecall(abi.encodeWithSignature("burnTokens(address, uint256)", oks, amount));
    }
}