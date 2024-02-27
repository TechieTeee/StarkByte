use core::hash::{LegacyHash};

#[starknet::interface]
pub trait IStarkByte<TContractState> {
    // read function
    // fn func_name(self: @TContractState) -> felt252;
    
    fn setUserBaselines(ref self: TContractState, targetValues: felt252, tolerances: felt252);
    fn updateWearableData(ref self: TContractState, wearableData: felt252);
    fn triggerEdgeComputingForAlertOffChain(self: @TContractState, user: felt252, message: felt252);
    fn performOffChainComputation(self: @TContractState, user: felt252, message: felt252);
    fn verifyProof(self: @TContractState, wearableData: felt252, baseline: WearableData);
    fn isAnomalous(self: @TContractState, data: felt252, baseline: WearableData);

}

    // Define the struct for WearableData.
    #[derive(Drop, Copy, Serde, starknet::Store)]
    pub struct WearableData {
        values: felt252,
        tolerances: felt252,
        proofValid: felt252,
    }

#[starknet::contract]
pub mod StarkByte {
    use super::{IStarkByte};
    use starknet::{ContractAddress, get_caller_address};
    use super:: WearableData;

    // Define the main contract.
    #[storage]
    struct Storage {
        userBaselines: LegacyMap<felt252, UserBaseline>
    }

      
     // Define the struct for UserBaseline.
    #[derive(Drop, Copy, Serde, starknet::Store)]
    pub struct UserBaseline {
        owner: ContractAddress,
        pub wearableData: WearableData,
    }

    
    // Event to log off-chain computation.
     #[derive(starknet::Event, Drop)]
    pub struct OffChainComputation{
        user:felt252,
        message:felt252,
        result:felt252,
    }

      #[derive(starknet::Event, Drop)]
      #[event]
      enum Event{
        OffChainComputation: OffChainComputation
      }

    #[abi(embed_v0)]
    impl IStarkByteImpl of IStarkByte<ContractState> {
        // Function to set user baselines.
        fn setUserBaselines(ref self: ContractState, targetValues: felt252, tolerances: felt252) {
            assert(targetValues == tolerances, 'args must match');

            // Create a new UserBaseline struct and store it in the mapping.
            self.userBaselines.write(
                  0,
                UserBaseline {
                    owner: get_caller_address(),
                    wearableData: WearableData {
                        values: targetValues,
                        tolerances: tolerances,
                        proofValid: 0,
                    },
                },
            );
        }

        // Function to update wearable data.
        fn updateWearableData(ref self: ContractState, wearableData: felt252) {
            // Fetch the current user's address.
            let caller = get_caller_address();

            // Retrieve the UserBaseline associated with the caller.
            let userBaseline = self.userBaselines.read(caller).expect("User not found.");

            // Update the wearable data.
            userBaseline.wearableData.values = wearableData;
            userBaseline.wearableData.proofValid = 0; // Assuming proof needs to be reset.

            // Update the UserBaseline in the storage.
            self.userBaselines.write(caller, userBaseline);
        }

        // Function to trigger edge computing for alert off-chain.
        fn triggerEdgeComputingForAlertOffChain(self: @ContractState, user: felt252, message: felt252) {
        }

        // Function to perform off-chain computation.
        fn performOffChainComputation(self: @ContractState, user: felt252, message: felt252 ) {
        }

        // Function to verify proof.
        fn verifyProof(self: @ContractState, wearableData: felt252, baseline: WearableData) {
        }

        // Function to check if data is anomalous.
        fn isAnomalous(self: @ContractState, data: felt252, baseline: WearableData) {
        }
    }
