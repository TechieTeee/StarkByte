use core::hash::{LegacyHash};

#[starknet::interface]
pub trait IStarkByte<TContractState> {
    // read function
    // fn func_name(self: @TContractState) -> felt252;
    
    fn setUserBaselines(ref self: TContractState, targetValues: felt252, tolerances: felt252);
}

#[starknet::contract]
pub mod StarkByte {
    use super::{IStarkByte};
    use starknet::{ContractAddress, get_caller_address};

    // Define the main contract.
    #[storage]
    struct Storage {
        userBaselines: LegacyMap<felt252, UserBaseline>
    }

    // Define the struct for WearableData.
    #[derive(Drop, Copy, Serde, starknet::Store)]
    struct WearableData {
        values: felt252,
        tolerances: felt252,
        proofValid: felt252,
    }
      
     // Define the struct for UserBaseline.
    #[derive(Drop, Copy, Serde, starknet::Store)]
    struct UserBaseline {
        owner: ContractAddress,
        wearableData: WearableData,
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
            assert(targetValues == tolerances, 'args must match.');

            // Create a new UserBaseline struct and store it in the mapping.
            self.userBaselines.write(
                0,
                UserBaseline {
                    owner: get_caller_address(),
                    wearableData: WearableData {
                        values: targetValues,
                        tolerances: tolerances,
                        proofValid: 0
                    }
                }
            );
        }
    }
}

