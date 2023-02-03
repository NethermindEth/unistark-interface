%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int160, warp_external_input_check_int128, warp_external_input_check_int256, warp_external_input_check_int24
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.gt import warp_gt, warp_gt256
from warplib.maths.lt import warp_lt, warp_lt256
from warplib.maths.sub import warp_sub256
from warplib.maths.le import warp_le256, warp_le
from warplib.maths.lt_signed import warp_lt_signed256
from warplib.maths.negate import warp_negate256
from warplib.maths.add import warp_add256
from warplib.maths.eq import warp_eq, warp_eq256
from warplib.maths.neq import warp_neq
from warplib.maths.ge import warp_ge, warp_ge256
from warplib.maths.ge_signed import warp_ge_signed256
from warplib.maths.sub_unsafe import warp_sub_unsafe24, warp_sub_unsafe256, warp_sub_unsafe160
from warplib.maths.int_conversions import warp_uint256, warp_int256_to_int160
from warplib.maths.mul_unsafe import warp_mul_unsafe256
from warplib.maths.mulmod import warp_mulmod
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.bitwise_or import warp_bitwise_or256
from warplib.maths.xor import warp_xor256
from warplib.maths.mul import warp_mul256
from warplib.maths.div import warp_div256
from warplib.maths.shl import warp_shl256
from warplib.maths.mod import warp_mod256


// Contract Def SwapMathEchidnaTest


namespace SwapMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func checkComputeSwapStepInvariants_d7e3056f_if_part1{range_check_ptr : felt}(__warp_0_sqrtPriceRaw : felt, __warp_1_sqrtPriceTargetRaw : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256, __warp_5_sqrtQ : felt, __warp_3_amountRemaining : Uint256)-> (){
    alloc_locals;


        
        let (__warp_se_11) = warp_eq(__warp_0_sqrtPriceRaw, __warp_1_sqrtPriceTargetRaw);
        
