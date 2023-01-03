%lang starknet

from warplib.memory import wm_read_felt, wm_read_256, wm_write_felt, wm_new, wm_index_dyn
from starkware.cairo.common.uint256 import uint256_sub, uint256_add, Uint256
from starkware.cairo.common.alloc import alloc
from warplib.maths.utils import narrow_safe
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from starkware.cairo.common.dict import dict_write

struct cd_dynarray_felt {
    len: felt,
    ptr: felt*,
}

func wm_to_calldata0{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt, warp_memory: DictAccess*
}(mem_loc: felt) -> (retData: cd_dynarray_felt) {
    alloc_locals;
    let (len_256) = wm_read_256(mem_loc);
    let (ptr: felt*) = alloc();
    let (len_felt) = narrow_safe(len_256);
    wm_to_calldata1(len_felt, ptr, mem_loc + 2);
    return (cd_dynarray_felt(len=len_felt, ptr=ptr),);
}

func wm_to_calldata1{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt, warp_memory: DictAccess*
}(len: felt, ptr: felt*, mem_loc: felt) -> () {
    alloc_locals;
    if (len == 0) {
        return ();
    }
    let (mem_read0) = wm_read_felt(mem_loc);
    assert ptr[0] = mem_read0;
    wm_to_calldata1(len=len - 1, ptr=ptr + 1, mem_loc=mem_loc + 1);
    return ();
}

func WS0_READ_felt{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt}(
    loc: felt
) -> (val: felt) {
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS_WRITE0{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt}(
    loc: felt, value: felt
) -> (res: felt) {
    WARP_STORAGE.write(loc, value);
    return (value,);
}

// Contract Def TestRouter

@storage_var
func WARP_STORAGE(index: felt) -> (val: felt) {
}
@storage_var
func WARP_USED_STORAGE() -> (val: felt) {
}
@storage_var
func WARP_NAMEGEN() -> (name: felt) {
}
func readId{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt}(loc: felt) -> (
    val: felt
) {
    alloc_locals;
    let (id) = WARP_STORAGE.read(loc);
    if (id == 0) {
        let (id) = WARP_NAMEGEN.read();
        WARP_NAMEGEN.write(id + 1);
        WARP_STORAGE.write(loc, id + 1);
        return (id + 1,);
    } else {
        return (id,);
    }
}

namespace TestRouter {
    // Dynamic variables - Arrays and Maps

    // Static variables

    const __warp_usrid_00_middleToken = 0;

    func __warp_constructor_0() -> () {
        alloc_locals;

        return ();
    }

    func __warp_init_TestRouter{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt
    }() -> () {
        alloc_locals;

        WS_WRITE0(__warp_usrid_00_middleToken, 0);

        return ();
    }
}

@view
func getPath_d88e3e3b{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt}(
    __warp_usrid_01__fromToken: felt, __warp_usrid_02__toToken: felt
) -> (__warp_usrid_03__len: felt, __warp_usrid_03_: felt*) {
    alloc_locals;
    let (local warp_memory: DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0, 1);
    with warp_memory {
        warp_external_input_check_address(__warp_usrid_02__toToken);

        warp_external_input_check_address(__warp_usrid_01__fromToken);

        let (__warp_usrid_04_route) = wm_new(Uint256(low=3, high=0), Uint256(low=1, high=0));

        let (__warp_se_0) = wm_index_dyn(
            __warp_usrid_04_route, Uint256(low=0, high=0), Uint256(low=1, high=0)
        );

        wm_write_felt(__warp_se_0, __warp_usrid_01__fromToken);

        let (__warp_se_1) = wm_index_dyn(
            __warp_usrid_04_route, Uint256(low=1, high=0), Uint256(low=1, high=0)
        );

        let (__warp_se_2) = WS0_READ_felt(TestRouter.__warp_usrid_00_middleToken);

        wm_write_felt(__warp_se_1, __warp_se_2);

        let (__warp_se_3) = wm_index_dyn(
            __warp_usrid_04_route, Uint256(low=2, high=0), Uint256(low=1, high=0)
        );

        wm_write_felt(__warp_se_3, __warp_usrid_02__toToken);

        let (__warp_se_4) = wm_to_calldata0(__warp_usrid_04_route);

        default_dict_finalize(warp_memory_start, warp_memory, 0);

        return (__warp_se_4.len, __warp_se_4.ptr,);
    }
}

@external
func swapTokenForToken_22894614{syscall_ptr: felt*, range_check_ptr: felt}(
    __warp_usrid_05__fromToken: felt,
    __warp_usrid_06__toToken: felt,
    __warp_usrid_07__amountIn: Uint256,
    __warp_usrid_08__to: felt,
    __warp_usrid_09__maxSlippage: Uint256,
) -> (__warp_usrid_10_: Uint256) {
    alloc_locals;

    warp_external_input_check_int256(__warp_usrid_09__maxSlippage);

    warp_external_input_check_address(__warp_usrid_08__to);

    warp_external_input_check_int256(__warp_usrid_07__amountIn);

    warp_external_input_check_address(__warp_usrid_06__toToken);

    warp_external_input_check_address(__warp_usrid_05__fromToken);

    return (__warp_usrid_07__amountIn,);
}

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr: felt}() {
    alloc_locals;
    WARP_USED_STORAGE.write(1);

    TestRouter.__warp_init_TestRouter();

    TestRouter.__warp_constructor_0();

    return ();
}

// Original soldity abi: ["constructor()","","getPath(address,address)","swapTokenForToken(address,address,uint256,address,uint256)"]
