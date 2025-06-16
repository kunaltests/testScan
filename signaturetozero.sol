// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TEST  {
uint a = 10000000000000000000;
    mapping (address=>uint) balance;

    function transferFunds(address _to,uint _amount,string memory message, bytes32 r,
        bytes32 s,
        uint8 v) external {
        bytes32 messageHash = keccak256(abi.encodePacked(message));
        address signer = ecrecover(messageHash, v, r, s);
        balance[signer] -= _amount;
        balance[_to] += _amount;
    }
}
