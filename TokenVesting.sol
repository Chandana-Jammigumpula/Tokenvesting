// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for interacting with the ERC-20 token contract
interface IERC20 {
    function transfer(address recipient, uint amount) external returns (bool);
}

// The TokenVesting contract releases tokens to a beneficiary over time.
contract TokenVesting {
    // State variable to store the token contract instance
    IERC20 public token;

    // Address of the beneficiary who will receive the vested tokens
    address public beneficiary;

    // The time when the vesting starts (timestamp)
    uint public start;

    // The total duration of the vesting period (in seconds)
    uint public duration;

    // The total number of tokens to be vested
    uint public totalAmount;

    // Variable to track how many tokens have already been released  
    uint public released;

    // Constructor to initialize the vesting parameters
    constructor(
        address _token,
        address _beneficiary,
        uint _start,
        uint _duration,
        uint _totalAmount
    ) {
        token = IERC20(_token);  // Set the token contract
        beneficiary = _beneficiary;  // Set the beneficiary address
        start = _start;  // Set the vesting start time
        duration = _duration;  // Set the total vesting duration
        totalAmount = _totalAmount;  // Set the total amount of tokens to be vested
    }

    // Function to calculate how many tokens have vested by the current time
    function vestedAmount() public view returns (uint) {
        if (block.timestamp < start) {
            // If the current time is before the start of vesting, no tokens have vested
            return 0;
        } else if (block.timestamp >= start + duration) {
            // If the vesting period is complete, all tokens have vested
            return totalAmount;
        } else {
            // Otherwise, calculate the vested tokens based on the proportion of time passed
            return (totalAmount * (block.timestamp - start)) / duration;
        }
    }

    // Function to release vested tokens to the beneficiary
    function release() public {
        // Calculate the amount of tokens that can be released but haven't been yet
        uint unreleased = vestedAmount() - released;

        // Ensure that there are tokens available to release
        require(unreleased > 0, "No tokens are due for release");

        // Update the amount of released tokens
        released += unreleased;

        // Transfer the vested tokens to the beneficiary
        token.transfer(beneficiary, unreleased);
    }
}
