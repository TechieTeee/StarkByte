%lang starknet

// Define a dynamic data structure to store user preferences for wearables
struct WearableData {
  uint256[] values;
  uint256[] tolerances;
}

// Define a dynamic data structure to store user baselines
struct UserBaseline {
  address owner;
  WearableData wearableData;
}

// Contract storage
map(address => UserBaseline) userBaselines;

// Function to set user baselines
func setUserBaselines(targetValues: uint256[], tolerances: uint256[]) {
  require_eq(targetValues.length, tolerances.length, "Lengths of targetValues and tolerances must match.");
  userBaselines[msg.sender] = UserBaseline(owner: msg.sender, wearableData: WearableData(values: targetValues, tolerances: tolerances));
}

// Function to update wearable data and trigger alerts
func updateWearableData(wearableData: uint256[]) {
  address user = msg.sender;
  UserBaseline userBaseline = userBaselines[user];

  // Verify ZKP proof of correct wearable data origin and validity
  assert(verifyProof(wearableData));

  // Check for anomalies in wearable data
  if (isAnomalous(wearableData, userBaseline.wearableData)) {
    // Trigger edge computing to send notification alert
    triggerEdgeComputingForAlert(user, "Anomaly detected in wearable data");
  }
}

// ZKP verification function
func verifyProof(wearableData: uint256[]): bool {
  return true;
}

// Function to trigger edge computing for notification alert
func triggerEdgeComputingForAlert(user: address, message: string) {
  console("Notification alert for user: ", user, " - Message: ", message);
}

// Function to check if wearable data is anomalous
func isAnomalous(data: uint256[], baseline: WearableData): bool {
  require_eq(data.length, baseline.values.length, "Lengths of data and baseline values must match.");
  require_eq(data.length, baseline.tolerances.length, "Lengths of data and baseline tolerances must match.");

  for (var i: uint256 = 0; i < data.length; i++) {
    if (data[i] < baseline.values[i] - baseline.tolerances[i] || data[i] > baseline.values[i] + baseline.tolerances[i]) {
      return true;
    }
  }

  return false;
}

// Function to set ZKP proof for wearable data
func setProofForWearableData(user: address, proofValid: bool) {
  assert(msg.sender == user, "Only the user can set the proof.");
  userBaselines[user].wearableData.proofValid = proofValid;
}