from starkware.cairo.common.cairo_builtins import hash
from starkware.cairo.common.cairo_builtins import pedersen_hash
from starkware.cairo.common.cairo_builtins import verify_strict
from starkware.cairo.common.math import assert_eq, assert_ge, assert_lt, to_int
from starkware.cairo.common.storage import Storage

# Define the struct for WearableData.
struct WearableData:
    values: felt*2
    tolerances: felt*2
    proofValid: felt

# Define the struct for UserBaseline.
struct UserBaseline:
    owner: felt
    wearableData: WearableData

# Define the main contract.
@storage_var
userBaselines: Storage(felt, UserBaseline)

# Event to log off-chain computation.
event OffChainComputation(user: felt, message: felt, result: felt)

# Function to set user baselines.
func setUserBaselines(targetValues: felt*2, tolerances: felt*2):
    assert_eq(len(targetValues), len(tolerances), "Lengths of targetValues and tolerances must match.")

    # Create a new UserBaseline struct and store it in the mapping.
    userBaselines[msg.sender] = UserBaseline(
        owner=msg.sender,
        wearableData=WearableData(values=targetValues, tolerances=tolerances, proofValid=0)
    )

# Function to update wearable data and trigger alerts.
func updateWearableData(wearableData: felt*2):
    user: felt = msg.sender
    # Retrieve the user's baseline.
    userBaseline: UserBaseline = userBaselines[user]

    # Verify ZKP proof of correct wearable data origin and validity.
    verifyProof(wearableData, userBaseline.wearableData)

    # Check for anomalies in wearable data.
    if isAnomalous(wearableData, userBaseline.wearableData):
        # Trigger off-chain edge computing.
        triggerEdgeComputingForAlertOffChain(user, "Anomaly detected in wearable data")

# Function to trigger off-chain edge computing for notification alert.
func triggerEdgeComputingForAlertOffChain(user: felt, message: felt):
    # Emulate off-chain computation and emit an event.
    result: felt = performOffChainComputation(user, message)
    OffChainComputation(user=user, message=message, result=result)

    # Update the contract state based on off-chain computation result.
    userBaselines[user].wearableData.proofValid = result

# Emulate off-chain computation
func performOffChainComputation(user: felt, message: felt) -> (result: felt):
    return 1  # Emulate success

# ZKP verification function.
func verifyProof(wearableData: felt*2, baseline: WearableData):
    # ZKP logic using hash functions.
    hashData: felt = pedersen_hash(wearableData)

    # Compare the hashed data with the baseline proof.
    verify_strict(hashData == baseline.proofValid, "Invalid ZKP proof")

# Function to check if wearable data is anomalous.
func isAnomalous(data: felt*2, baseline: WearableData) -> (anomalous: felt):
    assert_eq(len(data), len(baseline.values), "Lengths of data and baseline values must match.")
    assert_eq(len(data), len(baseline.tolerances), "Lengths of data and baseline tolerances must match.")

    for i in range(2):
        if data[i] < baseline.values[i] - baseline.tolerances[i] or data[i] > baseline.values[i] + baseline.tolerances[i]:
            return 1  # Anomaly detected.

    return 0  # No anomaly.
