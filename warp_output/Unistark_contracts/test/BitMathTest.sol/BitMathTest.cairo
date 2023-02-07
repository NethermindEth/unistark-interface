%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.gt import warp_gt256
from warplib.maths.ge import warp_ge256
from warplib.maths.shr import warp_shr256
from warplib.maths.add_unsafe import warp_add_unsafe8
from warplib.maths.int_conversions import warp_uint256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.sub_unsafe import warp_sub_unsafe8


// Contract Def BitMathTest


namespace BitMathTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    // @notice Returns the index of the most significant bit of the number,
    //     where the least significant bit is at index 0 and the most significant bit is at index 255
    // @dev The function satisfies the property:
    //     x >= 2**mostSignificantBit(x) and x < 2**(mostSignificantBit(x)+1)
    // @param x the value for which to compute the most significant bit, must be greater than 0
    // @return r the index of the most significant bit
    func s1_mostSignificantBit_e6bcbc65{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256)-> (__warp_1_r : felt){
    alloc_locals;


        
        let __warp_1_r = 0;
        
            
            let (__warp_se_0) = warp_gt256(__warp_0_x, Uint256(low=0, high=0));
            
            assert __warp_se_0 = 1;
            
            let (__warp_se_1) = warp_ge256(__warp_0_x, Uint256(low=0, high=1));
            
            if (__warp_se_1 != 0){
            
                
                    
                    let (__warp_se_2) = warp_shr256(__warp_0_x, 128);
                    
                    let __warp_0_x = __warp_se_2;
                    
                    let (__warp_se_3) = warp_add_unsafe8(__warp_1_r, 128);
                    
                    let __warp_1_r = __warp_se_3;
                
                let (__warp_pse_2) = s1_mostSignificantBit_e6bcbc65_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_2,);
            }else{
            
                
                let (__warp_pse_3) = s1_mostSignificantBit_e6bcbc65_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_3,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_4) = warp_ge256(__warp_0_x, Uint256(low=18446744073709551616, high=0));
            
            if (__warp_se_4 != 0){
            
                
                    
                    let (__warp_se_5) = warp_shr256(__warp_0_x, 64);
                    
                    let __warp_0_x = __warp_se_5;
                    
                    let (__warp_se_6) = warp_add_unsafe8(__warp_1_r, 64);
                    
                    let __warp_1_r = __warp_se_6;
                
                let (__warp_pse_4) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_4,);
            }else{
            
                
                let (__warp_pse_5) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_5,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_7) = warp_ge256(__warp_0_x, Uint256(low=4294967296, high=0));
            
            if (__warp_se_7 != 0){
            
                
                    
                    let (__warp_se_8) = warp_shr256(__warp_0_x, 32);
                    
                    let __warp_0_x = __warp_se_8;
                    
                    let (__warp_se_9) = warp_add_unsafe8(__warp_1_r, 32);
                    
                    let __warp_1_r = __warp_se_9;
                
                let (__warp_pse_6) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_6,);
            }else{
            
                
                let (__warp_pse_7) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_7,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_10) = warp_ge256(__warp_0_x, Uint256(low=65536, high=0));
            
            if (__warp_se_10 != 0){
            
                
                    
                    let (__warp_se_11) = warp_shr256(__warp_0_x, 16);
                    
                    let __warp_0_x = __warp_se_11;
                    
                    let (__warp_se_12) = warp_add_unsafe8(__warp_1_r, 16);
                    
                    let __warp_1_r = __warp_se_12;
                
                let (__warp_pse_8) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_8,);
            }else{
            
                
                let (__warp_pse_9) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_9,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_13) = warp_ge256(__warp_0_x, Uint256(low=256, high=0));
            
            if (__warp_se_13 != 0){
            
                
                    
                    let (__warp_se_14) = warp_shr256(__warp_0_x, 8);
                    
                    let __warp_0_x = __warp_se_14;
                    
                    let (__warp_se_15) = warp_add_unsafe8(__warp_1_r, 8);
                    
                    let __warp_1_r = __warp_se_15;
                
                let (__warp_pse_10) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_10,);
            }else{
            
                
                let (__warp_pse_11) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_11,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_16) = warp_ge256(__warp_0_x, Uint256(low=16, high=0));
            
            if (__warp_se_16 != 0){
            
                
                    
                    let (__warp_se_17) = warp_shr256(__warp_0_x, 4);
                    
                    let __warp_0_x = __warp_se_17;
                    
                    let (__warp_se_18) = warp_add_unsafe8(__warp_1_r, 4);
                    
                    let __warp_1_r = __warp_se_18;
                
                let (__warp_pse_12) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_12,);
            }else{
            
                
                let (__warp_pse_13) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_13,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_19) = warp_ge256(__warp_0_x, Uint256(low=4, high=0));
            
            if (__warp_se_19 != 0){
            
                
                    
                    let (__warp_se_20) = warp_shr256(__warp_0_x, 2);
                    
                    let __warp_0_x = __warp_se_20;
                    
                    let (__warp_se_21) = warp_add_unsafe8(__warp_1_r, 2);
                    
                    let __warp_1_r = __warp_se_21;
                
                let (__warp_pse_14) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_14,);
            }else{
            
                
                let (__warp_pse_15) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_0_x, __warp_1_r);
                
                
                
                return (__warp_pse_15,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
            
            let (__warp_se_22) = warp_ge256(__warp_0_x, Uint256(low=2, high=0));
            
            if (__warp_se_22 != 0){
            
                
                    
                    let (__warp_se_23) = warp_add_unsafe8(__warp_1_r, 1);
                    
                    let __warp_1_r = __warp_se_23;
                
                let (__warp_pse_16) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_1_r);
                
                
                
                return (__warp_pse_16,);
            }else{
            
                
                let (__warp_pse_17) = s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_1_r);
                
                
                
                return (__warp_pse_17,);
            }

    }


    func s1_mostSignificantBit_e6bcbc65_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_1_r : felt)-> (__warp_1_r : felt){
    alloc_locals;


        
        
        
        
        
        return (__warp_1_r,);

    }

    // @notice Returns the index of the least significant bit of the number,
    //     where the least significant bit is at index 0 and the most significant bit is at index 255
    // @dev The function satisfies the property:
    //     (x & 2**leastSignificantBit(x)) != 0 and (x & (2**(leastSignificantBit(x)) - 1)) == 0)
    // @param x the value for which to compute the least significant bit, must be greater than 0
    // @return r the index of the least significant bit
    func s1_leastSignificantBit_d230d23f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256)-> (__warp_3_r : felt){
    alloc_locals;


        
        let __warp_3_r = 0;
        
            
            let (__warp_se_24) = warp_gt256(__warp_2_x, Uint256(low=0, high=0));
            
            assert __warp_se_24 = 1;
            
            let __warp_3_r = 255;
            
            let (__warp_se_25) = warp_uint256(340282366920938463463374607431768211455);
            
            let (__warp_se_26) = warp_bitwise_and256(__warp_2_x, __warp_se_25);
            
            let (__warp_se_27) = warp_gt256(__warp_se_26, Uint256(low=0, high=0));
            
            if (__warp_se_27 != 0){
            
                
                    
                    let (__warp_se_28) = warp_sub_unsafe8(__warp_3_r, 128);
                    
                    let __warp_3_r = __warp_se_28;
                
                let (__warp_pse_18) = s1_leastSignificantBit_d230d23f_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_18,);
            }else{
            
                
                    
                    let (__warp_se_29) = warp_shr256(__warp_2_x, 128);
                    
                    let __warp_2_x = __warp_se_29;
                
                let (__warp_pse_19) = s1_leastSignificantBit_d230d23f_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_19,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_30) = warp_uint256(18446744073709551615);
            
            let (__warp_se_31) = warp_bitwise_and256(__warp_2_x, __warp_se_30);
            
            let (__warp_se_32) = warp_gt256(__warp_se_31, Uint256(low=0, high=0));
            
            if (__warp_se_32 != 0){
            
                
                    
                    let (__warp_se_33) = warp_sub_unsafe8(__warp_3_r, 64);
                    
                    let __warp_3_r = __warp_se_33;
                
                let (__warp_pse_20) = s1_leastSignificantBit_d230d23f_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_20,);
            }else{
            
                
                    
                    let (__warp_se_34) = warp_shr256(__warp_2_x, 64);
                    
                    let __warp_2_x = __warp_se_34;
                
                let (__warp_pse_21) = s1_leastSignificantBit_d230d23f_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_21,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_35) = warp_uint256(4294967295);
            
            let (__warp_se_36) = warp_bitwise_and256(__warp_2_x, __warp_se_35);
            
            let (__warp_se_37) = warp_gt256(__warp_se_36, Uint256(low=0, high=0));
            
            if (__warp_se_37 != 0){
            
                
                    
                    let (__warp_se_38) = warp_sub_unsafe8(__warp_3_r, 32);
                    
                    let __warp_3_r = __warp_se_38;
                
                let (__warp_pse_22) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_22,);
            }else{
            
                
                    
                    let (__warp_se_39) = warp_shr256(__warp_2_x, 32);
                    
                    let __warp_2_x = __warp_se_39;
                
                let (__warp_pse_23) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_23,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_40) = warp_uint256(65535);
            
            let (__warp_se_41) = warp_bitwise_and256(__warp_2_x, __warp_se_40);
            
            let (__warp_se_42) = warp_gt256(__warp_se_41, Uint256(low=0, high=0));
            
            if (__warp_se_42 != 0){
            
                
                    
                    let (__warp_se_43) = warp_sub_unsafe8(__warp_3_r, 16);
                    
                    let __warp_3_r = __warp_se_43;
                
                let (__warp_pse_24) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_24,);
            }else{
            
                
                    
                    let (__warp_se_44) = warp_shr256(__warp_2_x, 16);
                    
                    let __warp_2_x = __warp_se_44;
                
                let (__warp_pse_25) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_25,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_45) = warp_uint256(255);
            
            let (__warp_se_46) = warp_bitwise_and256(__warp_2_x, __warp_se_45);
            
            let (__warp_se_47) = warp_gt256(__warp_se_46, Uint256(low=0, high=0));
            
            if (__warp_se_47 != 0){
            
                
                    
                    let (__warp_se_48) = warp_sub_unsafe8(__warp_3_r, 8);
                    
                    let __warp_3_r = __warp_se_48;
                
                let (__warp_pse_26) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_26,);
            }else{
            
                
                    
                    let (__warp_se_49) = warp_shr256(__warp_2_x, 8);
                    
                    let __warp_2_x = __warp_se_49;
                
                let (__warp_pse_27) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_27,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_50) = warp_bitwise_and256(__warp_2_x, Uint256(low=15, high=0));
            
            let (__warp_se_51) = warp_gt256(__warp_se_50, Uint256(low=0, high=0));
            
            if (__warp_se_51 != 0){
            
                
                    
                    let (__warp_se_52) = warp_sub_unsafe8(__warp_3_r, 4);
                    
                    let __warp_3_r = __warp_se_52;
                
                let (__warp_pse_28) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_28,);
            }else{
            
                
                    
                    let (__warp_se_53) = warp_shr256(__warp_2_x, 4);
                    
                    let __warp_2_x = __warp_se_53;
                
                let (__warp_pse_29) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_29,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_54) = warp_bitwise_and256(__warp_2_x, Uint256(low=3, high=0));
            
            let (__warp_se_55) = warp_gt256(__warp_se_54, Uint256(low=0, high=0));
            
            if (__warp_se_55 != 0){
            
                
                    
                    let (__warp_se_56) = warp_sub_unsafe8(__warp_3_r, 2);
                    
                    let __warp_3_r = __warp_se_56;
                
                let (__warp_pse_30) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_30,);
            }else{
            
                
                    
                    let (__warp_se_57) = warp_shr256(__warp_2_x, 2);
                    
                    let __warp_2_x = __warp_se_57;
                
                let (__warp_pse_31) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_2_x, __warp_3_r);
                
                
                
                return (__warp_pse_31,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256, __warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
            
            let (__warp_se_58) = warp_bitwise_and256(__warp_2_x, Uint256(low=1, high=0));
            
            let (__warp_se_59) = warp_gt256(__warp_se_58, Uint256(low=0, high=0));
            
            if (__warp_se_59 != 0){
            
                
                    
                    let (__warp_se_60) = warp_sub_unsafe8(__warp_3_r, 1);
                    
                    let __warp_3_r = __warp_se_60;
                
                let (__warp_pse_32) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_3_r);
                
                
                
                return (__warp_pse_32,);
            }else{
            
                
                let (__warp_pse_33) = s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_3_r);
                
                
                
                return (__warp_pse_33,);
            }

    }


    func s1_leastSignificantBit_d230d23f_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(__warp_3_r : felt)-> (__warp_3_r : felt){
    alloc_locals;


        
        
        
        
        
        return (__warp_3_r,);

    }

}


    @view
    func mostSignificantBit_e6bcbc65{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256)-> (r : felt){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_0_x);
        
        let (__warp_pse_0) = BitMathTest.s1_mostSignificantBit_e6bcbc65(__warp_0_x);
        
        
        
        return (__warp_pse_0,);

    }


    @view
    func leastSignificantBit_d230d23f{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_x : Uint256)-> (r : felt){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_1_x);
        
        let (__warp_pse_1) = BitMathTest.s1_leastSignificantBit_d230d23f(__warp_1_x);
        
        
        
        return (__warp_pse_1,);

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