# Token Vesting Contract

The Token Vesting Contract is designed to manage the vesting of tokens for employees, founders, or contributors. It enables tokens to be gradually released over a specified vesting schedule, ensuring that recipients can only claim tokens as they vest over time.

## Features

- **Token Allocation:** Tokens are allocated to a recipient but remain locked until the vesting period begins.
- **Periodic Vesting:** Tokens are gradually released according to a predetermined vesting schedule, such as monthly or yearly.
- **Vesting Completion:** Once the vesting period ends, all remaining tokens become available for the recipient to claim.

## How It Works

### 1. Deploy the Contract
The contract owner (typically the token issuer) deploys the contract and specifies:
- **Token Address:** The address of the ERC-20 token to be vested.
- **Recipient's Address:** The address of the individual or entity receiving the vested tokens.

### 2. Set Vesting Schedule
The contract owner sets the vesting schedule, which includes:
- **Start Time:** When the vesting begins (timestamp).
- **Vesting Period:** The duration over which the tokens will be vested (e.g., 1 year).
- **Amount of Tokens:** The total number of tokens to be vested.

### 3. Claim Tokens
The recipient can periodically call the `claimTokens()` function to withdraw the vested tokens based on the vesting schedule. As time progresses, more tokens become available for the recipient to claim.