        if (__warp_se_11 != 0){
        
            
                
                let (__warp_se_12) = warp_eq256(__warp_6_amountIn, Uint256(low=0, high=0));
                
                assert __warp_se_12 = 1;
                
                let (__warp_se_13) = warp_eq256(__warp_7_amountOut, Uint256(low=0, high=0));
                
                assert __warp_se_13 = 1;
                
                let (__warp_se_14) = warp_eq256(__warp_8_feeAmount, Uint256(low=0, high=0));
                
                assert __warp_se_14 = 1;
                
                let (__warp_se_15) = warp_eq(__warp_5_sqrtQ, __warp_1_sqrtPriceTargetRaw);
                
                assert __warp_se_15 = 1;
            
            checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1(__warp_5_sqrtQ, __warp_1_sqrtPriceTargetRaw, __warp_3_amountRemaining, __warp_7_amountOut, __warp_6_amountIn, __warp_8_feeAmount, __warp_0_sqrtPriceRaw);
            
            let __warp_uv102 = ();
            
            
            
            return ();
        }else{
        
            
            checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1(__warp_5_sqrtQ, __warp_1_sqrtPriceTargetRaw, __warp_3_amountRemaining, __warp_7_amountOut, __warp_6_amountIn, __warp_8_feeAmount, __warp_0_sqrtPriceRaw);
            
            let __warp_uv103 = ();
            
            
            
            return ();
        }

    }


    func checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1{range_check_ptr : felt}(__warp_5_sqrtQ : felt, __warp_1_sqrtPriceTargetRaw : felt, __warp_3_amountRemaining : Uint256, __warp_7_amountOut : Uint256, __warp_6_amountIn : Uint256, __warp_8_feeAmount : Uint256, __warp_0_sqrtPriceRaw : felt)-> (){
    alloc_locals;


        
        let (__warp_se_16) = warp_neq(__warp_5_sqrtQ, __warp_1_sqrtPriceTargetRaw);
        
        if (__warp_se_16 != 0){
        
            
                
                let (__warp_se_17) = warp_lt_signed256(__warp_3_amountRemaining, Uint256(low=0, high=0));
                
                if (__warp_se_17 != 0){
                
                    
                        
                        let (__warp_se_18) = warp_negate256(__warp_3_amountRemaining);
                        
                        let (__warp_se_19) = warp_eq256(__warp_7_amountOut, __warp_se_18);
                        
                        assert __warp_se_19 = 1;
                    
                    checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part2(__warp_1_sqrtPriceTargetRaw, __warp_0_sqrtPriceRaw, __warp_5_sqrtQ);
                    
                    let __warp_uv104 = ();
                    
                    
                    
                    return ();
                }else{
                
                    
                        
                        let (__warp_se_20) = warp_add256(__warp_6_amountIn, __warp_8_feeAmount);
                        
                        let (__warp_se_21) = warp_eq256(__warp_se_20, __warp_3_amountRemaining);
                        
                        assert __warp_se_21 = 1;
                    
                    checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part2(__warp_1_sqrtPriceTargetRaw, __warp_0_sqrtPriceRaw, __warp_5_sqrtQ);
                    
                    let __warp_uv105 = ();
                    
                    
                    
                    return ();
                }
        }else{
        
            
            checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part1(__warp_1_sqrtPriceTargetRaw, __warp_0_sqrtPriceRaw, __warp_5_sqrtQ);
            
            let __warp_uv106 = ();
            
            
            
            return ();
        }

    }


    func checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part2{range_check_ptr : felt}(__warp_1_sqrtPriceTargetRaw : felt, __warp_0_sqrtPriceRaw : felt, __warp_5_sqrtQ : felt)-> (){
    alloc_locals;


        
        
        
        checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part1(__warp_1_sqrtPriceTargetRaw, __warp_0_sqrtPriceRaw, __warp_5_sqrtQ);
        
        let __warp_uv107 = ();
        
        
        
        return ();

    }


    func checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part1{range_check_ptr : felt}(__warp_1_sqrtPriceTargetRaw : felt, __warp_0_sqrtPriceRaw : felt, __warp_5_sqrtQ : felt)-> (){
    alloc_locals;


        
        let (__warp_se_22) = warp_le(__warp_1_sqrtPriceTargetRaw, __warp_0_sqrtPriceRaw);
        
        if (__warp_se_22 != 0){
        
            
                
                let (__warp_se_23) = warp_le(__warp_5_sqrtQ, __warp_0_sqrtPriceRaw);
                
                assert __warp_se_23 = 1;
                
                let (__warp_se_24) = warp_ge(__warp_5_sqrtQ, __warp_1_sqrtPriceTargetRaw);
                
                assert __warp_se_24 = 1;
            
            checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part1_if_part1();
            
            let __warp_uv108 = ();
            
            
            
            return ();
        }else{
        
            
                
                let (__warp_se_25) = warp_ge(__warp_5_sqrtQ, __warp_0_sqrtPriceRaw);
                
                assert __warp_se_25 = 1;
                
                let (__warp_se_26) = warp_le(__warp_5_sqrtQ, __warp_1_sqrtPriceTargetRaw);
                
                assert __warp_se_26 = 1;
            
            checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part1_if_part1();
            
            let __warp_uv109 = ();
            
            
            
            return ();
        }

    }


    func checkComputeSwapStepInvariants_d7e3056f_if_part1_if_part1_if_part1_if_part1()-> (){
    alloc_locals;


        
        
        
        return ();

    }

    // @notice Computes the result of swapping some amount in, or amount out, given the parameters of the swap
    // @dev The fee, plus the amount in, will never exceed the amount remaining if the swap's `amountSpecified` is positive
    // @param sqrtRatioCurrentX96 The current sqrt price of the pool
    // @param sqrtRatioTargetX96 The price that cannot be exceeded, from which the direction of the swap is inferred
    // @param liquidity The usable liquidity
    // @param amountRemaining How much input or output amount is remaining to be swapped in/out
    // @param feePips The fee taken from the input amount, expressed in hundredths of a bip
    // @return sqrtRatioNextX96 The price after swapping the amount in/out, not to exceed the price target
    // @return amountIn The amount to be swapped in, of either token0 or token1, based on the direction of the swap
    // @return amountOut The amount to be received, of either token0 or token1, based on the direction of the swap
    // @return feeAmount The amount of input that will be taken as a fee
    func computeSwapStep_100d3f74{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_sqrtRatioCurrentX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_2_liquidity : felt, __warp_3_amountRemaining : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
        let __warp_8_feeAmount = Uint256(low=0, high=0);
        
        let __warp_7_amountOut = Uint256(low=0, high=0);
        
        let __warp_5_sqrtRatioNextX96 = 0;
        
        let __warp_6_amountIn = Uint256(low=0, high=0);
        
            
            let (__warp_9_zeroForOne) = warp_ge(__warp_0_sqrtRatioCurrentX96, __warp_1_sqrtRatioTargetX96);
            
            let (__warp_10_exactIn) = warp_ge_signed256(__warp_3_amountRemaining, Uint256(low=0, high=0));
            
            if (__warp_10_exactIn != 0){
            
                
                    
                    let (__warp_se_27) = warp_sub_unsafe24(1000000, __warp_4_feePips);
                    
                    let (__warp_se_28) = warp_uint256(__warp_se_27);
                    
                    let (__warp_11_amountRemainingLessFee) = mulDiv_aa9a0912(__warp_3_amountRemaining, __warp_se_28, Uint256(low=1000000, high=0));
                    
                    if (__warp_9_zeroForOne != 0){
                    
                        
                            
                            let (__warp_pse_0) = getAmount0Delta_2c32d4b6(__warp_1_sqrtRatioTargetX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, 1);
                            
                            let __warp_6_amountIn = __warp_pse_0;
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part2(__warp_11_amountRemainingLessFee, __warp_6_amountIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_9_zeroForOne, __warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }else{
                    
                        
                            
                            let (__warp_pse_1) = getAmount1Delta_48a0c5bd(__warp_0_sqrtRatioCurrentX96, __warp_1_sqrtRatioTargetX96, __warp_2_liquidity, 1);
                            
                            let __warp_6_amountIn = __warp_pse_1;
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part2(__warp_11_amountRemainingLessFee, __warp_6_amountIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_9_zeroForOne, __warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }
            }else{
            
                
                    
                    if (__warp_9_zeroForOne != 0){
                    
                        
                            
                            let (__warp_pse_2) = getAmount1Delta_48a0c5bd(__warp_1_sqrtRatioTargetX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, 0);
                            
                            let __warp_7_amountOut = __warp_pse_2;
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part3(__warp_3_amountRemaining, __warp_7_amountOut, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_8_feeAmount, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }else{
                    
                        
                            
                            let (__warp_pse_3) = getAmount0Delta_2c32d4b6(__warp_0_sqrtRatioCurrentX96, __warp_1_sqrtRatioTargetX96, __warp_2_liquidity, 0);
                            
                            let __warp_7_amountOut = __warp_pse_3;
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part3(__warp_3_amountRemaining, __warp_7_amountOut, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_8_feeAmount, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }
            }

    }


    func computeSwapStep_100d3f74_if_part3{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_3_amountRemaining : Uint256, __warp_7_amountOut : Uint256, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_0_sqrtRatioCurrentX96 : felt, __warp_2_liquidity : felt, __warp_9_zeroForOne : felt, __warp_10_exactIn : felt, __warp_6_amountIn : Uint256, __warp_8_feeAmount : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let (__warp_se_29) = warp_negate256(__warp_3_amountRemaining);
            
            let (__warp_se_30) = warp_ge256(__warp_se_29, __warp_7_amountOut);
            
            if (__warp_se_30 != 0){
            
                
                    
                    let __warp_5_sqrtRatioNextX96 = __warp_1_sqrtRatioTargetX96;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part3_if_part1(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }else{
            
                
                    
                    let (__warp_se_31) = warp_negate256(__warp_3_amountRemaining);
                    
                    let (__warp_pse_4) = getNextSqrtPriceFromOutput_fedf2b5f(__warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_se_31, __warp_9_zeroForOne);
                    
                    let __warp_5_sqrtRatioNextX96 = __warp_pse_4;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part3_if_part1(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }

    }


    func computeSwapStep_100d3f74_if_part3_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_sqrtRatioTargetX96 : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_9_zeroForOne : felt, __warp_10_exactIn : felt, __warp_6_amountIn : Uint256, __warp_0_sqrtRatioCurrentX96 : felt, __warp_2_liquidity : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_8_feeAmount : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
        
        
        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
        
        
        
        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);

    }


    func computeSwapStep_100d3f74_if_part2{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_11_amountRemainingLessFee : Uint256, __warp_6_amountIn : Uint256, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_0_sqrtRatioCurrentX96 : felt, __warp_2_liquidity : felt, __warp_9_zeroForOne : felt, __warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_8_feeAmount : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let (__warp_se_32) = warp_ge256(__warp_11_amountRemainingLessFee, __warp_6_amountIn);
            
            if (__warp_se_32 != 0){
            
                
                    
                    let __warp_5_sqrtRatioNextX96 = __warp_1_sqrtRatioTargetX96;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part2_if_part1(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }else{
            
                
                    
                    let (__warp_pse_5) = getNextSqrtPriceFromInput_aa58276a(__warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_11_amountRemainingLessFee, __warp_9_zeroForOne);
                    
                    let __warp_5_sqrtRatioNextX96 = __warp_pse_5;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part2_if_part1(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }

    }


    func computeSwapStep_100d3f74_if_part2_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_sqrtRatioTargetX96 : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_9_zeroForOne : felt, __warp_10_exactIn : felt, __warp_6_amountIn : Uint256, __warp_0_sqrtRatioCurrentX96 : felt, __warp_2_liquidity : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_8_feeAmount : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
        
        
        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96, __warp_9_zeroForOne, __warp_10_exactIn, __warp_6_amountIn, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_7_amountOut, __warp_3_amountRemaining, __warp_8_feeAmount, __warp_4_feePips);
        
        
        
        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);

    }


    func __warp_conditional_computeSwapStep_100d3f74_if_part1_1(__warp_12_max : felt, __warp_10_exactIn : felt)-> (__warp_rc_0 : felt, __warp_12_max : felt, __warp_10_exactIn : felt){
    alloc_locals;


        
        if (__warp_12_max != 0){
        
            
            let __warp_rc_0 = __warp_10_exactIn;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_0, __warp_12_max, __warp_10_exactIn);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_0, __warp_12_max, __warp_10_exactIn);
        }

    }


    func __warp_conditional_computeSwapStep_100d3f74_if_part1_3(__warp_12_max : felt, __warp_10_exactIn : felt)-> (__warp_rc_2 : felt, __warp_12_max : felt, __warp_10_exactIn : felt){
    alloc_locals;


        
        if (__warp_12_max != 0){
        
            
            let __warp_rc_2 = __warp_10_exactIn;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_2, __warp_12_max, __warp_10_exactIn);
        }else{
        
            
            let __warp_rc_2 = 0;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_2, __warp_12_max, __warp_10_exactIn);
        }

    }


    func computeSwapStep_100d3f74_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_sqrtRatioTargetX96 : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_9_zeroForOne : felt, __warp_10_exactIn : felt, __warp_6_amountIn : Uint256, __warp_0_sqrtRatioCurrentX96 : felt, __warp_2_liquidity : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_8_feeAmount : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let (__warp_12_max) = warp_eq(__warp_1_sqrtRatioTargetX96, __warp_5_sqrtRatioNextX96);
            
            if (__warp_9_zeroForOne != 0){
            
                
                    
                    let __warp_rc_0 = 0;
                    
                        
                        let (__warp_tv_0, __warp_tv_1, __warp_tv_2) = __warp_conditional_computeSwapStep_100d3f74_if_part1_1(__warp_12_max, __warp_10_exactIn);
                        
                        let __warp_10_exactIn = __warp_tv_2;
                        
                        let __warp_12_max = __warp_tv_1;
                        
                        let __warp_rc_0 = __warp_tv_0;
                    
                    if (1 - __warp_rc_0 != 0){
                    
                        
                            
                            let (__warp_pse_6) = getAmount0Delta_2c32d4b6(__warp_5_sqrtRatioNextX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, 1);
                            
                            let __warp_6_amountIn = __warp_pse_6;
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part2(__warp_12_max, __warp_10_exactIn, __warp_7_amountOut, __warp_5_sqrtRatioNextX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_3_amountRemaining, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }else{
                    
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part2(__warp_12_max, __warp_10_exactIn, __warp_7_amountOut, __warp_5_sqrtRatioNextX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, __warp_3_amountRemaining, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }
            }else{
            
                
                    
                    let __warp_rc_2 = 0;
                    
                        
                        let (__warp_tv_3, __warp_tv_4, __warp_tv_5) = __warp_conditional_computeSwapStep_100d3f74_if_part1_3(__warp_12_max, __warp_10_exactIn);
                        
                        let __warp_10_exactIn = __warp_tv_5;
                        
                        let __warp_12_max = __warp_tv_4;
                        
                        let __warp_rc_2 = __warp_tv_3;
                    
                    if (1 - __warp_rc_2 != 0){
                    
                        
                            
                            let (__warp_pse_7) = getAmount1Delta_48a0c5bd(__warp_0_sqrtRatioCurrentX96, __warp_5_sqrtRatioNextX96, __warp_2_liquidity, 1);
                            
                            let __warp_6_amountIn = __warp_pse_7;
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part3(__warp_12_max, __warp_10_exactIn, __warp_7_amountOut, __warp_0_sqrtRatioCurrentX96, __warp_5_sqrtRatioNextX96, __warp_2_liquidity, __warp_3_amountRemaining, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }else{
                    
                        
                        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part3(__warp_12_max, __warp_10_exactIn, __warp_7_amountOut, __warp_0_sqrtRatioCurrentX96, __warp_5_sqrtRatioNextX96, __warp_2_liquidity, __warp_3_amountRemaining, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                        
                        
                        
                        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                    }
            }

    }


    func __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part3_5(__warp_12_max : felt, __warp_10_exactIn : felt)-> (__warp_rc_4 : felt, __warp_12_max : felt, __warp_10_exactIn : felt){
    alloc_locals;


        
        if (__warp_12_max != 0){
        
            
            let __warp_rc_4 = 1 - __warp_10_exactIn;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_4, __warp_12_max, __warp_10_exactIn);
        }else{
        
            
            let __warp_rc_4 = 0;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_4, __warp_12_max, __warp_10_exactIn);
        }

    }


    func computeSwapStep_100d3f74_if_part1_if_part3{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_max : felt, __warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_0_sqrtRatioCurrentX96 : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_2_liquidity : felt, __warp_3_amountRemaining : Uint256, __warp_1_sqrtRatioTargetX96 : felt, __warp_8_feeAmount : Uint256, __warp_6_amountIn : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let __warp_rc_4 = 0;
            
                
                let (__warp_tv_6, __warp_tv_7, __warp_tv_8) = __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part3_5(__warp_12_max, __warp_10_exactIn);
                
                let __warp_10_exactIn = __warp_tv_8;
                
                let __warp_12_max = __warp_tv_7;
                
                let __warp_rc_4 = __warp_tv_6;
            
            if (1 - __warp_rc_4 != 0){
            
                
                    
                    let (__warp_pse_8) = getAmount0Delta_2c32d4b6(__warp_0_sqrtRatioCurrentX96, __warp_5_sqrtRatioNextX96, __warp_2_liquidity, 0);
                    
                    let __warp_7_amountOut = __warp_pse_8;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part3_if_part1(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }else{
            
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part3_if_part1(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }

    }


    func computeSwapStep_100d3f74_if_part1_if_part3_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_8_feeAmount : Uint256, __warp_6_amountIn : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
        
        
        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part1(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
        
        
        
        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);

    }


    func __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part2_7(__warp_12_max : felt, __warp_10_exactIn : felt)-> (__warp_rc_6 : felt, __warp_12_max : felt, __warp_10_exactIn : felt){
    alloc_locals;


        
        if (__warp_12_max != 0){
        
            
            let __warp_rc_6 = 1 - __warp_10_exactIn;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_6, __warp_12_max, __warp_10_exactIn);
        }else{
        
            
            let __warp_rc_6 = 0;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_12_max = __warp_12_max;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            
            
            return (__warp_rc_6, __warp_12_max, __warp_10_exactIn);
        }

    }


    func computeSwapStep_100d3f74_if_part1_if_part2{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_max : felt, __warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_5_sqrtRatioNextX96 : felt, __warp_0_sqrtRatioCurrentX96 : felt, __warp_2_liquidity : felt, __warp_3_amountRemaining : Uint256, __warp_1_sqrtRatioTargetX96 : felt, __warp_8_feeAmount : Uint256, __warp_6_amountIn : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let __warp_rc_6 = 0;
            
                
                let (__warp_tv_9, __warp_tv_10, __warp_tv_11) = __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part2_7(__warp_12_max, __warp_10_exactIn);
                
                let __warp_10_exactIn = __warp_tv_11;
                
                let __warp_12_max = __warp_tv_10;
                
                let __warp_rc_6 = __warp_tv_9;
            
            if (1 - __warp_rc_6 != 0){
            
                
                    
                    let (__warp_pse_9) = getAmount1Delta_48a0c5bd(__warp_5_sqrtRatioNextX96, __warp_0_sqrtRatioCurrentX96, __warp_2_liquidity, 0);
                    
                    let __warp_7_amountOut = __warp_pse_9;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part2_if_part1(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }else{
            
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part2_if_part1(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }

    }


    func computeSwapStep_100d3f74_if_part1_if_part2_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_8_feeAmount : Uint256, __warp_6_amountIn : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
        
        
        let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part1(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_6_amountIn, __warp_4_feePips);
        
        
        
        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);

    }


    func __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part1_9{range_check_ptr : felt}(__warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256)-> (__warp_rc_8 : felt, __warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256){
    alloc_locals;


        
        if (1 - __warp_10_exactIn != 0){
        
            
            let (__warp_se_33) = warp_negate256(__warp_3_amountRemaining);
            
            let (__warp_se_34) = warp_gt256(__warp_7_amountOut, __warp_se_33);
            
            let __warp_rc_8 = __warp_se_34;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            let __warp_7_amountOut = __warp_7_amountOut;
            
            let __warp_3_amountRemaining = __warp_3_amountRemaining;
            
            
            
            return (__warp_rc_8, __warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining);
        }else{
        
            
            let __warp_rc_8 = 0;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            let __warp_7_amountOut = __warp_7_amountOut;
            
            let __warp_3_amountRemaining = __warp_3_amountRemaining;
            
            
            
            return (__warp_rc_8, __warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining);
        }

    }


    func computeSwapStep_100d3f74_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_exactIn : felt, __warp_7_amountOut : Uint256, __warp_3_amountRemaining : Uint256, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_8_feeAmount : Uint256, __warp_6_amountIn : Uint256, __warp_4_feePips : felt)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let __warp_rc_8 = 0;
            
                
                let (__warp_tv_12, __warp_tv_13, __warp_tv_14, __warp_tv_15) = __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part1_9(__warp_10_exactIn, __warp_7_amountOut, __warp_3_amountRemaining);
                
                let __warp_3_amountRemaining = __warp_tv_15;
                
                let __warp_7_amountOut = __warp_tv_14;
                
                let __warp_10_exactIn = __warp_tv_13;
                
                let __warp_rc_8 = __warp_tv_12;
            
            if (__warp_rc_8 != 0){
            
                
                    
                    let (__warp_se_35) = warp_negate256(__warp_3_amountRemaining);
                    
                    let __warp_7_amountOut = __warp_se_35;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part1_if_part1(__warp_10_exactIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_3_amountRemaining, __warp_6_amountIn, __warp_4_feePips, __warp_7_amountOut);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }else{
            
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part1_if_part1(__warp_10_exactIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96, __warp_8_feeAmount, __warp_3_amountRemaining, __warp_6_amountIn, __warp_4_feePips, __warp_7_amountOut);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }

    }


    func __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part1_if_part1_11(__warp_10_exactIn : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt)-> (__warp_rc_10 : felt, __warp_10_exactIn : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt){
    alloc_locals;


        
        if (__warp_10_exactIn != 0){
        
            
            let (__warp_se_36) = warp_neq(__warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96);
            
            let __warp_rc_10 = __warp_se_36;
            
            let __warp_rc_10 = __warp_rc_10;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            let __warp_5_sqrtRatioNextX96 = __warp_5_sqrtRatioNextX96;
            
            let __warp_1_sqrtRatioTargetX96 = __warp_1_sqrtRatioTargetX96;
            
            
            
            return (__warp_rc_10, __warp_10_exactIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96);
        }else{
        
            
            let __warp_rc_10 = 0;
            
            let __warp_rc_10 = __warp_rc_10;
            
            let __warp_10_exactIn = __warp_10_exactIn;
            
            let __warp_5_sqrtRatioNextX96 = __warp_5_sqrtRatioNextX96;
            
            let __warp_1_sqrtRatioTargetX96 = __warp_1_sqrtRatioTargetX96;
            
            
            
            return (__warp_rc_10, __warp_10_exactIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96);
        }

    }


    func computeSwapStep_100d3f74_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_exactIn : felt, __warp_5_sqrtRatioNextX96 : felt, __warp_1_sqrtRatioTargetX96 : felt, __warp_8_feeAmount : Uint256, __warp_3_amountRemaining : Uint256, __warp_6_amountIn : Uint256, __warp_4_feePips : felt, __warp_7_amountOut : Uint256)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
            
            let __warp_rc_10 = 0;
            
                
                let (__warp_tv_16, __warp_tv_17, __warp_tv_18, __warp_tv_19) = __warp_conditional_computeSwapStep_100d3f74_if_part1_if_part1_if_part1_11(__warp_10_exactIn, __warp_5_sqrtRatioNextX96, __warp_1_sqrtRatioTargetX96);
                
                let __warp_1_sqrtRatioTargetX96 = __warp_tv_19;
                
                let __warp_5_sqrtRatioNextX96 = __warp_tv_18;
                
                let __warp_10_exactIn = __warp_tv_17;
                
                let __warp_rc_10 = __warp_tv_16;
            
            if (__warp_rc_10 != 0){
            
                
                    
                    let (__warp_se_37) = warp_sub_unsafe256(__warp_3_amountRemaining, __warp_6_amountIn);
                    
                    let __warp_8_feeAmount = __warp_se_37;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part1_if_part1_if_part1(__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }else{
            
                
                    
                    let (__warp_se_38) = warp_uint256(__warp_4_feePips);
                    
                    let (__warp_se_39) = warp_sub_unsafe24(1000000, __warp_4_feePips);
                    
                    let (__warp_se_40) = warp_uint256(__warp_se_39);
                    
                    let (__warp_pse_10) = mulDivRoundingUp_0af8b27f(__warp_6_amountIn, __warp_se_38, __warp_se_40);
                    
                    let __warp_8_feeAmount = __warp_pse_10;
                
                let (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = computeSwapStep_100d3f74_if_part1_if_part1_if_part1_if_part1(__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
                
                
                
                return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);
            }

    }


    func computeSwapStep_100d3f74_if_part1_if_part1_if_part1_if_part1(__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256)-> (__warp_5_sqrtRatioNextX96 : felt, __warp_6_amountIn : Uint256, __warp_7_amountOut : Uint256, __warp_8_feeAmount : Uint256){
    alloc_locals;


        
        
        
        let __warp_5_sqrtRatioNextX96 = __warp_5_sqrtRatioNextX96;
        
        let __warp_6_amountIn = __warp_6_amountIn;
        
        let __warp_7_amountOut = __warp_7_amountOut;
        
        let __warp_8_feeAmount = __warp_8_feeAmount;
        
        
        
        return (__warp_5_sqrtRatioNextX96, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount);

    }

    // @notice Calculates floor(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    // @param a The multiplicand
    // @param b The multiplier
    // @param denominator The divisor
    // @return result The 256-bit result
    // @dev Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv
    func mulDiv_aa9a0912{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_a : Uint256, __warp_1_b : Uint256, __warp_2_denominator : Uint256)-> (__warp_3_result : Uint256){
    alloc_locals;


        
        let __warp_3_result = Uint256(low=0, high=0);
        
        let __warp_4_prod0 = Uint256(low=0, high=0);
        
            
            let (__warp_se_41) = warp_mul_unsafe256(__warp_0_a, __warp_1_b);
            
            let __warp_4_prod0 = __warp_se_41;
            
            let (__warp_5_mm) = warp_mulmod(__warp_0_a, __warp_1_b, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
            
            let __warp_6_prod1 = Uint256(low=0, high=0);
            
            let (__warp_se_42) = warp_sub_unsafe256(__warp_5_mm, __warp_4_prod0);
            
            let __warp_6_prod1 = __warp_se_42;
            
            let (__warp_se_43) = warp_lt256(__warp_5_mm, __warp_4_prod0);
            
            if (__warp_se_43 != 0){
            
                
                    
                    let (__warp_se_44) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_44;
                
                let (__warp_pse_11) = mulDiv_aa9a0912_if_part1(__warp_6_prod1, __warp_2_denominator, __warp_3_result, __warp_4_prod0, __warp_0_a, __warp_1_b);
                
                
                
                return (__warp_pse_11,);
            }else{
            
                
                let (__warp_pse_12) = mulDiv_aa9a0912_if_part1(__warp_6_prod1, __warp_2_denominator, __warp_3_result, __warp_4_prod0, __warp_0_a, __warp_1_b);
                
                
                
                return (__warp_pse_12,);
            }

    }


    func mulDiv_aa9a0912_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_6_prod1 : Uint256, __warp_2_denominator : Uint256, __warp_3_result : Uint256, __warp_4_prod0 : Uint256, __warp_0_a : Uint256, __warp_1_b : Uint256)-> (__warp_3_result : Uint256){
    alloc_locals;


        
            
            let (__warp_se_45) = warp_eq256(__warp_6_prod1, Uint256(low=0, high=0));
            
            if (__warp_se_45 != 0){
            
                
                    
                    let (__warp_se_46) = warp_gt256(__warp_2_denominator, Uint256(low=0, high=0));
                    
                    assert __warp_se_46 = 1;
                    
                    let (__warp_se_47) = warp_div_unsafe256(__warp_4_prod0, __warp_2_denominator);
                    
                    let __warp_3_result = __warp_se_47;
                    
                    
                    
                    return (__warp_3_result,);
            }else{
            
                
                let (__warp_pse_14) = mulDiv_aa9a0912_if_part1_if_part1(__warp_2_denominator, __warp_6_prod1, __warp_0_a, __warp_1_b, __warp_4_prod0, __warp_3_result);
                
                
                
                return (__warp_pse_14,);
            }

    }


    func mulDiv_aa9a0912_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_denominator : Uint256, __warp_6_prod1 : Uint256, __warp_0_a : Uint256, __warp_1_b : Uint256, __warp_4_prod0 : Uint256, __warp_3_result : Uint256)-> (__warp_3_result : Uint256){
    alloc_locals;


        
            
            let (__warp_se_48) = warp_gt256(__warp_2_denominator, __warp_6_prod1);
            
            assert __warp_se_48 = 1;
            
            let __warp_7_remainder = Uint256(low=0, high=0);
            
            let (__warp_se_49) = warp_mulmod(__warp_0_a, __warp_1_b, __warp_2_denominator);
            
            let __warp_7_remainder = __warp_se_49;
            
            let (__warp_se_50) = warp_gt256(__warp_7_remainder, __warp_4_prod0);
            
            if (__warp_se_50 != 0){
            
                
                    
                    let (__warp_se_51) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_51;
                
                let (__warp_pse_15) = mulDiv_aa9a0912_if_part1_if_part1_if_part1(__warp_4_prod0, __warp_7_remainder, __warp_2_denominator, __warp_6_prod1, __warp_3_result);
                
                
                
                return (__warp_pse_15,);
            }else{
            
                
                let (__warp_pse_16) = mulDiv_aa9a0912_if_part1_if_part1_if_part1(__warp_4_prod0, __warp_7_remainder, __warp_2_denominator, __warp_6_prod1, __warp_3_result);
                
                
                
                return (__warp_pse_16,);
            }

    }


    func mulDiv_aa9a0912_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_4_prod0 : Uint256, __warp_7_remainder : Uint256, __warp_2_denominator : Uint256, __warp_6_prod1 : Uint256, __warp_3_result : Uint256)-> (__warp_3_result : Uint256){
    alloc_locals;


        
            
            let (__warp_se_52) = warp_sub_unsafe256(__warp_4_prod0, __warp_7_remainder);
            
            let __warp_4_prod0 = __warp_se_52;
            
            let (__warp_se_53) = warp_negate256(__warp_2_denominator);
            
            let (__warp_8_twos) = warp_bitwise_and256(__warp_se_53, __warp_2_denominator);
            
            let (__warp_se_54) = warp_div_unsafe256(__warp_2_denominator, __warp_8_twos);
            
            let __warp_2_denominator = __warp_se_54;
            
            let (__warp_se_55) = warp_div_unsafe256(__warp_4_prod0, __warp_8_twos);
            
            let __warp_4_prod0 = __warp_se_55;
            
            let (__warp_se_56) = warp_sub_unsafe256(Uint256(low=0, high=0), __warp_8_twos);
            
            let (__warp_se_57) = warp_div_unsafe256(__warp_se_56, __warp_8_twos);
            
            let (__warp_se_58) = warp_add_unsafe256(__warp_se_57, Uint256(low=1, high=0));
            
            let __warp_8_twos = __warp_se_58;
            
            let (__warp_se_59) = warp_mul_unsafe256(__warp_6_prod1, __warp_8_twos);
            
            let (__warp_se_60) = warp_bitwise_or256(__warp_4_prod0, __warp_se_59);
            
            let __warp_4_prod0 = __warp_se_60;
            
            let (__warp_se_61) = warp_mul_unsafe256(Uint256(low=3, high=0), __warp_2_denominator);
            
            let (__warp_9_inv) = warp_xor256(__warp_se_61, Uint256(low=2, high=0));
            
            let (__warp_se_62) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_63) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_62);
            
            let (__warp_se_64) = warp_mul_unsafe256(__warp_9_inv, __warp_se_63);
            
            let __warp_9_inv = __warp_se_64;
            
            let (__warp_se_65) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_66) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_65);
            
            let (__warp_se_67) = warp_mul_unsafe256(__warp_9_inv, __warp_se_66);
            
            let __warp_9_inv = __warp_se_67;
            
            let (__warp_se_68) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_69) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_68);
            
            let (__warp_se_70) = warp_mul_unsafe256(__warp_9_inv, __warp_se_69);
            
            let __warp_9_inv = __warp_se_70;
            
            let (__warp_se_71) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_72) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_71);
            
            let (__warp_se_73) = warp_mul_unsafe256(__warp_9_inv, __warp_se_72);
            
            let __warp_9_inv = __warp_se_73;
            
            let (__warp_se_74) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_75) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_74);
            
            let (__warp_se_76) = warp_mul_unsafe256(__warp_9_inv, __warp_se_75);
            
            let __warp_9_inv = __warp_se_76;
            
            let (__warp_se_77) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_78) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_77);
            
            let (__warp_se_79) = warp_mul_unsafe256(__warp_9_inv, __warp_se_78);
            
            let __warp_9_inv = __warp_se_79;
            
            let (__warp_se_80) = warp_mul_unsafe256(__warp_4_prod0, __warp_9_inv);
            
            let __warp_3_result = __warp_se_80;
        
        
        
        return (__warp_3_result,);

    }

    // @notice Calculates ceil(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    // @param a The multiplicand
    // @param b The multiplier
    // @param denominator The divisor
    // @return result The 256-bit result
    func mulDivRoundingUp_0af8b27f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_a : Uint256, __warp_11_b : Uint256, __warp_12_denominator : Uint256)-> (__warp_13_result : Uint256){
    alloc_locals;


        
        let __warp_13_result = Uint256(low=0, high=0);
        
        let (__warp_pse_17) = mulDiv_aa9a0912(__warp_10_a, __warp_11_b, __warp_12_denominator);
        
        let __warp_13_result = __warp_pse_17;
        
            
            let (__warp_se_81) = warp_mulmod(__warp_10_a, __warp_11_b, __warp_12_denominator);
            
            let (__warp_se_82) = warp_gt256(__warp_se_81, Uint256(low=0, high=0));
            
            if (__warp_se_82 != 0){
            
                
                    
                    let (__warp_se_83) = warp_lt256(__warp_13_result, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
                    
                    assert __warp_se_83 = 1;
                    
                    let (__warp_pse_18) = warp_add_unsafe256(__warp_13_result, Uint256(low=1, high=0));
                    
                    let __warp_13_result = __warp_pse_18;
                    
                    warp_sub_unsafe256(__warp_pse_18, Uint256(low=1, high=0));
                
                let (__warp_pse_19) = mulDivRoundingUp_0af8b27f_if_part1(__warp_13_result);
                
                
                
                return (__warp_pse_19,);
            }else{
            
                
                let (__warp_pse_20) = mulDivRoundingUp_0af8b27f_if_part1(__warp_13_result);
                
                
                
                return (__warp_pse_20,);
            }

    }


    func mulDivRoundingUp_0af8b27f_if_part1(__warp_13_result : Uint256)-> (__warp_13_result : Uint256){
    alloc_locals;


        
        
        
        
        
        return (__warp_13_result,);

    }

    // @notice Gets the next sqrt price given a delta of token0
    // @dev Always rounds up, because in the exact output case (increasing price) we need to move the price at least
    // far enough to get the desired output amount, and in the exact input case (decreasing price) we need to move the
    // price less in order to not send too much output.
    // The most precise formula for this is liquidity * sqrtPX96 / (liquidity +- amount * sqrtPX96),
    // if this is impossible because of overflow, we calculate liquidity / (liquidity / sqrtPX96 +- amount).
    // @param sqrtPX96 The starting price, i.e. before accounting for the token0 delta
    // @param liquidity The amount of usable liquidity
    // @param amount How much of token0 to add or remove from virtual reserves
    // @param add Whether to add or remove the amount of token0
    // @return The price after adding or removing amount, depending on add
    func getNextSqrtPriceFromAmount0RoundingUp_157f652f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_sqrtPX96 : felt, __warp_1_liquidity : felt, __warp_2_amount : Uint256, __warp_3_add : felt)-> (__warp_4 : felt){
    alloc_locals;


        
            
            let (__warp_se_84) = warp_eq256(__warp_2_amount, Uint256(low=0, high=0));
            
            if (__warp_se_84 != 0){
            
                
                    
                    
                    
                    return (__warp_0_sqrtPX96,);
            }else{
            
                
                let (__warp_pse_22) = getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1(__warp_1_liquidity, __warp_3_add, __warp_2_amount, __warp_0_sqrtPX96);
                
                
                
                return (__warp_pse_22,);
            }

    }


    func __warp_conditional_getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_13{range_check_ptr : felt}(__warp_8_product : Uint256, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt, __warp_5_numerator1 : Uint256)-> (__warp_rc_12 : felt, __warp_8_product : Uint256, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt, __warp_5_numerator1 : Uint256){
    alloc_locals;


        
        let (__warp_se_85) = warp_uint256(__warp_0_sqrtPX96);
        
        let (__warp_pse_28) = warp_mul256(__warp_2_amount, __warp_se_85);
        
        let __warp_8_product = __warp_pse_28;
        
        let (__warp_se_86) = warp_div256(__warp_pse_28, __warp_2_amount);
        
        let (__warp_se_87) = warp_uint256(__warp_0_sqrtPX96);
        
        let (__warp_se_88) = warp_eq256(__warp_se_86, __warp_se_87);
        
        if (__warp_se_88 != 0){
        
            
            let (__warp_se_89) = warp_gt256(__warp_5_numerator1, __warp_8_product);
            
            let __warp_rc_12 = __warp_se_89;
            
            let __warp_rc_12 = __warp_rc_12;
            
            let __warp_8_product = __warp_8_product;
            
            let __warp_2_amount = __warp_2_amount;
            
            let __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
            
            let __warp_5_numerator1 = __warp_5_numerator1;
            
            
            
            return (__warp_rc_12, __warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
        }else{
        
            
            let __warp_rc_12 = 0;
            
            let __warp_rc_12 = __warp_rc_12;
            
            let __warp_8_product = __warp_8_product;
            
            let __warp_2_amount = __warp_2_amount;
            
            let __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
            
            let __warp_5_numerator1 = __warp_5_numerator1;
            
            
            
            return (__warp_rc_12, __warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
        }

    }


    func getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_liquidity : felt, __warp_3_add : felt, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt)-> (__warp_4 : felt){
    alloc_locals;


        
            
            let (__warp_se_90) = warp_uint256(__warp_1_liquidity);
            
            let (__warp_5_numerator1) = warp_shl256(__warp_se_90, 96);
            
            if (__warp_3_add != 0){
            
                
                    
                    let __warp_6_product = Uint256(low=0, high=0);
                    
                    let (__warp_se_91) = warp_uint256(__warp_0_sqrtPX96);
                    
                    let (__warp_pse_23) = warp_mul_unsafe256(__warp_2_amount, __warp_se_91);
                    
                    let __warp_6_product = __warp_pse_23;
                    
                    let (__warp_se_92) = warp_div_unsafe256(__warp_pse_23, __warp_2_amount);
                    
                    let (__warp_se_93) = warp_uint256(__warp_0_sqrtPX96);
                    
                    let (__warp_se_94) = warp_eq256(__warp_se_92, __warp_se_93);
                    
                    if (__warp_se_94 != 0){
                    
                        
                            
                            let (__warp_7_denominator) = warp_add_unsafe256(__warp_5_numerator1, __warp_6_product);
                            
                            let (__warp_se_95) = warp_ge256(__warp_7_denominator, __warp_5_numerator1);
                            
                            if (__warp_se_95 != 0){
                            
                                
                                    
                                    let (__warp_se_96) = warp_uint256(__warp_0_sqrtPX96);
                                    
                                    let (__warp_pse_24) = mulDivRoundingUp_0af8b27f(__warp_5_numerator1, __warp_se_96, __warp_7_denominator);
                                    
                                    let (__warp_se_97) = warp_int256_to_int160(__warp_pse_24);
                                    
                                    
                                    
                                    return (__warp_se_97,);
                            }else{
                            
                                
                                let (__warp_pse_26) = getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_if_part3(__warp_5_numerator1, __warp_0_sqrtPX96, __warp_2_amount);
                                
                                
                                
                                return (__warp_pse_26,);
                            }
                    }else{
                    
                        
                        let (__warp_pse_27) = getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_if_part2(__warp_5_numerator1, __warp_0_sqrtPX96, __warp_2_amount);
                        
                        
                        
                        return (__warp_pse_27,);
                    }
            }else{
            
                
                    
                    let __warp_8_product = Uint256(low=0, high=0);
                    
                    let __warp_rc_12 = 0;
                    
                        
                        let (__warp_tv_20, __warp_tv_21, __warp_tv_22, __warp_tv_23, __warp_tv_24) = __warp_conditional_getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_13(__warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
                        
                        let __warp_5_numerator1 = __warp_tv_24;
                        
                        let __warp_0_sqrtPX96 = __warp_tv_23;
                        
                        let __warp_2_amount = __warp_tv_22;
                        
                        let __warp_8_product = __warp_tv_21;
                        
                        let __warp_rc_12 = __warp_tv_20;
                    
                    assert __warp_rc_12 = 1;
                    
                    let (__warp_9_denominator) = warp_sub_unsafe256(__warp_5_numerator1, __warp_8_product);
                    
                    let (__warp_se_98) = warp_uint256(__warp_0_sqrtPX96);
                    
                    let (__warp_pse_29) = mulDivRoundingUp_0af8b27f(__warp_5_numerator1, __warp_se_98, __warp_9_denominator);
                    
                    let (__warp_pse_30) = toUint160_dfef6beb(__warp_pse_29);
                    
                    
                    
                    return (__warp_pse_30,);
            }

    }


    func getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_if_part3{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_numerator1 : Uint256, __warp_0_sqrtPX96 : felt, __warp_2_amount : Uint256)-> (__warp_4 : felt){
    alloc_locals;


        
        
        
        let (__warp_pse_32) = getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_if_part2(__warp_5_numerator1, __warp_0_sqrtPX96, __warp_2_amount);
        
        
        
        return (__warp_pse_32,);

    }


    func getNextSqrtPriceFromAmount0RoundingUp_157f652f_if_part1_if_part2{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_numerator1 : Uint256, __warp_0_sqrtPX96 : felt, __warp_2_amount : Uint256)-> (__warp_4 : felt){
    alloc_locals;


        
            
            let (__warp_se_99) = warp_uint256(__warp_0_sqrtPX96);
            
            let (__warp_se_100) = warp_div_unsafe256(__warp_5_numerator1, __warp_se_99);
            
            let (__warp_pse_33) = add_771602f7(__warp_se_100, __warp_2_amount);
            
            let (__warp_pse_34) = divRoundingUp_40226b32(__warp_5_numerator1, __warp_pse_33);
            
            let (__warp_se_101) = warp_int256_to_int160(__warp_pse_34);
            
            
            
            return (__warp_se_101,);

    }

    // @notice Gets the next sqrt price given a delta of token1
    // @dev Always rounds down, because in the exact output case (decreasing price) we need to move the price at least
    // far enough to get the desired output amount, and in the exact input case (increasing price) we need to move the
    // price less in order to not send too much output.
    // The formula we compute is within <1 wei of the lossless version: sqrtPX96 +- amount / liquidity
    // @param sqrtPX96 The starting price, i.e., before accounting for the token1 delta
    // @param liquidity The amount of usable liquidity
    // @param amount How much of token1 to add, or remove, from virtual reserves
    // @param add Whether to add, or remove, the amount of token1
    // @return The price after adding or removing `amount`
    func getNextSqrtPriceFromAmount1RoundingDown_fb4de288{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_sqrtPX96 : felt, __warp_11_liquidity : felt, __warp_12_amount : Uint256, __warp_13_add : felt)-> (__warp_14 : felt){
    alloc_locals;


        
            
            if (__warp_13_add != 0){
            
                
                    
                    let __warp_15_quotient = Uint256(low=0, high=0);
                    
                    let (__warp_se_102) = warp_uint256(1461501637330902918203684832716283019655932542975);
                    
                    let (__warp_se_103) = warp_le256(__warp_12_amount, __warp_se_102);
                    
                    if (__warp_se_103 != 0){
                    
                        
                            
                            let (__warp_se_104) = warp_shl256(__warp_12_amount, 96);
                            
                            let (__warp_se_105) = warp_uint256(__warp_11_liquidity);
                            
                            let (__warp_se_106) = warp_div_unsafe256(__warp_se_104, __warp_se_105);
                            
                            let __warp_15_quotient = __warp_se_106;
                        
                        let (__warp_pse_36) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288_if_part2(__warp_10_sqrtPX96, __warp_15_quotient);
                        
                        
                        
                        return (__warp_pse_36,);
                    }else{
                    
                        
                            
                            let (__warp_se_107) = warp_uint256(__warp_11_liquidity);
                            
                            let (__warp_pse_37) = mulDiv_aa9a0912(__warp_12_amount, Uint256(low=79228162514264337593543950336, high=0), __warp_se_107);
                            
                            let __warp_15_quotient = __warp_pse_37;
                        
                        let (__warp_pse_38) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288_if_part2(__warp_10_sqrtPX96, __warp_15_quotient);
                        
                        
                        
                        return (__warp_pse_38,);
                    }
            }else{
            
                
                    
                    let __warp_16_quotient = Uint256(low=0, high=0);
                    
                    let (__warp_se_108) = warp_uint256(1461501637330902918203684832716283019655932542975);
                    
                    let (__warp_se_109) = warp_le256(__warp_12_amount, __warp_se_108);
                    
                    if (__warp_se_109 != 0){
                    
                        
                            
                            let (__warp_se_110) = warp_shl256(__warp_12_amount, 96);
                            
                            let (__warp_se_111) = warp_uint256(__warp_11_liquidity);
                            
                            let (__warp_pse_39) = divRoundingUp_40226b32(__warp_se_110, __warp_se_111);
                            
                            let __warp_16_quotient = __warp_pse_39;
                        
                        let (__warp_pse_40) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288_if_part3(__warp_10_sqrtPX96, __warp_16_quotient);
                        
                        
                        
                        return (__warp_pse_40,);
                    }else{
                    
                        
                            
                            let (__warp_se_112) = warp_uint256(__warp_11_liquidity);
                            
                            let (__warp_pse_41) = mulDivRoundingUp_0af8b27f(__warp_12_amount, Uint256(low=79228162514264337593543950336, high=0), __warp_se_112);
                            
                            let __warp_16_quotient = __warp_pse_41;
                        
                        let (__warp_pse_42) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288_if_part3(__warp_10_sqrtPX96, __warp_16_quotient);
                        
                        
                        
                        return (__warp_pse_42,);
                    }
            }

    }


    func getNextSqrtPriceFromAmount1RoundingDown_fb4de288_if_part3{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_sqrtPX96 : felt, __warp_16_quotient : Uint256)-> (__warp_14 : felt){
    alloc_locals;


        
            
            let (__warp_se_113) = warp_uint256(__warp_10_sqrtPX96);
            
            let (__warp_se_114) = warp_gt256(__warp_se_113, __warp_16_quotient);
            
            assert __warp_se_114 = 1;
            
            let (__warp_se_115) = warp_uint256(__warp_10_sqrtPX96);
            
            let (__warp_se_116) = warp_sub_unsafe256(__warp_se_115, __warp_16_quotient);
            
            let (__warp_se_117) = warp_int256_to_int160(__warp_se_116);
            
            
            
            return (__warp_se_117,);

    }


    func getNextSqrtPriceFromAmount1RoundingDown_fb4de288_if_part2{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_sqrtPX96 : felt, __warp_15_quotient : Uint256)-> (__warp_14 : felt){
    alloc_locals;


        
            
            let (__warp_se_118) = warp_uint256(__warp_10_sqrtPX96);
            
            let (__warp_pse_44) = add_771602f7(__warp_se_118, __warp_15_quotient);
            
            let (__warp_pse_45) = toUint160_dfef6beb(__warp_pse_44);
            
            
            
            return (__warp_pse_45,);

    }

    // @notice Gets the next sqrt price given an input amount of token0 or token1
    // @dev Throws if price or liquidity are 0, or if the next price is out of bounds
    // @param sqrtPX96 The starting price, i.e., before accounting for the input amount
    // @param liquidity The amount of usable liquidity
    // @param amountIn How much of token0, or token1, is being swapped in
    // @param zeroForOne Whether the amount in is token0 or token1
    // @return sqrtQX96 The price after adding the input amount to token0 or token1
    func getNextSqrtPriceFromInput_aa58276a{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_17_sqrtPX96 : felt, __warp_18_liquidity : felt, __warp_19_amountIn : Uint256, __warp_20_zeroForOne : felt)-> (sqrtQX96 : felt){
    alloc_locals;


        
        let (__warp_se_119) = warp_gt(__warp_17_sqrtPX96, 0);
        
        assert __warp_se_119 = 1;
        
        let (__warp_se_120) = warp_gt(__warp_18_liquidity, 0);
        
        assert __warp_se_120 = 1;
        
        if (__warp_20_zeroForOne != 0){
        
            
            let (__warp_pse_47) = getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_17_sqrtPX96, __warp_18_liquidity, __warp_19_amountIn, 1);
            
            
            
            return (__warp_pse_47,);
        }else{
        
            
            let (__warp_pse_48) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_17_sqrtPX96, __warp_18_liquidity, __warp_19_amountIn, 1);
            
            
            
            return (__warp_pse_48,);
        }

    }

    // @notice Gets the next sqrt price given an output amount of token0 or token1
    // @dev Throws if price or liquidity are 0 or the next price is out of bounds
    // @param sqrtPX96 The starting price before accounting for the output amount
    // @param liquidity The amount of usable liquidity
    // @param amountOut How much of token0, or token1, is being swapped out
    // @param zeroForOne Whether the amount out is token0 or token1
    // @return sqrtQX96 The price after removing the output amount of token0 or token1
    func getNextSqrtPriceFromOutput_fedf2b5f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_21_sqrtPX96 : felt, __warp_22_liquidity : felt, __warp_23_amountOut : Uint256, __warp_24_zeroForOne : felt)-> (sqrtQX96 : felt){
    alloc_locals;


        
        let (__warp_se_121) = warp_gt(__warp_21_sqrtPX96, 0);
        
        assert __warp_se_121 = 1;
        
        let (__warp_se_122) = warp_gt(__warp_22_liquidity, 0);
        
        assert __warp_se_122 = 1;
        
        if (__warp_24_zeroForOne != 0){
        
            
            let (__warp_pse_49) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_21_sqrtPX96, __warp_22_liquidity, __warp_23_amountOut, 0);
            
            
            
            return (__warp_pse_49,);
        }else{
        
            
            let (__warp_pse_50) = getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_21_sqrtPX96, __warp_22_liquidity, __warp_23_amountOut, 0);
            
            
            
            return (__warp_pse_50,);
        }

    }

    // @notice Gets the amount0 delta between two prices
    // @dev Calculates liquidity / sqrt(lower) - liquidity / sqrt(upper),
    // i.e. liquidity * (sqrt(upper) - sqrt(lower)) / (sqrt(upper) * sqrt(lower))
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The amount of usable liquidity
    // @param roundUp Whether to round the amount up or down
    // @return amount0 Amount of token0 required to cover a position of size liquidity between the two passed prices
    func getAmount0Delta_2c32d4b6{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_25_sqrtRatioAX96 : felt, __warp_26_sqrtRatioBX96 : felt, __warp_27_liquidity : felt, __warp_28_roundUp : felt)-> (amount0 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_123) = warp_gt(__warp_25_sqrtRatioAX96, __warp_26_sqrtRatioBX96);
            
            if (__warp_se_123 != 0){
            
                
                    
                        
                        let __warp_tv_25 = __warp_26_sqrtRatioBX96;
                        
                        let __warp_tv_26 = __warp_25_sqrtRatioAX96;
                        
                        let __warp_26_sqrtRatioBX96 = __warp_tv_26;
                        
                        let __warp_25_sqrtRatioAX96 = __warp_tv_25;
                
                let (__warp_pse_51) = getAmount0Delta_2c32d4b6_if_part1(__warp_27_liquidity, __warp_26_sqrtRatioBX96, __warp_25_sqrtRatioAX96, __warp_28_roundUp);
                
                
                
                return (__warp_pse_51,);
            }else{
            
                
                let (__warp_pse_52) = getAmount0Delta_2c32d4b6_if_part1(__warp_27_liquidity, __warp_26_sqrtRatioBX96, __warp_25_sqrtRatioAX96, __warp_28_roundUp);
                
                
                
                return (__warp_pse_52,);
            }

    }


    func getAmount0Delta_2c32d4b6_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_27_liquidity : felt, __warp_26_sqrtRatioBX96 : felt, __warp_25_sqrtRatioAX96 : felt, __warp_28_roundUp : felt)-> (amount0 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_124) = warp_uint256(__warp_27_liquidity);
            
            let (__warp_29_numerator1) = warp_shl256(__warp_se_124, 96);
            
            let (__warp_se_125) = warp_sub_unsafe160(__warp_26_sqrtRatioBX96, __warp_25_sqrtRatioAX96);
            
            let (__warp_30_numerator2) = warp_uint256(__warp_se_125);
            
            let (__warp_se_126) = warp_gt(__warp_25_sqrtRatioAX96, 0);
            
            assert __warp_se_126 = 1;
            
            if (__warp_28_roundUp != 0){
            
                
                    
                    let (__warp_se_127) = warp_uint256(__warp_26_sqrtRatioBX96);
                    
                    let (__warp_pse_53) = mulDivRoundingUp_0af8b27f(__warp_29_numerator1, __warp_30_numerator2, __warp_se_127);
                    
                    let (__warp_se_128) = warp_uint256(__warp_25_sqrtRatioAX96);
                    
                    let (__warp_pse_54) = divRoundingUp_40226b32(__warp_pse_53, __warp_se_128);
                    
                    
                    
                    return (__warp_pse_54,);
            }else{
            
                
                    
                    let (__warp_se_129) = warp_uint256(__warp_26_sqrtRatioBX96);
                    
                    let (__warp_pse_56) = mulDiv_aa9a0912(__warp_29_numerator1, __warp_30_numerator2, __warp_se_129);
                    
                    let (__warp_se_130) = warp_uint256(__warp_25_sqrtRatioAX96);
                    
                    let (__warp_se_131) = warp_div_unsafe256(__warp_pse_56, __warp_se_130);
                    
                    
                    
                    return (__warp_se_131,);
            }

    }

    // @notice Gets the amount1 delta between two prices
    // @dev Calculates liquidity * (sqrt(upper) - sqrt(lower))
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The amount of usable liquidity
    // @param roundUp Whether to round the amount up, or down
    // @return amount1 Amount of token1 required to cover a position of size liquidity between the two passed prices
    func getAmount1Delta_48a0c5bd{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_31_sqrtRatioAX96 : felt, __warp_32_sqrtRatioBX96 : felt, __warp_33_liquidity : felt, __warp_34_roundUp : felt)-> (amount1 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_132) = warp_gt(__warp_31_sqrtRatioAX96, __warp_32_sqrtRatioBX96);
            
            if (__warp_se_132 != 0){
            
                
                    
                        
                        let __warp_tv_27 = __warp_32_sqrtRatioBX96;
                        
                        let __warp_tv_28 = __warp_31_sqrtRatioAX96;
                        
                        let __warp_32_sqrtRatioBX96 = __warp_tv_28;
                        
                        let __warp_31_sqrtRatioAX96 = __warp_tv_27;
                
                let (__warp_pse_58) = getAmount1Delta_48a0c5bd_if_part1(__warp_34_roundUp, __warp_33_liquidity, __warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                
                
                
                return (__warp_pse_58,);
            }else{
            
                
                let (__warp_pse_59) = getAmount1Delta_48a0c5bd_if_part1(__warp_34_roundUp, __warp_33_liquidity, __warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                
                
                
                return (__warp_pse_59,);
            }

    }


    func getAmount1Delta_48a0c5bd_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_34_roundUp : felt, __warp_33_liquidity : felt, __warp_32_sqrtRatioBX96 : felt, __warp_31_sqrtRatioAX96 : felt)-> (amount1 : Uint256){
    alloc_locals;


        
            
            if (__warp_34_roundUp != 0){
            
                
                    
                    let (__warp_se_133) = warp_uint256(__warp_33_liquidity);
                    
                    let (__warp_se_134) = warp_sub_unsafe160(__warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                    
                    let (__warp_se_135) = warp_uint256(__warp_se_134);
                    
                    let (__warp_pse_60) = mulDivRoundingUp_0af8b27f(__warp_se_133, __warp_se_135, Uint256(low=79228162514264337593543950336, high=0));
                    
                    
                    
                    return (__warp_pse_60,);
            }else{
            
                
                    
                    let (__warp_se_136) = warp_uint256(__warp_33_liquidity);
                    
                    let (__warp_se_137) = warp_sub_unsafe160(__warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                    
                    let (__warp_se_138) = warp_uint256(__warp_se_137);
                    
                    let (__warp_pse_62) = mulDiv_aa9a0912(__warp_se_136, __warp_se_138, Uint256(low=79228162514264337593543950336, high=0));
                    
                    
                    
                    return (__warp_pse_62,);
            }

    }

    // @notice Returns ceil(x / y)
    // @dev division by 0 has unspecified behavior, and must be checked externally
    // @param x The dividend
    // @param y The divisor
    // @return z The quotient, ceil(x / y)
    func divRoundingUp_40226b32{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let __warp_3_temp = Uint256(low=0, high=0);
            
            let (__warp_se_139) = warp_mod256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_140) = warp_gt256(__warp_se_139, Uint256(low=0, high=0));
            
            if (__warp_se_140 != 0){
            
                
                    
                    let __warp_3_temp = Uint256(low=1, high=0);
                
                let (__warp_pse_72) = divRoundingUp_40226b32_if_part1(__warp_2_z, __warp_0_x, __warp_1_y, __warp_3_temp);
                
                
                
                return (__warp_pse_72,);
            }else{
            
                
                let (__warp_pse_73) = divRoundingUp_40226b32_if_part1(__warp_2_z, __warp_0_x, __warp_1_y, __warp_3_temp);
                
                
                
                return (__warp_pse_73,);
            }

    }


    func divRoundingUp_40226b32_if_part1{range_check_ptr : felt}(__warp_2_z : Uint256, __warp_0_x : Uint256, __warp_1_y : Uint256, __warp_3_temp : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
            
            let (__warp_se_141) = warp_div_unsafe256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_142) = warp_add_unsafe256(__warp_se_141, __warp_3_temp);
            
            let __warp_2_z = __warp_se_142;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Returns x + y, reverts if sum overflows uint256
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_771602f7{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_74) = warp_add_unsafe256(__warp_0_x, __warp_1_y);
            
            let __warp_2_z = __warp_pse_74;
            
            let (__warp_se_143) = warp_ge256(__warp_pse_74, __warp_0_x);
            
            assert __warp_se_143 = 1;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Cast a uint256 to a uint160, revert on overflow
    // @param y The uint256 to be downcasted
    // @return z The downcasted integer, now type uint160
    func toUint160_dfef6beb{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_y : Uint256)-> (__warp_1_z : felt){
    alloc_locals;


        
        let __warp_1_z = 0;
        
        let (__warp_pse_79) = warp_int256_to_int160(__warp_0_y);
        
        let __warp_1_z = __warp_pse_79;
        
        let (__warp_se_144) = warp_uint256(__warp_pse_79);
        
        let (__warp_se_145) = warp_eq256(__warp_se_144, __warp_0_y);
        
        assert __warp_se_145 = 1;
        
        
        
        return (__warp_1_z,);

    }

}


    @view
    func checkComputeSwapStepInvariants_d7e3056f{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_sqrtPriceRaw : felt, __warp_1_sqrtPriceTargetRaw : felt, __warp_2_liquidity : felt, __warp_3_amountRemaining : Uint256, __warp_4_feePips : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_4_feePips);
        
        warp_external_input_check_int256(__warp_3_amountRemaining);
        
        warp_external_input_check_int128(__warp_2_liquidity);
        
        warp_external_input_check_int160(__warp_1_sqrtPriceTargetRaw);
        
        warp_external_input_check_int160(__warp_0_sqrtPriceRaw);
        
        let (__warp_se_0) = warp_gt(__warp_0_sqrtPriceRaw, 0);
        
        assert __warp_se_0 = 1;
        
        let (__warp_se_1) = warp_gt(__warp_1_sqrtPriceTargetRaw, 0);
        
        assert __warp_se_1 = 1;
        
        let (__warp_se_2) = warp_gt(__warp_4_feePips, 0);
        
        assert __warp_se_2 = 1;
        
        let (__warp_se_3) = warp_lt(__warp_4_feePips, 1000000);
        
        assert __warp_se_3 = 1;
        
        let (__warp_5_sqrtQ, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount) = SwapMathEchidnaTest.computeSwapStep_100d3f74(__warp_0_sqrtPriceRaw, __warp_1_sqrtPriceTargetRaw, __warp_2_liquidity, __warp_3_amountRemaining, __warp_4_feePips);
        
        let (__warp_se_4) = warp_sub256(Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455), __warp_8_feeAmount);
        
        let (__warp_se_5) = warp_le256(__warp_6_amountIn, __warp_se_4);
        
        assert __warp_se_5 = 1;
        
        let (__warp_se_6) = warp_lt_signed256(__warp_3_amountRemaining, Uint256(low=0, high=0));
        
        if (__warp_se_6 != 0){
        
            
                
                let (__warp_se_7) = warp_negate256(__warp_3_amountRemaining);
                
                let (__warp_se_8) = warp_le256(__warp_7_amountOut, __warp_se_7);
                
                assert __warp_se_8 = 1;
            
            SwapMathEchidnaTest.checkComputeSwapStepInvariants_d7e3056f_if_part1(__warp_0_sqrtPriceRaw, __warp_1_sqrtPriceTargetRaw, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount, __warp_5_sqrtQ, __warp_3_amountRemaining);
            
            let __warp_uv100 = ();
            
            
            
            return ();
        }else{
        
            
                
                let (__warp_se_9) = warp_add256(__warp_6_amountIn, __warp_8_feeAmount);
                
                let (__warp_se_10) = warp_le256(__warp_se_9, __warp_3_amountRemaining);
                
                assert __warp_se_10 = 1;
            
            SwapMathEchidnaTest.checkComputeSwapStepInvariants_d7e3056f_if_part1(__warp_0_sqrtPriceRaw, __warp_1_sqrtPriceTargetRaw, __warp_6_amountIn, __warp_7_amountOut, __warp_8_feeAmount, __warp_5_sqrtQ, __warp_3_amountRemaining);
            
            let __warp_uv101 = ();
            
            
            
            return ();
        }

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;


        
        
        
        return ();

    }

@storage_var
func WARP_STORAGE(index: felt) -> (val: felt){
}
@storage_var
func WARP_USED_STORAGE() -> (val: felt){
}
@storage_var
func WARP_NAMEGEN() -> (name: felt){
}
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) -> (val: felt){
    alloc_locals;
    let (id) = WARP_STORAGE.read(loc);
    if (id == 0){
        let (id) = WARP_NAMEGEN.read();
        WARP_NAMEGEN.write(id + 1);
        WARP_STORAGE.write(loc, id + 1);
        return (id + 1,);
    }else{
        return (id,);
    }
}