use core::hash::{LegacyHash};

#[starknet::contract]
pub mod StarkByte {
    // Define the main contract.
    #[storage]
    struct Storage {
    userBaselines: LegacyMap<felt252, UserBaseline>
    }

    // Define the struct for WearableData.
    struct WearableData {
        values: felt252,
        tolerances: felt252,
        proofValid: felt252,
    }
      

    // Define the struct for UserBaseline.
    struct UserBaseline {
        owner: felt252,
        wearableData: WearableData,
    }


    // Event to log off-chain computation.
    event OffChainComputation(user: felt252, message: felt252, result: felt252);


    // Function to set user baselines.
    func setUserBaselines(targetValues: felt252, tolerances: felt252):
        assert_eq(len(targetValues), len(tolerances), "Lengths of targetValues and tolerances must match.")

        // Create a new UserBaseline struct and store it in the mapping.
        userBaselines[msg.sender] = UserBaseline(
            owner=msg.sender,
            wearableData=WearableData(values=targetValues, tolerances=tolerances, proofValid=0)
        )

    // Function to update wearable data and trigger alerts.
    func updateWearableData(wearableData: felt252):
        user: felt252 = msg.sender
        // Retrieve the user's baseline.
        userBaseline: UserBaseline = userBaselines[user]

        // Verify ZKP proof of correct wearable data origin and validity.
        verifyProof(wearableData, userBaseline.wearableData)

        // Check for anomalies in wearable data.
        if isAnomalous(wearableData, userBaseline.wearableData):
            // Trigger off-chain edge computing.
            triggerEdgeComputingForAlertOffChain(user, "Anomaly detected in wearable data")

    // Function to trigger off-chain edge computing for notification alert.
    func triggerEdgeComputingForAlertOffChain(user: felt, message: felt):
        // Emulate off-chain computation and emit an event.
        result: felt = performOffChainComputation(user, message)
        OffChainComputation(user=user, message=message, result=result)

        // Update the contract state based on off-chain computation result.
        userBaselines[user].wearableData.proofValid = result

    // Emulate off-chain computation
    func performOffChainComputation(user: felt256, message: felt256) -> (result: felt256):
        return 1  // Emulate success

    // ZKP verification function.
    func verifyProof(wearableData: felt256, baseline: WearableData):
        // ZKP logic using hash functions.
        hashData: felt256 = LegacyHash::hash(wearableData)

        // Compare the hashed data with the baseline proof.
        assert(hashData == baseline.proofValid, "Invalid ZKP proof")

    // Function to check if wearable data is anomalous.
    func isAnomalous(data: felt256, baseline: WearableData) -> (anomalous: felt256):
        assert_eq(len(data), len(baseline.values), "Lengths of data and baseline values must match.")
        assert_eq(len(data), len(baseline.tolerances), "Lengths of data and baseline tolerances must match.")

        for i in range(2):
            if data[i] < baseline.values[i] - baseline.tolerances[i] or data[i] > baseline.values[i] + baseline.tolerances[i]:
                return 1  // Anomaly detected.

        return 0  // No anomaly.

}

