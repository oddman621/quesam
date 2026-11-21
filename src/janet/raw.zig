const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const JanetBuildConfig = extern struct {
    major: c_uint = 0,
    minor: c_uint = 0,
    patch: c_uint = 0,
    bits: c_uint = 0,
};
pub const struct_JanetOSMutex = opaque {
    pub const janet_os_mutex_init = __root.janet_os_mutex_init;
    pub const janet_os_mutex_deinit = __root.janet_os_mutex_deinit;
    pub const janet_os_mutex_lock = __root.janet_os_mutex_lock;
    pub const janet_os_mutex_unlock = __root.janet_os_mutex_unlock;
    pub const init = __root.janet_os_mutex_init;
    pub const deinit = __root.janet_os_mutex_deinit;
    pub const lock = __root.janet_os_mutex_lock;
    pub const unlock = __root.janet_os_mutex_unlock;
};
pub const JanetOSMutex = struct_JanetOSMutex;
pub const struct_JanetOSRWLock = opaque {
    pub const janet_os_rwlock_init = __root.janet_os_rwlock_init;
    pub const janet_os_rwlock_deinit = __root.janet_os_rwlock_deinit;
    pub const janet_os_rwlock_rlock = __root.janet_os_rwlock_rlock;
    pub const janet_os_rwlock_wlock = __root.janet_os_rwlock_wlock;
    pub const janet_os_rwlock_runlock = __root.janet_os_rwlock_runlock;
    pub const janet_os_rwlock_wunlock = __root.janet_os_rwlock_wunlock;
    pub const init = __root.janet_os_rwlock_init;
    pub const deinit = __root.janet_os_rwlock_deinit;
    pub const rlock = __root.janet_os_rwlock_rlock;
    pub const wlock = __root.janet_os_rwlock_wlock;
    pub const runlock = __root.janet_os_rwlock_runlock;
    pub const wunlock = __root.janet_os_rwlock_wunlock;
};
pub const JanetOSRWLock = struct_JanetOSRWLock;
pub const struct_JanetChannel = opaque {
    pub const janet_channel_give = __root.janet_channel_give;
    pub const janet_channel_take = __root.janet_channel_take;
    pub const give = __root.janet_channel_give;
    pub const take = __root.janet_channel_take;
};
pub const JanetChannel = struct_JanetChannel;
pub const __builtin_va_list = [*c]u8;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __gnuc_va_list;
pub extern fn __mingw_get_crt_info() [*c]const u8;
pub const rsize_t = usize;
pub const ptrdiff_t = c_longlong;
pub const wchar_t = c_ushort;
pub const wint_t = c_ushort;
pub const wctype_t = c_ushort;
pub const errno_t = c_int;
pub const __time32_t = c_long;
pub const __time64_t = c_longlong;
pub const time_t = __time64_t;
pub const struct__Mbstatet = extern struct {
    _Wchar: c_ulong = 0,
    _Byte: c_ushort = 0,
    _State: c_ushort = 0,
};
pub const _Mbstatet = struct__Mbstatet;
pub const mbstate_t = _Mbstatet;
pub extern fn _invalid_parameter_noinfo() void;
pub extern fn _invalid_parameter_noinfo_noreturn() noreturn;
pub extern fn _invoke_watson(expression: [*c]const wchar_t, function_name: [*c]const wchar_t, file_name: [*c]const wchar_t, line_number: c_uint, reserved: c_ulonglong) noreturn;
pub const struct_threadlocaleinfostruct = opaque {};
pub const struct_threadmbcinfostruct = opaque {};
pub const pthreadlocinfo = ?*struct_threadlocaleinfostruct;
pub const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
pub const struct___lc_time_data = opaque {};
pub const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo = null,
    mbcinfo: pthreadmbcinfo = null,
};
pub const _locale_tstruct = struct_localeinfo_struct;
pub const _locale_t = [*c]struct_localeinfo_struct;
pub const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort = 0,
    wCountry: c_ushort = 0,
    wCodePage: c_ushort = 0,
};
pub const LC_ID = struct_tagLC_ID;
pub const LPLC_ID = [*c]struct_tagLC_ID;
pub extern fn calloc(_NumOfElements: usize, _SizeOfElements: usize) ?*anyopaque;
pub extern fn free(_Memory: ?*anyopaque) void;
pub extern fn malloc(_Size: usize) ?*anyopaque;
pub extern fn realloc(_Memory: ?*anyopaque, _NewSize: usize) ?*anyopaque;
pub extern fn _aligned_free(_Memory: ?*anyopaque) void;
pub extern fn _aligned_malloc(_Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_malloc(_Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _aligned_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize) ?*anyopaque;
pub extern fn _aligned_recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _aligned_msize(_Memory: ?*anyopaque, _Alignment: usize, _Offset: usize) usize;
pub extern fn _itow(_Value: c_int, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ltow(_Value: c_long, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ultow(_Value: c_ulong, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn __mingw_wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn __mingw_wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn __mingw_wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn _wcstod_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f64;
pub extern fn _wcstof_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f32;
pub extern fn wcstol(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_long;
pub extern fn _wcstol_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn wcstoul(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulong;
pub extern fn _wcstoul_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn _wgetenv(_VarName: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wsystem(_Command: [*c]const wchar_t) c_int;
pub extern fn _wtof(_Str: [*c]const wchar_t) f64;
pub extern fn _wtof_l(_Str: [*c]const wchar_t, _Locale: _locale_t) f64;
pub extern fn _wtoi(_Str: [*c]const wchar_t) c_int;
pub extern fn _wtoi_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wtol(_Str: [*c]const wchar_t) c_long;
pub extern fn _wtol_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_long;
pub extern fn _i64tow(_Val: c_longlong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ui64tow(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _wtoi64(_Str: [*c]const wchar_t) c_longlong;
pub extern fn _wtoi64_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoi64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_longlong;
pub extern fn _wcstoi64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoui64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulonglong;
pub extern fn _wcstoui64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn _wputenv(_EnvString: [*c]const wchar_t) c_int;
pub extern fn _wfullpath(_FullPath: [*c]wchar_t, _Path: [*c]const wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn _wmakepath(_ResultPath: [*c]wchar_t, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) void;
pub extern fn _wperror(_ErrMsg: [*c]const wchar_t) void;
pub extern fn _wsearchenv(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t) void;
pub extern fn _wsplitpath(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _Dir: [*c]wchar_t, _Filename: [*c]wchar_t, _Ext: [*c]wchar_t) void;
pub extern fn _wdupenv_s(_Buffer: [*c][*c]wchar_t, _BufferSizeInWords: [*c]usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _itow_s(_Val: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ltow_s(_Val: c_long, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ultow_s(_Val: c_ulong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wgetenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _i64tow_s(_Val: c_longlong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ui64tow_s(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wmakepath_s(_PathResult: [*c]wchar_t, _SizeInWords: usize, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) errno_t;
pub extern fn _wputenv_s(_Name: [*c]const wchar_t, _Value: [*c]const wchar_t) errno_t;
pub extern fn _wsearchenv_s(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wsplitpath_s(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _DriveSizeInWords: usize, _Dir: [*c]wchar_t, _DirSizeInWords: usize, _Filename: [*c]wchar_t, _FilenameSizeInWords: usize, _Ext: [*c]wchar_t, _ExtSizeInWords: usize) errno_t;
pub const _onexit_t = ?*const fn () callconv(.c) c_int;
pub const struct__div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub const div_t = struct__div_t;
pub const struct__ldiv_t = extern struct {
    quot: c_long = 0,
    rem: c_long = 0,
};
pub const ldiv_t = struct__ldiv_t;
pub const _LDOUBLE = extern struct {
    ld: [10]u8 = @import("std").mem.zeroes([10]u8),
    pub const _atoldbl = __root._atoldbl;
    pub const _atoldbl_l = __root._atoldbl_l;
    pub const atoldbl = __root._atoldbl;
    pub const l = __root._atoldbl_l;
};
pub const _CRT_DOUBLE = extern struct {
    x: f64 = 0,
    pub const _atodbl = __root._atodbl;
    pub const _atodbl_l = __root._atodbl_l;
    pub const atodbl = __root._atodbl;
    pub const l = __root._atodbl_l;
};
pub const _CRT_FLOAT = extern struct {
    f: f32 = 0,
    pub const _atoflt = __root._atoflt;
    pub const _atoflt_l = __root._atoflt_l;
    pub const atoflt = __root._atoflt;
    pub const l = __root._atoflt_l;
};
pub const _LONGDOUBLE = extern struct {
    x: c_longdouble = 0,
};
pub const _LDBL12 = extern struct {
    ld12: [12]u8 = @import("std").mem.zeroes([12]u8),
};
pub extern fn ___mb_cur_max_func() c_int;
pub const _purecall_handler = ?*const fn () callconv(.c) void;
pub extern fn _set_purecall_handler(_Handler: _purecall_handler) _purecall_handler;
pub extern fn _get_purecall_handler() _purecall_handler;
pub const _invalid_parameter_handler = ?*const fn ([*c]const wchar_t, [*c]const wchar_t, [*c]const wchar_t, c_uint, usize) callconv(.c) void;
pub extern fn _set_invalid_parameter_handler(_Handler: _invalid_parameter_handler) _invalid_parameter_handler;
pub extern fn _get_invalid_parameter_handler() _invalid_parameter_handler;
pub extern fn _errno() [*c]c_int;
pub extern fn _set_errno(_Value: c_int) errno_t;
pub extern fn _get_errno(_Value: [*c]c_int) errno_t;
pub extern fn __doserrno() [*c]c_ulong;
pub extern fn _set_doserrno(_Value: c_ulong) errno_t;
pub extern fn _get_doserrno(_Value: [*c]c_ulong) errno_t;
pub extern fn __sys_errlist() [*c][*c]u8;
pub extern fn __sys_nerr() [*c]c_int;
pub extern fn __p___argv() [*c][*c][*c]u8;
pub extern fn __p__fmode() [*c]c_int;
pub extern fn __p___argc() [*c]c_int;
pub extern fn __p___wargv() [*c][*c][*c]wchar_t;
pub extern fn __p__pgmptr() [*c][*c]u8;
pub extern fn __p__wpgmptr() [*c][*c]wchar_t;
pub extern fn _get_pgmptr(_Value: [*c][*c]u8) errno_t;
pub extern fn _get_wpgmptr(_Value: [*c][*c]wchar_t) errno_t;
pub extern fn _set_fmode(_Mode: c_int) errno_t;
pub extern fn _get_fmode(_PMode: [*c]c_int) errno_t;
pub extern fn __p__environ() [*c][*c][*c]u8;
pub extern fn __p__wenviron() [*c][*c][*c]wchar_t;
pub extern fn __p__osplatform() [*c]c_uint;
pub extern fn __p__osver() [*c]c_uint;
pub extern fn __p__winver() [*c]c_uint;
pub extern fn __p__winmajor() [*c]c_uint;
pub extern fn __p__winminor() [*c]c_uint;
pub extern fn _get_osplatform(_Value: [*c]c_uint) errno_t;
pub extern fn _get_osver(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winver(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winmajor(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winminor(_Value: [*c]c_uint) errno_t;
pub extern fn exit(_Code: c_int) noreturn;
pub extern fn _exit(_Code: c_int) noreturn;
pub extern fn quick_exit(_Code: c_int) noreturn;
pub extern fn _Exit(c_int) noreturn;
pub extern fn abort() noreturn;
pub extern fn _set_abort_behavior(_Flags: c_uint, _Mask: c_uint) c_uint;
pub extern fn abs(_X: c_int) c_int;
pub extern fn labs(_X: c_long) c_long;
// C:\msys64\ucrt64\include\stdlib.h:268:41: warning: cdecl calling convention ignored on inline function
pub inline fn _abs64(arg_x: c_longlong) c_longlong {
    var x = arg_x;
    _ = &x;
    return __builtin.llabs(x);
}
pub extern fn atexit(?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(?*const fn () callconv(.c) void) c_int;
pub extern fn atof(_String: [*c]const u8) f64;
pub extern fn _atof_l(_String: [*c]const u8, _Locale: _locale_t) f64;
pub extern fn atoi(_Str: [*c]const u8) c_int;
pub extern fn _atoi_l(_Str: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn atol(_Str: [*c]const u8) c_long;
pub extern fn _atol_l(_Str: [*c]const u8, _Locale: _locale_t) c_long;
pub extern fn bsearch(_Key: ?*const anyopaque, _Base: ?*const anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) ?*anyopaque;
pub extern fn qsort(_Base: ?*anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) void;
pub extern fn qsort_s(_Base: ?*anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, _Context: ?*anyopaque) void;
pub extern fn _byteswap_ushort(_Short: c_ushort) c_ushort;
pub extern fn _byteswap_ulong(_Long: c_ulong) c_ulong;
pub extern fn _byteswap_uint64(_Int64: c_ulonglong) c_ulonglong;
pub extern fn div(_Numerator: c_int, _Denominator: c_int) div_t;
pub extern fn getenv(_VarName: [*c]const u8) [*c]u8;
pub extern fn _itoa(_Value: c_int, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _i64toa(_Val: c_longlong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _ui64toa(_Val: c_ulonglong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _atoi64(_String: [*c]const u8) c_longlong;
pub extern fn _atoi64_l(_String: [*c]const u8, _Locale: _locale_t) c_longlong;
pub extern fn _strtoi64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_longlong;
pub extern fn _strtoi64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _strtoui64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulonglong;
pub extern fn _strtoui64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn ldiv(_Numerator: c_long, _Denominator: c_long) ldiv_t;
pub extern fn _ltoa(_Value: c_long, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn mblen(_Ch: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _mblen_l(_Ch: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _mbstrlen(_Str: [*c]const u8) usize;
pub extern fn _mbstrlen_l(_Str: [*c]const u8, _Locale: _locale_t) usize;
pub extern fn _mbstrnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _mbstrnlen_l(_Str: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn mbtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize) c_int;
pub extern fn _mbtowc_l(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize, _Locale: _locale_t) c_int;
pub extern fn mbstowcs(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _mbstowcs_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn mkstemp(_TemplateName: [*c]u8) c_int;
pub extern fn mkdtemp(_TemplateName: [*c]u8) [*c]u8;
pub extern fn rand() c_int;
pub extern fn _set_error_mode(_Mode: c_int) c_int;
pub extern fn srand(_Seed: c_uint) void;
pub extern fn rand_s(randomValue: [*c]c_uint) errno_t;
pub extern fn bsearch_s(_Key: ?*const anyopaque, _Base: ?*const anyopaque, _NumOfElements: rsize_t, _SizeOfElements: rsize_t, _PtFuncCompare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, _Context: ?*anyopaque) ?*anyopaque;
pub extern fn getenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]u8, _DstSize: rsize_t, _VarName: [*c]const u8) errno_t;
pub extern fn _itoa_s(_Value: c_int, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _i64toa_s(_Val: c_longlong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _ui64toa_s(_Val: c_ulonglong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _ltoa_s(_Val: c_long, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn mbstowcs_s(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _mbstowcs_s_l(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _ultoa_s(_Val: c_ulong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn wctomb_s(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: rsize_t, _WCh: wchar_t) errno_t;
pub extern fn _wctomb_s_l(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: usize, _WCh: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn wcstombs_s(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize) errno_t;
pub extern fn _wcstombs_s_l(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize, _Locale: _locale_t) errno_t;
pub extern fn strtod(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8) f64;
pub extern fn strtof(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8) f32;
pub extern fn strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn __strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
pub extern fn __mingw_strtof(noalias [*c]const u8, noalias [*c][*c]u8) f32;
pub extern fn __mingw_strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
pub extern fn __mingw_strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn _strtof_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f32;
pub extern fn _strtod_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f64;
pub extern fn strtol(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int) c_long;
pub extern fn _strtol_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn strtoul(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulong;
pub extern fn _strtoul_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn system(_Command: [*c]const u8) c_int;
pub extern fn _ultoa(_Value: c_ulong, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn wctomb(_MbCh: [*c]u8, _WCh: wchar_t) c_int;
pub extern fn _wctomb_l(_MbCh: [*c]u8, _WCh: wchar_t, _Locale: _locale_t) c_int;
pub extern fn wcstombs(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcstombs_l(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn _putenv(_EnvString: [*c]const u8) c_int;
pub extern fn _putenv_s(_Name: [*c]const u8, _Value: [*c]const u8) errno_t;
pub extern fn _fullpath(_FullPath: [*c]u8, _Path: [*c]const u8, _SizeInBytes: usize) [*c]u8;
pub extern fn _ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn _fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn _gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
pub extern fn _atodbl(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8) c_int;
pub extern fn _atoldbl(_Result: [*c]_LDOUBLE, _Str: [*c]u8) c_int;
pub extern fn _atoflt(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8) c_int;
pub extern fn _atodbl_l(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _atoldbl_l(_Result: [*c]_LDOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _atoflt_l(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _ecvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDights: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
pub extern fn _fcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
pub extern fn _gcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDigits: c_int) errno_t;
pub extern fn _lrotl(c_ulong, c_int) c_ulong;
pub extern fn _lrotr(c_ulong, c_int) c_ulong;
pub extern fn _makepath(_Path: [*c]u8, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) void;
pub extern fn _makepath_s(_PathResult: [*c]u8, _Size: usize, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) errno_t;
pub extern fn _onexit(_Func: _onexit_t) _onexit_t;
pub extern fn perror(_ErrMsg: [*c]const u8) void;
pub extern fn _rotl64(_Val: c_ulonglong, _Shift: c_int) c_ulonglong;
pub extern fn _rotr64(Value: c_ulonglong, Shift: c_int) c_ulonglong;
pub extern fn _rotr(_Val: c_uint, _Shift: c_int) c_uint;
pub extern fn _rotl(_Val: c_uint, _Shift: c_int) c_uint;
pub extern fn _searchenv(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8) void;
pub extern fn _splitpath(_FullPath: [*c]const u8, _Drive: [*c]u8, _Dir: [*c]u8, _Filename: [*c]u8, _Ext: [*c]u8) void;
pub extern fn _swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
pub extern fn _searchenv_s(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8, _SizeInBytes: usize) errno_t;
pub extern fn _splitpath_s(_FullPath: [*c]const u8, _Drive: [*c]u8, _DriveSize: usize, _Dir: [*c]u8, _DirSize: usize, _Filename: [*c]u8, _FilenameSize: usize, _Ext: [*c]u8, _ExtSize: usize) errno_t;
pub extern fn _beep(_Frequency: c_uint, _Duration: c_uint) void;
pub extern fn _seterrormode(_Mode: c_int) void;
pub extern fn _sleep(_Duration: c_ulong) void;
pub extern fn ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
pub extern fn itoa(_Val: c_int, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn ltoa(_Val: c_long, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn putenv(_EnvString: [*c]const u8) c_int;
pub extern fn swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
pub extern fn ultoa(_Val: c_ulong, _Dstbuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn onexit(_Func: _onexit_t) _onexit_t;
pub const lldiv_t = extern struct {
    quot: c_longlong = 0,
    rem: c_longlong = 0,
};
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub fn llabs(arg__j: c_longlong) callconv(.c) c_longlong {
    var _j = arg__j;
    _ = &_j;
    return if (_j >= @as(c_longlong, 0)) _j else -_j;
}
pub extern fn strtoll(noalias [*c]const u8, noalias [*c][*c]u8, c_int) c_longlong;
pub extern fn strtoull(noalias [*c]const u8, noalias [*c][*c]u8, c_int) c_ulonglong;
pub extern fn atoll([*c]const u8) c_longlong;
pub fn lltoa(arg__n: c_longlong, arg__c: [*c]u8, arg__i: c_int) callconv(.c) [*c]u8 {
    var _n = arg__n;
    _ = &_n;
    var _c = arg__c;
    _ = &_c;
    var _i = arg__i;
    _ = &_i;
    return _i64toa(_n, _c, _i);
}
pub fn ulltoa(arg__n: c_ulonglong, arg__c: [*c]u8, arg__i: c_int) callconv(.c) [*c]u8 {
    var _n = arg__n;
    _ = &_n;
    var _c = arg__c;
    _ = &_c;
    var _i = arg__i;
    _ = &_i;
    return _ui64toa(_n, _c, _i);
}
pub fn wtoll(arg__w: [*c]const wchar_t) callconv(.c) c_longlong {
    var _w = arg__w;
    _ = &_w;
    return _wtoi64(_w);
}
pub fn lltow(arg__n: c_longlong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.c) [*c]wchar_t {
    var _n = arg__n;
    _ = &_n;
    var _w = arg__w;
    _ = &_w;
    var _i = arg__i;
    _ = &_i;
    return _i64tow(_n, _w, _i);
}
pub fn ulltow(arg__n: c_ulonglong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.c) [*c]wchar_t {
    var _n = arg__n;
    _ = &_n;
    var _w = arg__w;
    _ = &_w;
    var _i = arg__i;
    _ = &_i;
    return _ui64tow(_n, _w, _i);
}
pub extern fn _dupenv_s(_PBuffer: [*c][*c]u8, _PBufferSizeInBytes: [*c]usize, _VarName: [*c]const u8) errno_t;
pub const struct__heapinfo = extern struct {
    _pentry: [*c]c_int = null,
    _size: usize = 0,
    _useflag: c_int = 0,
    pub const _heapwalk = __root._heapwalk;
    pub const heapwalk = __root._heapwalk;
};
pub const _HEAPINFO = struct__heapinfo;
pub extern fn __p__amblksiz() [*c]c_uint;
pub extern fn __mingw_aligned_malloc(_Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn __mingw_aligned_free(_Memory: ?*anyopaque) void;
pub extern fn __mingw_aligned_offset_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn __mingw_aligned_offset_malloc(usize, usize, usize) ?*anyopaque;
pub extern fn __mingw_aligned_realloc(_Memory: ?*anyopaque, _Size: usize, _Offset: usize) ?*anyopaque;
pub extern fn __mingw_aligned_msize(memblock: ?*anyopaque, alignment: usize, offset: usize) usize;
pub inline fn _mm_malloc(arg___size: usize, arg___align: usize) ?*anyopaque {
    var __size = arg___size;
    _ = &__size;
    var __align = arg___align;
    _ = &__align;
    if (__align == @as(usize, 1)) {
        return malloc(__size);
    }
    if (!((__align & (__align -% @as(usize, 1))) != 0) and (__align < @sizeOf(?*anyopaque))) {
        __align = @sizeOf(?*anyopaque);
    }
    var __mallocedMemory: ?*anyopaque = undefined;
    _ = &__mallocedMemory;
    __mallocedMemory = __mingw_aligned_malloc(__size, __align);
    return __mallocedMemory;
}
pub inline fn _mm_free(arg___p: ?*anyopaque) void {
    var __p = arg___p;
    _ = &__p;
    __mingw_aligned_free(__p);
}
pub extern fn _resetstkoflw() c_int;
pub extern fn _set_malloc_crt_max_wait(_NewValue: c_ulong) c_ulong;
pub extern fn _expand(_Memory: ?*anyopaque, _NewSize: usize) ?*anyopaque;
pub extern fn _msize(_Memory: ?*anyopaque) usize;
pub extern fn _get_sbh_threshold() usize;
pub extern fn _set_sbh_threshold(_NewValue: usize) c_int;
pub extern fn _set_amblksiz(_Value: usize) errno_t;
pub extern fn _get_amblksiz(_Value: [*c]usize) errno_t;
pub extern fn _heapadd(_Memory: ?*anyopaque, _Size: usize) c_int;
pub extern fn _heapchk() c_int;
pub extern fn _heapmin() c_int;
pub extern fn _heapset(_Fill: c_uint) c_int;
pub extern fn _heapwalk(_EntryInfo: [*c]_HEAPINFO) c_int;
pub extern fn _heapused(_Used: [*c]usize, _Commit: [*c]usize) usize;
pub extern fn _get_heap_handle() isize;
pub fn _MarkAllocaS(arg__Ptr: ?*anyopaque, arg__Marker: c_uint) callconv(.c) ?*anyopaque {
    var _Ptr = arg__Ptr;
    _ = &_Ptr;
    var _Marker = arg__Marker;
    _ = &_Marker;
    if (_Ptr != null) {
        @as([*c]c_uint, @ptrCast(@alignCast(_Ptr))).* = _Marker;
        _Ptr = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(_Ptr))) + @as(usize, @bitCast(@as(isize, @intCast(_ALLOCA_S_MARKER_SIZE))))));
    }
    return _Ptr;
}
pub fn _freea(arg__Memory: ?*anyopaque) callconv(.c) void {
    var _Memory = arg__Memory;
    _ = &_Memory;
    var _Marker: c_uint = undefined;
    _ = &_Marker;
    if (_Memory != null) {
        _Memory = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(_Memory))) - @as(usize, @bitCast(@as(isize, @intCast(_ALLOCA_S_MARKER_SIZE))))));
        _Marker = @as([*c]c_uint, @ptrCast(@alignCast(_Memory))).*;
        if (_Marker == @as(c_uint, _ALLOCA_S_HEAP_MARKER)) {
            free(_Memory);
        }
    }
}
pub extern fn __threadid() c_ulong;
pub extern fn __threadhandle() usize;
pub const int_least8_t = i8;
pub const uint_least8_t = u8;
pub const int_least16_t = c_short;
pub const uint_least16_t = c_ushort;
pub const int_least32_t = c_int;
pub const uint_least32_t = c_uint;
pub const int_least64_t = c_longlong;
pub const uint_least64_t = c_ulonglong;
pub const int_fast8_t = i8;
pub const uint_fast8_t = u8;
pub const int_fast16_t = c_short;
pub const uint_fast16_t = c_ushort;
pub const int_fast32_t = c_int;
pub const uint_fast32_t = c_uint;
pub const int_fast64_t = c_longlong;
pub const uint_fast64_t = c_ulonglong;
pub const intmax_t = c_longlong;
pub const uintmax_t = c_ulonglong;
pub extern fn _memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn _memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _memicmp_l(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize, _Locale: _locale_t) c_int;
pub extern fn memcmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn memcpy(noalias _Dst: ?*anyopaque, noalias _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn memcpy_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn mempcpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn memset(_Dst: ?*anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn memset_explicit(_Dst: ?*anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn memchr(_Buf: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn _wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcscpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcslen(_Str: [*c]const wchar_t) usize;
pub extern fn wcsnlen(_Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn wcsncat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn wcsncmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsncpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn _wcsncpy_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcsspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t, noalias _Ptr: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcserror(_ErrNum: c_int) [*c]wchar_t;
pub extern fn __wcserror(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn _wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn _wcslwr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcslwr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsupr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsupr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcsxfrm(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcsxfrm_l(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn wcscoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcscoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsncoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsncoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn wcslwr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsupr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcstok_s(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcserror_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _ErrNum: c_int) errno_t;
pub extern fn __wcserror_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _ErrMsg: [*c]const wchar_t) errno_t;
pub extern fn _wcsnset_s(_Dst: [*c]wchar_t, _DstSizeInWords: usize, _Val: wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsset_s(_Str: [*c]wchar_t, _SizeInWords: usize, _Val: wchar_t) errno_t;
pub extern fn _wcslwr_s(_Str: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wcslwr_s_l(_Str: [*c]wchar_t, _SizeInWords: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcsupr_s(_Str: [*c]wchar_t, _Size: usize) errno_t;
pub extern fn _wcsupr_s_l(_Str: [*c]wchar_t, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn wcscat_s(_Dst: [*c]wchar_t, _DstSize: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcscpy_s(_Dst: [*c]wchar_t, _DstSize: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcsncat_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncat_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn wcsncpy_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncpy_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcstok_s_l(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn _wcsnset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Count: usize, _Locale: _locale_t) errno_t;
// C:\msys64\ucrt64\include\corecrt_wstring.h:130:32: warning: cdecl calling convention ignored on inline function
pub inline fn wcsnlen_s(arg__src: [*c]const wchar_t, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) wcsnlen(_src, _count) else @as(usize, 0);
}
pub extern fn wcschr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcspbrk(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsrchr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcsstr(_Str: [*c]const wchar_t, _SubStr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn _strset_l(_Str: [*c]u8, _Val: c_int, _Locale: _locale_t) [*c]u8;
pub extern fn strcpy(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8) [*c]u8;
pub extern fn strcat(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8) [*c]u8;
pub extern fn strcmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlen(_Str: [*c]const u8) usize;
pub extern fn strnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn memmove(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn _strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strndup(_Src: [*c]const u8, _MaxCount: usize) [*c]u8;
pub extern fn _stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn strcoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _stricoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _strncoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strncoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _strnicoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strcspn(_Str: [*c]const u8, _Control: [*c]const u8) usize;
pub extern fn _strerror(_ErrMsg: [*c]const u8) [*c]u8;
pub extern fn strerror(c_int) [*c]u8;
pub extern fn _strlwr(_String: [*c]u8) [*c]u8;
pub extern fn strlwr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strncat(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8, _Count: usize) [*c]u8;
pub extern fn strncmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strncpy(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8, _Count: usize) [*c]u8;
pub extern fn _strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn _strnset_l(str: [*c]u8, c: c_int, count: usize, _Locale: _locale_t) [*c]u8;
pub extern fn _strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strspn(_Str: [*c]const u8, _Control: [*c]const u8) usize;
pub extern fn strtok(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8) [*c]u8;
pub extern fn strtok_r(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8, noalias __last: [*c][*c]u8) [*c]u8;
pub extern fn _strupr(_String: [*c]u8) [*c]u8;
pub extern fn _strupr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strxfrm(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _strxfrm_l(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlwr(_Str: [*c]u8) [*c]u8;
pub extern fn strnicmp(_Str1: [*c]const u8, _Str: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, usize) c_int;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn strupr(_Str: [*c]u8) [*c]u8;
pub extern fn _strset_s(_Dst: [*c]u8, _DstSize: usize, _Value: c_int) errno_t;
pub extern fn _strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrMsg: [*c]const u8) errno_t;
pub extern fn strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrNum: c_int) errno_t;
pub extern fn _strlwr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strlwr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn _strnset_s(_Str: [*c]u8, _Size: usize, _Val: c_int, _MaxCount: usize) errno_t;
pub extern fn _strupr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strupr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn strncat_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncat_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strcpy_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub extern fn strncpy_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncpy_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strtok_s(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8) [*c]u8;
pub extern fn _strtok_s_l(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strcat_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
// C:\msys64\ucrt64\include\string.h:139:32: warning: cdecl calling convention ignored on inline function
pub inline fn strnlen_s(arg__src: [*c]const u8, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) strnlen(_src, _count) else @as(usize, 0);
}
pub extern fn memmove_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn strchr(_Str: [*c]const u8, _Val: c_int) [*c]u8;
pub extern fn strpbrk(_Str: [*c]const u8, _Control: [*c]const u8) [*c]u8;
pub extern fn strrchr(_Str: [*c]const u8, _Val: c_int) [*c]u8;
pub extern fn strstr(_Str: [*c]const u8, _SubStr: [*c]const u8) [*c]u8;
pub const struct__SETJMP_FLOAT128 = extern struct {
    Part: [2]c_ulonglong = @import("std").mem.zeroes([2]c_ulonglong),
    pub const longjmp = __root.longjmp;
    pub const _setjmp = __root._setjmp;
    pub const _setjmpex = __root._setjmpex;
    pub const setjmpex = __root._setjmpex;
};
pub const SETJMP_FLOAT128 = struct__SETJMP_FLOAT128;
pub const _JBTYPE = SETJMP_FLOAT128;
pub const struct__JUMP_BUFFER = extern struct {
    Frame: c_ulonglong = 0,
    Rbx: c_ulonglong = 0,
    Rsp: c_ulonglong = 0,
    Rbp: c_ulonglong = 0,
    Rsi: c_ulonglong = 0,
    Rdi: c_ulonglong = 0,
    R12: c_ulonglong = 0,
    R13: c_ulonglong = 0,
    R14: c_ulonglong = 0,
    R15: c_ulonglong = 0,
    Rip: c_ulonglong = 0,
    MxCsr: c_ulong = 0,
    FpCsr: c_ushort = 0,
    Spare: c_ushort = 0,
    Xmm6: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm7: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm8: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm9: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm10: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm11: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm12: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm13: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm14: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
    Xmm15: SETJMP_FLOAT128 = @import("std").mem.zeroes(SETJMP_FLOAT128),
};
pub const _JUMP_BUFFER = struct__JUMP_BUFFER;
pub const jmp_buf = [16]_JBTYPE;
pub extern fn longjmp(_Buf: [*c]_JBTYPE, _Value: c_int) noreturn;
pub extern fn _setjmp(_Buf: [*c]_JBTYPE, _Frame: ?*anyopaque) c_int;
pub extern fn _setjmpex(_Buf: [*c]_JBTYPE, _Frame: ?*anyopaque) c_int;
pub extern fn mingw_getsp() ?*anyopaque;
pub const max_align_t = extern struct {
    __max_align_ll: c_longlong = 0,
    __max_align_ld: c_longdouble = 0,
};
pub extern fn __local_stdio_printf_options() [*c]c_ulonglong;
pub extern fn __local_stdio_scanf_options() [*c]c_ulonglong;
pub const struct__iobuf = extern struct {
    _Placeholder: ?*anyopaque = null,
    pub const __mingw_fwscanf = __root.__mingw_fwscanf;
    pub const __mingw_vfwscanf = __root.__mingw_vfwscanf;
    pub const __mingw_fwprintf = __root.__mingw_fwprintf;
    pub const __mingw_vfwprintf = __root.__mingw_vfwprintf;
    pub const __ms_fwscanf = __root.__ms_fwscanf;
    pub const __ms_vfwscanf = __root.__ms_vfwscanf;
    pub const __ms_fwprintf = __root.__ms_fwprintf;
    pub const __ms_vfwprintf = __root.__ms_vfwprintf;
    pub const fwscanf = __root.fwscanf;
    pub const vfwscanf = __root.vfwscanf;
    pub const fwprintf = __root.fwprintf;
    pub const vfwprintf = __root.vfwprintf;
    pub const fgetwc = __root.fgetwc;
    pub const getwc = __root.getwc;
    pub const _vfwscanf_l = __root._vfwscanf_l;
    pub const _fwscanf_l = __root._fwscanf_l;
    pub const _vfwprintf_p_l = __root._vfwprintf_p_l;
    pub const _vfwprintf_p = __root._vfwprintf_p;
    pub const _fwprintf_p_l = __root._fwprintf_p_l;
    pub const _fwprintf_p = __root._fwprintf_p;
    pub const _vfwprintf_l = __root._vfwprintf_l;
    pub const _fwprintf_l = __root._fwprintf_l;
    pub const _fgetwc_nolock = __root._fgetwc_nolock;
    pub const _vfwscanf_s_l = __root._vfwscanf_s_l;
    pub const vfwscanf_s = __root.vfwscanf_s;
    pub const _fwscanf_s_l = __root._fwscanf_s_l;
    pub const fwscanf_s = __root.fwscanf_s;
    pub const _vfwprintf_s_l = __root._vfwprintf_s_l;
    pub const vfwprintf_s = __root.vfwprintf_s;
    pub const _fwprintf_s_l = __root._fwprintf_s_l;
    pub const fwprintf_s = __root.fwprintf_s;
    pub const __mingw_fscanf = __root.__mingw_fscanf;
    pub const __mingw_vfscanf = __root.__mingw_vfscanf;
    pub const __mingw_fprintf = __root.__mingw_fprintf;
    pub const __mingw_vfprintf = __root.__mingw_vfprintf;
    pub const __ms_fscanf = __root.__ms_fscanf;
    pub const __ms_vfscanf = __root.__ms_vfscanf;
    pub const __ms_fprintf = __root.__ms_fprintf;
    pub const __ms_vfprintf = __root.__ms_vfprintf;
    pub const fprintf = __root.fprintf;
    pub const vfprintf = __root.vfprintf;
    pub const fscanf = __root.fscanf;
    pub const vfscanf = __root.vfscanf;
    pub const _filbuf = __root._filbuf;
    pub const clearerr = __root.clearerr;
    pub const fclose = __root.fclose;
    pub const feof = __root.feof;
    pub const ferror = __root.ferror;
    pub const fflush = __root.fflush;
    pub const fgetc = __root.fgetc;
    pub const fgetpos = __root.fgetpos;
    pub const fgetpos64 = __root.fgetpos64;
    pub const _fileno = __root._fileno;
    pub const fsetpos = __root.fsetpos;
    pub const fsetpos64 = __root.fsetpos64;
    pub const fseek = __root.fseek;
    pub const ftell = __root.ftell;
    pub const _fseeki64 = __root._fseeki64;
    pub const _ftelli64 = __root._ftelli64;
    pub const fseeko = __root.fseeko;
    pub const fseeko64 = __root.fseeko64;
    pub const ftello = __root.ftello;
    pub const ftello64 = __root.ftello64;
    pub const getc = __root.getc;
    pub const _getw = __root._getw;
    pub const _pclose = __root._pclose;
    pub const rewind = __root.rewind;
    pub const setbuf = __root.setbuf;
    pub const setvbuf = __root.setvbuf;
    pub const _fgetc_nolock = __root._fgetc_nolock;
    pub const _getc_nolock = __root._getc_nolock;
    pub const _lock_file = __root._lock_file;
    pub const _unlock_file = __root._unlock_file;
    pub const _fclose_nolock = __root._fclose_nolock;
    pub const _fflush_nolock = __root._fflush_nolock;
    pub const _fseek_nolock = __root._fseek_nolock;
    pub const _ftell_nolock = __root._ftell_nolock;
    pub const _fseeki64_nolock = __root._fseeki64_nolock;
    pub const _ftelli64_nolock = __root._ftelli64_nolock;
    pub const fileno = __root.fileno;
    pub const getw = __root.getw;
    pub const clearerr_s = __root.clearerr_s;
    pub const _vfscanf_s_l = __root._vfscanf_s_l;
    pub const vfscanf_s = __root.vfscanf_s;
    pub const _fscanf_s_l = __root._fscanf_s_l;
    pub const fscanf_s = __root.fscanf_s;
    pub const _vfscanf_l = __root._vfscanf_l;
    pub const _fscanf_l = __root._fscanf_l;
    pub const _vfprintf_s_l = __root._vfprintf_s_l;
    pub const vfprintf_s = __root.vfprintf_s;
    pub const _fprintf_s_l = __root._fprintf_s_l;
    pub const fprintf_s = __root.fprintf_s;
    pub const _vfprintf_p_l = __root._vfprintf_p_l;
    pub const _vfprintf_p = __root._vfprintf_p;
    pub const _fprintf_p_l = __root._fprintf_p_l;
    pub const _fprintf_p = __root._fprintf_p;
    pub const _vfprintf_l = __root._vfprintf_l;
    pub const _fprintf_l = __root._fprintf_l;
    pub const janet_makefile = __root.janet_makefile;
    pub const janet_makejfile = __root.janet_makejfile;
    pub const l = __root._vfwscanf_l;
    pub const p = __root._vfwprintf_p;
    pub const nolock = __root._fgetwc_nolock;
    pub const s = __root.vfwscanf_s;
    pub const filbuf = __root._filbuf;
    pub const fseeki64 = __root._fseeki64;
    pub const ftelli64 = __root._ftelli64;
    pub const file = __root._lock_file;
    pub const makefile = __root.janet_makefile;
    pub const makejfile = __root.janet_makejfile;
};
pub const FILE = struct__iobuf;
pub extern fn __acrt_iob_func(index: c_uint) [*c]FILE;
pub extern fn __iob_func() [*c]FILE;
pub extern fn __mingw_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswscanf(noalias _Str: [*c]const wchar_t, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vwscanf(noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwscanf(noalias fp: [*c]FILE, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __mingw_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vwscanf(noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_snwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __stdio_common_vswprintf(options: c_ulonglong, str: [*c]wchar_t, len: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vswscanf(options: c_ulonglong, input: [*c]const wchar_t, length: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vswprintf_p(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vfwscanf(__stream: [*c]FILE, __format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn vswscanf(noalias __source: [*c]const wchar_t, noalias __format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn vwscanf(__format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn swprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vswprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub extern fn snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn vsnwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, arg: va_list) c_int;
pub extern fn _wfsopen(_Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _ShFlag: c_int) [*c]FILE;
pub extern fn fgetwc(_File: [*c]FILE) wint_t;
pub extern fn _fgetwchar() wint_t;
pub extern fn fputwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _fputwchar(_Ch: wchar_t) wint_t;
pub extern fn getwc(_File: [*c]FILE) wint_t;
pub extern fn getwchar() wint_t;
pub extern fn putwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn putwchar(_Ch: wchar_t) wint_t;
pub extern fn ungetwc(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn fgetws(noalias _Dst: [*c]wchar_t, _SizeInWords: c_int, noalias _File: [*c]FILE) [*c]wchar_t;
pub extern fn fputws(noalias _Str: [*c]const wchar_t, noalias _File: [*c]FILE) c_int;
pub extern fn _getws(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _putws(_Str: [*c]const wchar_t) c_int;
pub extern fn _scwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _snwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vsnwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub extern fn _vscwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _swprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vswprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub fn _vfwscanf_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwscanf(__local_stdio_scanf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vwscanf_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:322:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwscanf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:331:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wscanf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vsnwscanf_l(arg__Src: [*c]const wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().*, _Src, _MaxCount, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:345:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:354:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vswscanf_l(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().*, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:368:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swscanf_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vfwprintf_p_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf_p(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_p_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_p_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn _vfwprintf_p(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_p_l(_File, _Format, null, _ArgList);
}
pub fn _vwprintf_p(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_p_l(__acrt_iob_func(1), _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:394:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_p_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:403:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:412:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_p(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:421:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_p(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vfwprintf_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:439:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:448:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vswprintf_p_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_p(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vswprintf_p(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_p_l(_DstBuf, _MaxCount, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:466:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_p_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:475:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_p(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf(__local_stdio_printf_options().* | _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:489:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vscwprintf_p_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_p(__local_stdio_printf_options().* | _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, _Locale, _ArgList);
}
pub fn _vscwprintf_p(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vscwprintf_p_l(_Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:507:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:516:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf_p(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vscwprintf_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf(__local_stdio_printf_options().* | _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:531:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vswprintf_c_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn __vswprintf_l(arg__DstBuf: [*c]wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_c_l(_DstBuf, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn _vswprintf_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_c_l(_DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:553:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_c_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:562:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn __swprintf_l(_DstBuf: [*c]wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _wtempnam(_Directory: [*c]const wchar_t, _FilePrefix: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wfdopen(_FileHandle: c_int, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfreopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t, noalias _OldFile: [*c]FILE) [*c]FILE;
pub extern fn _wpopen(_Command: [*c]const wchar_t, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wremove(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wtmpnam(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _fgetwc_nolock(_File: [*c]FILE) wint_t;
pub extern fn _fputwc_nolock(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _ungetwc_nolock(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn __mingw_str_wide_utf8(_Wptr: [*c]const wchar_t, _Mbptr: [*c][*c]u8, _Buflen: [*c]usize) c_int;
pub extern fn __mingw_str_utf8_wide(_Mbptr: [*c]const u8, _Wptr: [*c][*c]wchar_t, _Buflen: [*c]usize) c_int;
pub extern fn __mingw_str_free(_Ptr: ?*anyopaque) void;
pub extern fn _getws_s(_Str: [*c]wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn __stdio_common_vswprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnwprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfwscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwscanf(__local_stdio_scanf_options().* | _CRT_INTERNAL_SCANF_SECURECRT, _File, _Format, _Locale, _ArgList);
}
pub fn vfwscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vwscanf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
pub fn vwscanf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(0), _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:751:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwscanf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:761:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwscanf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:771:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:781:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswscanf_s_l(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().* | _CRT_INTERNAL_SCANF_SECURECRT, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn vswscanf_s(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswscanf_s_l(_Src, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:801:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swscanf_s_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:810:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swscanf_s(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwscanf_s_l(arg__Src: [*c]const wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().* | _CRT_INTERNAL_SCANF_SECURECRT, _Src, _MaxCount, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:824:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:833:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vfwprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf_s(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn vfwprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn vwprintf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(1), _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:859:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:868:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:877:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:886:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vswprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_s_l(_DstBuf, _DstSize, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:904:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:913:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnwprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnwprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnwprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\corecrt_wstdio.h:931:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\corecrt_wstdio.h:940:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wfopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t) errno_t;
pub extern fn _wfreopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _OldFile: [*c]FILE) errno_t;
pub extern fn _wtmpnam_s(_DstBuf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub const _off_t = c_long;
pub const off32_t = c_long;
pub const _off64_t = c_longlong;
pub const off64_t = c_longlong;
pub const off_t = off32_t;
pub const fpos_t = c_longlong;
pub extern fn __mingw_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vsscanf(noalias _Str: [*c]const u8, noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vscanf(noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vfscanf(noalias fp: [*c]FILE, noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_vsnprintf(noalias _DstBuf: [*c]u8, _MaxCount: usize, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn __mingw_snprintf(noalias s: [*c]u8, n: usize, noalias format: [*c]const u8, ...) c_int;
pub extern fn __mingw_printf(noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vprintf(noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vfprintf(noalias [*c]FILE, noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vsprintf(noalias [*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_asprintf(noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vasprintf(noalias [*c][*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vsscanf(noalias _Str: [*c]const u8, noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vscanf(noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vfscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_printf(noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vprintf(noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vfprintf(noalias [*c]FILE, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vsprintf(noalias [*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_snprintf(noalias [*c]u8, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vsnprintf(noalias [*c]u8, usize, noalias [*c]const u8, va_list) c_int;
pub extern fn __stdio_common_vsprintf(options: c_ulonglong, str: [*c]u8, len: usize, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vsscanf(options: c_ulonglong, input: [*c]const u8, length: usize, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn fprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn printf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias _Dest: [*c]u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn vprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn vsprintf(noalias _Dest: [*c]u8, noalias _Format: [*c]const u8, _Args: va_list) c_int;
pub extern fn fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(__stream: [*c]FILE, __format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn vsscanf(noalias __source: [*c]const u8, noalias __format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn vscanf(__format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn _filbuf(_File: [*c]FILE) c_int;
pub extern fn _flsbuf(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _fsopen(_Filename: [*c]const u8, _Mode: [*c]const u8, _ShFlag: c_int) [*c]FILE;
pub extern fn clearerr(_File: [*c]FILE) void;
pub extern fn fclose(_File: [*c]FILE) c_int;
pub extern fn _fcloseall() c_int;
pub extern fn _fdopen(_FileHandle: c_int, _Mode: [*c]const u8) [*c]FILE;
pub extern fn feof(_File: [*c]FILE) c_int;
pub extern fn ferror(_File: [*c]FILE) c_int;
pub extern fn fflush(_File: [*c]FILE) c_int;
pub extern fn fgetc(_File: [*c]FILE) c_int;
pub extern fn _fgetchar() c_int;
pub extern fn fgetpos(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
pub extern fn fgetpos64(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
pub extern fn fgets(noalias _Buf: [*c]u8, _MaxCount: c_int, noalias _File: [*c]FILE) [*c]u8;
pub extern fn _fileno(_File: [*c]FILE) c_int;
pub extern fn _tempnam(_DirName: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
pub extern fn _flushall() c_int;
pub extern fn fopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8) [*c]FILE;
pub extern fn fopen64(noalias filename: [*c]const u8, noalias mode: [*c]const u8) [*c]FILE;
pub extern fn fputc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _fputchar(_Ch: c_int) c_int;
pub extern fn fputs(noalias _Str: [*c]const u8, noalias _File: [*c]FILE) c_int;
pub extern fn fread(noalias _DstBuf: ?*anyopaque, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn freopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8, noalias _File: [*c]FILE) [*c]FILE;
pub extern fn freopen64(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8, noalias _File: [*c]FILE) [*c]FILE;
pub extern fn fsetpos(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
pub extern fn fsetpos64(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
pub extern fn fseek(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
pub extern fn ftell(_File: [*c]FILE) c_long;
pub extern fn _fseeki64(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
pub extern fn _ftelli64(_File: [*c]FILE) c_longlong;
pub extern fn fseeko(_File: [*c]FILE, _Offset: _off_t, _Origin: c_int) c_int;
pub extern fn fseeko64(_File: [*c]FILE, _Offset: _off64_t, _Origin: c_int) c_int;
pub extern fn ftello(_File: [*c]FILE) _off_t;
pub extern fn ftello64(_File: [*c]FILE) _off64_t;
pub extern fn fwrite(noalias _Str: ?*const anyopaque, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn getc(_File: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn _getmaxstdio() c_int;
pub extern fn gets(_Buffer: [*c]u8) [*c]u8;
pub extern fn _getw(_File: [*c]FILE) c_int;
pub extern fn _pclose(_File: [*c]FILE) c_int;
pub extern fn _popen(_Command: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
pub extern fn putc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn putchar(_Ch: c_int) c_int;
pub extern fn puts(_Str: [*c]const u8) c_int;
pub extern fn _putw(_Word: c_int, _File: [*c]FILE) c_int;
pub extern fn remove(_Filename: [*c]const u8) c_int;
pub extern fn rename(_OldFilename: [*c]const u8, _NewFilename: [*c]const u8) c_int;
pub extern fn _unlink(_Filename: [*c]const u8) c_int;
pub extern fn unlink(_Filename: [*c]const u8) c_int;
pub extern fn rewind(_File: [*c]FILE) void;
pub extern fn _rmtmp() c_int;
pub extern fn setbuf(noalias _File: [*c]FILE, noalias _Buffer: [*c]u8) void;
pub extern fn _setmaxstdio(_Max: c_int) c_int;
pub extern fn _set_output_format(_Format: c_uint) c_uint;
pub extern fn _get_output_format() c_uint;
pub extern fn setvbuf(noalias _File: [*c]FILE, noalias _Buf: [*c]u8, _Mode: c_int, _Size: usize) c_int;
pub extern fn _scprintf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn _snscanf(noalias _Src: [*c]const u8, _MaxCount: usize, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn _vscprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpfile64() [*c]FILE;
pub extern fn tmpnam(_Buffer: [*c]u8) [*c]u8;
pub extern fn ungetc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _vsnprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, _Args: va_list) c_int;
pub extern fn _snprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __stream: [*c]u8, __n: usize, noalias __format: [*c]const u8, __local_argv: va_list) c_int;
pub extern fn snprintf(noalias __stream: [*c]u8, __n: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn _set_printf_count_output(_Value: c_int) c_int;
pub extern fn _get_printf_count_output() c_int;
pub extern fn _fgetc_nolock(_File: [*c]FILE) c_int;
pub extern fn _fputc_nolock(_Char: c_int, _File: [*c]FILE) c_int;
pub extern fn _getc_nolock(_File: [*c]FILE) c_int;
pub extern fn _putc_nolock(_Char: c_int, _File: [*c]FILE) c_int;
pub extern fn _lock_file(_File: [*c]FILE) void;
pub extern fn _unlock_file(_File: [*c]FILE) void;
pub extern fn _fclose_nolock(_File: [*c]FILE) c_int;
pub extern fn _fflush_nolock(_File: [*c]FILE) c_int;
pub extern fn _fread_nolock(noalias _DstBuf: ?*anyopaque, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn _fseek_nolock(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
pub extern fn _ftell_nolock(_File: [*c]FILE) c_long;
pub extern fn _fseeki64_nolock(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
pub extern fn _ftelli64_nolock(_File: [*c]FILE) c_longlong;
pub extern fn _fwrite_nolock(noalias _DstBuf: ?*const anyopaque, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn _ungetc_nolock(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn tempnam(_Directory: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
pub extern fn fcloseall() c_int;
pub extern fn fdopen(_FileHandle: c_int, _Format: [*c]const u8) [*c]FILE;
pub extern fn fgetchar() c_int;
pub extern fn fileno(_File: [*c]FILE) c_int;
pub extern fn flushall() c_int;
pub extern fn fputchar(_Ch: c_int) c_int;
pub extern fn getw(_File: [*c]FILE) c_int;
pub extern fn putw(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn rmtmp() c_int;
pub extern fn clearerr_s(_File: [*c]FILE) errno_t;
pub extern fn fread_s(_DstBuf: ?*anyopaque, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
pub extern fn __stdio_common_vsprintf_s(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsprintf_p(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnprintf_s(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfscanf(_CRT_INTERNAL_SCANF_SECURECRT, _File, _Format, _Locale, _ArgList);
}
pub fn vfscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vscanf_s_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
pub fn vscanf_s(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(__acrt_iob_func(0), _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:924:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fscanf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:934:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fscanf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:944:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scanf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:954:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn scanf_s(_Format: [*c]const u8, ...) c_int;
pub fn _vfscanf_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfscanf(0, _File, _Format, _Locale, _ArgList);
}
pub fn _vscanf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:974:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fscanf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:983:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scanf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsscanf_s_l(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsscanf(_CRT_INTERNAL_SCANF_SECURECRT, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn vsscanf_s(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsscanf_s_l(_Src, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1001:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sscanf_s_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1010:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn sscanf_s(_Src: [*c]const u8, _Format: [*c]const u8, ...) c_int;
pub fn _vsscanf_l(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsscanf(0, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1024:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sscanf_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1035:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_s_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1044:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_s(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1055:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vfprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf_s(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn vfprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vprintf_s_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn vprintf_s(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(__acrt_iob_func(1), _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1082:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1091:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1100:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fprintf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1109:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn printf_s(_Format: [*c]const u8, ...) c_int;
pub fn _vsnprintf_c_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnprintf_c(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_c_l(_DstBuf, _MaxCount, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1127:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1136:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vsnprintf_s_l(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn vsnprintf_s(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
}
pub fn _vsnprintf_s(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1158:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1167:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vsprintf_s_l(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vsprintf_s(arg__DstBuf: [*c]u8, arg__Size: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Size = arg__Size;
    _ = &_Size;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsprintf_s_l(_DstBuf, _Size, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1185:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1194:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn sprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vfprintf_p_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf_p(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vfprintf_p(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(_File, _Format, null, _ArgList);
}
pub fn _vprintf_p_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn _vprintf_p(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(__acrt_iob_func(1), _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1220:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1229:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_p(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1238:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1247:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_p(_Format: [*c]const u8, ...) c_int;
pub fn _vsprintf_p_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_p(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsprintf_p(arg__Dst: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Dst = arg__Dst;
    _ = &_Dst;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsprintf_p_l(_Dst, _MaxCount, _Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1265:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1274:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vscprintf_p_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_p(_CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, _Locale, _ArgList);
}
pub fn _vscprintf_p(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vscprintf_p_l(_Format, null, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1292:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1301:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_p(_Format: [*c]const u8, ...) c_int;
pub fn _vfprintf_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vprintf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1319:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
// C:\msys64\ucrt64\include\stdio.h:1328:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsnprintf_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(_CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1342:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsprintf_l(arg__DstBuf: [*c]u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_l(_DstBuf, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1355:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vscprintf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(_CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, _Locale, _ArgList);
}
// C:\msys64\ucrt64\include\stdio.h:1369:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub extern fn fopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8) errno_t;
pub extern fn freopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8, _Stream: [*c]FILE) errno_t;
pub extern fn gets_s([*c]u8, rsize_t) [*c]u8;
pub extern fn tmpfile_s(_File: [*c][*c]FILE) errno_t;
pub extern fn tmpnam_s([*c]u8, rsize_t) errno_t;
pub extern fn _fread_nolock_s(_DstBuf: ?*anyopaque, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
pub extern const janet_type_names: [16][*c]const u8;
pub extern const janet_signal_names: [14][*c]const u8;
pub extern const janet_status_names: [16][*c]const u8;
pub const JanetHandle = ?*anyopaque;
pub const JANET_SIGNAL_OK: c_int = 0;
pub const JANET_SIGNAL_ERROR: c_int = 1;
pub const JANET_SIGNAL_DEBUG: c_int = 2;
pub const JANET_SIGNAL_YIELD: c_int = 3;
pub const JANET_SIGNAL_USER0: c_int = 4;
pub const JANET_SIGNAL_USER1: c_int = 5;
pub const JANET_SIGNAL_USER2: c_int = 6;
pub const JANET_SIGNAL_USER3: c_int = 7;
pub const JANET_SIGNAL_USER4: c_int = 8;
pub const JANET_SIGNAL_USER5: c_int = 9;
pub const JANET_SIGNAL_USER6: c_int = 10;
pub const JANET_SIGNAL_USER7: c_int = 11;
pub const JANET_SIGNAL_USER8: c_int = 12;
pub const JANET_SIGNAL_USER9: c_int = 13;
pub const JANET_SIGNAL_INTERRUPT: c_int = 12;
pub const JANET_SIGNAL_EVENT: c_int = 13;
pub const JanetSignal = c_uint;
pub const JANET_STATUS_DEAD: c_int = 0;
pub const JANET_STATUS_ERROR: c_int = 1;
pub const JANET_STATUS_DEBUG: c_int = 2;
pub const JANET_STATUS_PENDING: c_int = 3;
pub const JANET_STATUS_USER0: c_int = 4;
pub const JANET_STATUS_USER1: c_int = 5;
pub const JANET_STATUS_USER2: c_int = 6;
pub const JANET_STATUS_USER3: c_int = 7;
pub const JANET_STATUS_USER4: c_int = 8;
pub const JANET_STATUS_USER5: c_int = 9;
pub const JANET_STATUS_USER6: c_int = 10;
pub const JANET_STATUS_USER7: c_int = 11;
pub const JANET_STATUS_USER8: c_int = 12;
pub const JANET_STATUS_USER9: c_int = 13;
pub const JANET_STATUS_NEW: c_int = 14;
pub const JANET_STATUS_ALIVE: c_int = 15;
pub const JanetFiberStatus = c_uint;
pub const struct_JanetVM = opaque {
    pub const janet_loop1_interrupt = __root.janet_loop1_interrupt;
    pub const janet_ev_post_event = __root.janet_ev_post_event;
    pub const janet_vm_free = __root.janet_vm_free;
    pub const janet_vm_save = __root.janet_vm_save;
    pub const janet_vm_load = __root.janet_vm_load;
    pub const janet_interpreter_interrupt = __root.janet_interpreter_interrupt;
    pub const janet_interpreter_interrupt_handled = __root.janet_interpreter_interrupt_handled;
    pub const interrupt = __root.janet_loop1_interrupt;
    pub const event = __root.janet_ev_post_event;
    pub const save = __root.janet_vm_save;
    pub const load = __root.janet_vm_load;
    pub const handled = __root.janet_interpreter_interrupt_handled;
};
pub const JanetVM = struct_JanetVM;
pub const JanetGCObject = struct_JanetGCObject;
pub const JanetAtomicInt = c_long;
const union_unnamed_1 = extern union {
    next: [*c]JanetGCObject,
    refcount: JanetAtomicInt,
};
pub const struct_JanetGCObject = extern struct {
    flags: i32 = 0,
    data: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
};
pub const union_Janet = extern union {
    u64: u64,
    i64: i64,
    number: f64,
    pointer: ?*anyopaque,
    pub const janet_tuple_head = __root.janet_tuple_head;
    pub const janet_type = __root.janet_type;
    pub const janet_checktype = __root.janet_checktype;
    pub const janet_checktypes = __root.janet_checktypes;
    pub const janet_truthy = __root.janet_truthy;
    pub const janet_unwrap_struct = __root.janet_unwrap_struct;
    pub const janet_unwrap_tuple = __root.janet_unwrap_tuple;
    pub const janet_unwrap_fiber = __root.janet_unwrap_fiber;
    pub const janet_unwrap_array = __root.janet_unwrap_array;
    pub const janet_unwrap_table = __root.janet_unwrap_table;
    pub const janet_unwrap_buffer = __root.janet_unwrap_buffer;
    pub const janet_unwrap_string = __root.janet_unwrap_string;
    pub const janet_unwrap_symbol = __root.janet_unwrap_symbol;
    pub const janet_unwrap_keyword = __root.janet_unwrap_keyword;
    pub const janet_unwrap_abstract = __root.janet_unwrap_abstract;
    pub const janet_unwrap_pointer = __root.janet_unwrap_pointer;
    pub const janet_unwrap_function = __root.janet_unwrap_function;
    pub const janet_unwrap_cfunction = __root.janet_unwrap_cfunction;
    pub const janet_unwrap_boolean = __root.janet_unwrap_boolean;
    pub const janet_unwrap_number = __root.janet_unwrap_number;
    pub const janet_unwrap_integer = __root.janet_unwrap_integer;
    pub const janet_wrap_tuple = __root.janet_wrap_tuple;
    pub const janet_nanbox_to_pointer = __root.janet_nanbox_to_pointer;
    pub const janet_checkint8 = __root.janet_checkint8;
    pub const janet_checkuint8 = __root.janet_checkuint8;
    pub const janet_checkint16 = __root.janet_checkint16;
    pub const janet_checkuint16 = __root.janet_checkuint16;
    pub const janet_checkint = __root.janet_checkint;
    pub const janet_checkuint = __root.janet_checkuint;
    pub const janet_checkint64 = __root.janet_checkint64;
    pub const janet_checkuint64 = __root.janet_checkuint64;
    pub const janet_checksize = __root.janet_checksize;
    pub const janet_checkabstract = __root.janet_checkabstract;
    pub const janet_getchannel = __root.janet_getchannel;
    pub const janet_optchannel = __root.janet_optchannel;
    pub const janet_asm = __root.janet_asm;
    pub const janet_compile = __root.janet_compile;
    pub const janet_compile_lint = __root.janet_compile_lint;
    pub const janet_array_n = __root.janet_array_n;
    pub const janet_tuple_end = __root.janet_tuple_end;
    pub const janet_tuple_n = __root.janet_tuple_n;
    pub const janet_description = __root.janet_description;
    pub const janet_to_string = __root.janet_to_string;
    pub const janet_indexed_view = __root.janet_indexed_view;
    pub const janet_bytes_view = __root.janet_bytes_view;
    pub const janet_dictionary_view = __root.janet_dictionary_view;
    pub const janet_gcroot = __root.janet_gcroot;
    pub const janet_gcunroot = __root.janet_gcunroot;
    pub const janet_mark = __root.janet_mark;
    pub const janet_gcunrootall = __root.janet_gcunrootall;
    pub const janet_thunk_delay = __root.janet_thunk_delay;
    pub const janet_equals = __root.janet_equals;
    pub const janet_hash = __root.janet_hash;
    pub const janet_compare = __root.janet_compare;
    pub const janet_in = __root.janet_in;
    pub const janet_get = __root.janet_get;
    pub const janet_next = __root.janet_next;
    pub const janet_getindex = __root.janet_getindex;
    pub const janet_length = __root.janet_length;
    pub const janet_lengthv = __root.janet_lengthv;
    pub const janet_put = __root.janet_put;
    pub const janet_putindex = __root.janet_putindex;
    pub const janet_keyeq = __root.janet_keyeq;
    pub const janet_streq = __root.janet_streq;
    pub const janet_symeq = __root.janet_symeq;
    pub const janet_panicv = __root.janet_panicv;
    pub const janet_panic_type = __root.janet_panic_type;
    pub const janet_panic_abstract = __root.janet_panic_abstract;
    pub const janet_getnumber = __root.janet_getnumber;
    pub const janet_getarray = __root.janet_getarray;
    pub const janet_gettuple = __root.janet_gettuple;
    pub const janet_gettable = __root.janet_gettable;
    pub const janet_getstruct = __root.janet_getstruct;
    pub const janet_getstring = __root.janet_getstring;
    pub const janet_getcstring = __root.janet_getcstring;
    pub const janet_getcbytes = __root.janet_getcbytes;
    pub const janet_getsymbol = __root.janet_getsymbol;
    pub const janet_getkeyword = __root.janet_getkeyword;
    pub const janet_getbuffer = __root.janet_getbuffer;
    pub const janet_getfiber = __root.janet_getfiber;
    pub const janet_getfunction = __root.janet_getfunction;
    pub const janet_getcfunction = __root.janet_getcfunction;
    pub const janet_getboolean = __root.janet_getboolean;
    pub const janet_getpointer = __root.janet_getpointer;
    pub const janet_getnat = __root.janet_getnat;
    pub const janet_getinteger = __root.janet_getinteger;
    pub const janet_getinteger8 = __root.janet_getinteger8;
    pub const janet_getinteger16 = __root.janet_getinteger16;
    pub const janet_getinteger64 = __root.janet_getinteger64;
    pub const janet_getuinteger = __root.janet_getuinteger;
    pub const janet_getuinteger8 = __root.janet_getuinteger8;
    pub const janet_getuinteger16 = __root.janet_getuinteger16;
    pub const janet_getuinteger64 = __root.janet_getuinteger64;
    pub const janet_getsize = __root.janet_getsize;
    pub const janet_getindexed = __root.janet_getindexed;
    pub const janet_getbytes = __root.janet_getbytes;
    pub const janet_getdictionary = __root.janet_getdictionary;
    pub const janet_getabstract = __root.janet_getabstract;
    pub const janet_gethalfrange = __root.janet_gethalfrange;
    pub const janet_getstartrange = __root.janet_getstartrange;
    pub const janet_getendrange = __root.janet_getendrange;
    pub const janet_getargindex = __root.janet_getargindex;
    pub const janet_getflags = __root.janet_getflags;
    pub const janet_optnumber = __root.janet_optnumber;
    pub const janet_opttuple = __root.janet_opttuple;
    pub const janet_optstruct = __root.janet_optstruct;
    pub const janet_optstring = __root.janet_optstring;
    pub const janet_optcstring = __root.janet_optcstring;
    pub const janet_optcbytes = __root.janet_optcbytes;
    pub const janet_optsymbol = __root.janet_optsymbol;
    pub const janet_optkeyword = __root.janet_optkeyword;
    pub const janet_optfiber = __root.janet_optfiber;
    pub const janet_optfunction = __root.janet_optfunction;
    pub const janet_optcfunction = __root.janet_optcfunction;
    pub const janet_optboolean = __root.janet_optboolean;
    pub const janet_optpointer = __root.janet_optpointer;
    pub const janet_optnat = __root.janet_optnat;
    pub const janet_optinteger = __root.janet_optinteger;
    pub const janet_optinteger64 = __root.janet_optinteger64;
    pub const janet_optsize = __root.janet_optsize;
    pub const janet_optabstract = __root.janet_optabstract;
    pub const janet_optuinteger = __root.janet_optuinteger;
    pub const janet_optuinteger64 = __root.janet_optuinteger64;
    pub const janet_optbuffer = __root.janet_optbuffer;
    pub const janet_opttable = __root.janet_opttable;
    pub const janet_optarray = __root.janet_optarray;
    pub const janet_getfile = __root.janet_getfile;
    pub const janet_getjfile = __root.janet_getjfile;
    pub const janet_checkfile = __root.janet_checkfile;
    pub const janet_unwrapfile = __root.janet_unwrapfile;
    pub const janet_get_abstract_type = __root.janet_get_abstract_type;
    pub const janet_is_int = __root.janet_is_int;
    pub const janet_unwrap_s64 = __root.janet_unwrap_s64;
    pub const janet_unwrap_u64 = __root.janet_unwrap_u64;
    pub const head = __root.janet_tuple_head;
    pub const @"type" = __root.janet_type;
    pub const checktype = __root.janet_checktype;
    pub const checktypes = __root.janet_checktypes;
    pub const truthy = __root.janet_truthy;
    pub const @"struct" = __root.janet_unwrap_struct;
    pub const tuple = __root.janet_unwrap_tuple;
    pub const fiber = __root.janet_unwrap_fiber;
    pub const array = __root.janet_unwrap_array;
    pub const table = __root.janet_unwrap_table;
    pub const buffer = __root.janet_unwrap_buffer;
    pub const string = __root.janet_unwrap_string;
    pub const symbol = __root.janet_unwrap_symbol;
    pub const keyword = __root.janet_unwrap_keyword;
    pub const abstract = __root.janet_unwrap_abstract;
    pub const function = __root.janet_unwrap_function;
    pub const cfunction = __root.janet_unwrap_cfunction;
    pub const boolean = __root.janet_unwrap_boolean;
    pub const integer = __root.janet_unwrap_integer;
    pub const checkint8 = __root.janet_checkint8;
    pub const checkuint8 = __root.janet_checkuint8;
    pub const checkint16 = __root.janet_checkint16;
    pub const checkuint16 = __root.janet_checkuint16;
    pub const checkint = __root.janet_checkint;
    pub const checkuint = __root.janet_checkuint;
    pub const checkint64 = __root.janet_checkint64;
    pub const checkuint64 = __root.janet_checkuint64;
    pub const checksize = __root.janet_checksize;
    pub const checkabstract = __root.janet_checkabstract;
    pub const getchannel = __root.janet_getchannel;
    pub const optchannel = __root.janet_optchannel;
    pub const @"asm" = __root.janet_asm;
    pub const compile = __root.janet_compile;
    pub const lint = __root.janet_compile_lint;
    pub const n = __root.janet_array_n;
    pub const end = __root.janet_tuple_end;
    pub const description = __root.janet_description;
    pub const view = __root.janet_indexed_view;
    pub const gcroot = __root.janet_gcroot;
    pub const gcunroot = __root.janet_gcunroot;
    pub const mark = __root.janet_mark;
    pub const gcunrootall = __root.janet_gcunrootall;
    pub const delay = __root.janet_thunk_delay;
    pub const equals = __root.janet_equals;
    pub const hash = __root.janet_hash;
    pub const compare = __root.janet_compare;
    pub const in = __root.janet_in;
    pub const get = __root.janet_get;
    pub const next = __root.janet_next;
    pub const getindex = __root.janet_getindex;
    pub const length = __root.janet_length;
    pub const lengthv = __root.janet_lengthv;
    pub const put = __root.janet_put;
    pub const putindex = __root.janet_putindex;
    pub const keyeq = __root.janet_keyeq;
    pub const streq = __root.janet_streq;
    pub const symeq = __root.janet_symeq;
    pub const panicv = __root.janet_panicv;
    pub const getnumber = __root.janet_getnumber;
    pub const getarray = __root.janet_getarray;
    pub const gettuple = __root.janet_gettuple;
    pub const gettable = __root.janet_gettable;
    pub const getstruct = __root.janet_getstruct;
    pub const getstring = __root.janet_getstring;
    pub const getcstring = __root.janet_getcstring;
    pub const getcbytes = __root.janet_getcbytes;
    pub const getsymbol = __root.janet_getsymbol;
    pub const getkeyword = __root.janet_getkeyword;
    pub const getbuffer = __root.janet_getbuffer;
    pub const getfiber = __root.janet_getfiber;
    pub const getfunction = __root.janet_getfunction;
    pub const getcfunction = __root.janet_getcfunction;
    pub const getboolean = __root.janet_getboolean;
    pub const getpointer = __root.janet_getpointer;
    pub const getnat = __root.janet_getnat;
    pub const getinteger = __root.janet_getinteger;
    pub const getinteger8 = __root.janet_getinteger8;
    pub const getinteger16 = __root.janet_getinteger16;
    pub const getinteger64 = __root.janet_getinteger64;
    pub const getuinteger = __root.janet_getuinteger;
    pub const getuinteger8 = __root.janet_getuinteger8;
    pub const getuinteger16 = __root.janet_getuinteger16;
    pub const getuinteger64 = __root.janet_getuinteger64;
    pub const getsize = __root.janet_getsize;
    pub const getindexed = __root.janet_getindexed;
    pub const getbytes = __root.janet_getbytes;
    pub const getdictionary = __root.janet_getdictionary;
    pub const getabstract = __root.janet_getabstract;
    pub const gethalfrange = __root.janet_gethalfrange;
    pub const getstartrange = __root.janet_getstartrange;
    pub const getendrange = __root.janet_getendrange;
    pub const getargindex = __root.janet_getargindex;
    pub const getflags = __root.janet_getflags;
    pub const optnumber = __root.janet_optnumber;
    pub const opttuple = __root.janet_opttuple;
    pub const optstruct = __root.janet_optstruct;
    pub const optstring = __root.janet_optstring;
    pub const optcstring = __root.janet_optcstring;
    pub const optcbytes = __root.janet_optcbytes;
    pub const optsymbol = __root.janet_optsymbol;
    pub const optkeyword = __root.janet_optkeyword;
    pub const optfiber = __root.janet_optfiber;
    pub const optfunction = __root.janet_optfunction;
    pub const optcfunction = __root.janet_optcfunction;
    pub const optboolean = __root.janet_optboolean;
    pub const optpointer = __root.janet_optpointer;
    pub const optnat = __root.janet_optnat;
    pub const optinteger = __root.janet_optinteger;
    pub const optinteger64 = __root.janet_optinteger64;
    pub const optsize = __root.janet_optsize;
    pub const optabstract = __root.janet_optabstract;
    pub const optuinteger = __root.janet_optuinteger;
    pub const optuinteger64 = __root.janet_optuinteger64;
    pub const optbuffer = __root.janet_optbuffer;
    pub const opttable = __root.janet_opttable;
    pub const optarray = __root.janet_optarray;
    pub const getfile = __root.janet_getfile;
    pub const getjfile = __root.janet_getjfile;
    pub const checkfile = __root.janet_checkfile;
    pub const unwrapfile = __root.janet_unwrapfile;
    pub const int = __root.janet_is_int;
    pub const s64 = __root.janet_unwrap_s64;
};
pub const Janet = union_Janet;
pub const struct_JanetSourceMapping = extern struct {
    line: i32 = 0,
    column: i32 = 0,
};
pub const JanetSourceMapping = struct_JanetSourceMapping;
pub const JanetString = [*c]const u8;
pub const struct_JanetSymbolMap = extern struct {
    birth_pc: u32 = 0,
    death_pc: u32 = 0,
    slot_index: u32 = 0,
    symbol: [*c]const u8 = null,
};
pub const JanetSymbolMap = struct_JanetSymbolMap;
pub const struct_JanetFuncDef = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    environments: [*c]i32 = null,
    constants: [*c]Janet = null,
    defs: [*c][*c]JanetFuncDef = null,
    bytecode: [*c]u32 = null,
    closure_bitset: [*c]u32 = null,
    sourcemap: [*c]JanetSourceMapping = null,
    source: JanetString = null,
    name: JanetString = null,
    symbolmap: [*c]JanetSymbolMap = null,
    flags: i32 = 0,
    slotcount: i32 = 0,
    arity: i32 = 0,
    min_arity: i32 = 0,
    max_arity: i32 = 0,
    constants_length: i32 = 0,
    bytecode_length: i32 = 0,
    environments_length: i32 = 0,
    defs_length: i32 = 0,
    symbolmap_length: i32 = 0,
    named_args_count: i32 = 0,
    pub const janet_disasm = __root.janet_disasm;
    pub const janet_debug_break = __root.janet_debug_break;
    pub const janet_debug_unbreak = __root.janet_debug_unbreak;
    pub const janet_thunk = __root.janet_thunk;
    pub const janet_verify = __root.janet_verify;
    pub const disasm = __root.janet_disasm;
    pub const @"break" = __root.janet_debug_break;
    pub const unbreak = __root.janet_debug_unbreak;
    pub const thunk = __root.janet_thunk;
    pub const verify = __root.janet_verify;
};
pub const JanetFuncDef = struct_JanetFuncDef;
pub const struct_JanetKV = extern struct {
    key: Janet = @import("std").mem.zeroes(Janet),
    value: Janet = @import("std").mem.zeroes(Janet),
    pub const janet_struct_head = __root.janet_struct_head;
    pub const janet_wrap_struct = __root.janet_wrap_struct;
    pub const janet_struct_put = __root.janet_struct_put;
    pub const janet_struct_end = __root.janet_struct_end;
    pub const janet_struct_get = __root.janet_struct_get;
    pub const janet_struct_rawget = __root.janet_struct_rawget;
    pub const janet_struct_get_ex = __root.janet_struct_get_ex;
    pub const janet_struct_to_table = __root.janet_struct_to_table;
    pub const janet_struct_find = __root.janet_struct_find;
    pub const janet_dictionary_get = __root.janet_dictionary_get;
    pub const janet_dictionary_next = __root.janet_dictionary_next;
    pub const janet_sorted_keys = __root.janet_sorted_keys;
    pub const head = __root.janet_struct_head;
    pub const @"struct" = __root.janet_wrap_struct;
    pub const put = __root.janet_struct_put;
    pub const end = __root.janet_struct_end;
    pub const get = __root.janet_struct_get;
    pub const rawget = __root.janet_struct_rawget;
    pub const ex = __root.janet_struct_get_ex;
    pub const table = __root.janet_struct_to_table;
    pub const find = __root.janet_struct_find;
    pub const next = __root.janet_dictionary_next;
    pub const keys = __root.janet_sorted_keys;
};
pub const JanetKV = struct_JanetKV;
pub const struct_JanetTable = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    count: i32 = 0,
    capacity: i32 = 0,
    deleted: i32 = 0,
    data: [*c]JanetKV = null,
    proto: [*c]JanetTable = null,
    pub const janet_wrap_table = __root.janet_wrap_table;
    pub const janet_core_env = __root.janet_core_env;
    pub const janet_core_lookup_table = __root.janet_core_lookup_table;
    pub const janet_dobytes = __root.janet_dobytes;
    pub const janet_dostring = __root.janet_dostring;
    pub const janet_table_init = __root.janet_table_init;
    pub const janet_table_init_raw = __root.janet_table_init_raw;
    pub const janet_table_deinit = __root.janet_table_deinit;
    pub const janet_table_get = __root.janet_table_get;
    pub const janet_table_get_ex = __root.janet_table_get_ex;
    pub const janet_table_rawget = __root.janet_table_rawget;
    pub const janet_table_remove = __root.janet_table_remove;
    pub const janet_table_put = __root.janet_table_put;
    pub const janet_table_to_struct = __root.janet_table_to_struct;
    pub const janet_table_merge_table = __root.janet_table_merge_table;
    pub const janet_table_merge_struct = __root.janet_table_merge_struct;
    pub const janet_table_find = __root.janet_table_find;
    pub const janet_table_clone = __root.janet_table_clone;
    pub const janet_table_clear = __root.janet_table_clear;
    pub const janet_env_lookup = __root.janet_env_lookup;
    pub const janet_env_lookup_into = __root.janet_env_lookup_into;
    pub const janet_def = __root.janet_def;
    pub const janet_var = __root.janet_var;
    pub const janet_cfuns = __root.janet_cfuns;
    pub const janet_cfuns_prefix = __root.janet_cfuns_prefix;
    pub const janet_resolve = __root.janet_resolve;
    pub const janet_resolve_ext = __root.janet_resolve_ext;
    pub const janet_cfuns_ext = __root.janet_cfuns_ext;
    pub const janet_cfuns_ext_prefix = __root.janet_cfuns_ext_prefix;
    pub const janet_def_sm = __root.janet_def_sm;
    pub const janet_var_sm = __root.janet_var_sm;
    pub const table = __root.janet_wrap_table;
    pub const env = __root.janet_core_env;
    pub const dobytes = __root.janet_dobytes;
    pub const dostring = __root.janet_dostring;
    pub const init = __root.janet_table_init;
    pub const raw = __root.janet_table_init_raw;
    pub const deinit = __root.janet_table_deinit;
    pub const get = __root.janet_table_get;
    pub const ex = __root.janet_table_get_ex;
    pub const rawget = __root.janet_table_rawget;
    pub const put = __root.janet_table_put;
    pub const @"struct" = __root.janet_table_to_struct;
    pub const find = __root.janet_table_find;
    pub const clone = __root.janet_table_clone;
    pub const clear = __root.janet_table_clear;
    pub const lookup = __root.janet_env_lookup;
    pub const into = __root.janet_env_lookup_into;
    pub const def = __root.janet_def;
    pub const @"var" = __root.janet_var;
    pub const cfuns = __root.janet_cfuns;
    pub const prefix = __root.janet_cfuns_prefix;
    pub const resolve = __root.janet_resolve;
    pub const ext = __root.janet_resolve_ext;
    pub const sm = __root.janet_def_sm;
};
pub const JanetTable = struct_JanetTable;
pub const JanetEVCallback = ?*const fn (fiber: [*c]JanetFiber, event: JanetAsyncEvent) callconv(.c) void;
pub const struct_JanetStream = extern struct {
    handle: JanetHandle = null,
    flags: u32 = 0,
    index: u32 = 0,
    read_fiber: [*c]JanetFiber = null,
    write_fiber: [*c]JanetFiber = null,
    methods: ?*const anyopaque = null,
    pub const janet_async_start = __root.janet_async_start;
    pub const janet_stream_edge_triggered = __root.janet_stream_edge_triggered;
    pub const janet_stream_level_triggered = __root.janet_stream_level_triggered;
    pub const janet_stream_close = __root.janet_stream_close;
    pub const janet_stream_flags = __root.janet_stream_flags;
    pub const janet_ev_read = __root.janet_ev_read;
    pub const janet_ev_readchunk = __root.janet_ev_readchunk;
    pub const janet_ev_recv = __root.janet_ev_recv;
    pub const janet_ev_recvchunk = __root.janet_ev_recvchunk;
    pub const janet_ev_recvfrom = __root.janet_ev_recvfrom;
    pub const janet_ev_write_buffer = __root.janet_ev_write_buffer;
    pub const janet_ev_write_string = __root.janet_ev_write_string;
    pub const janet_ev_send_buffer = __root.janet_ev_send_buffer;
    pub const janet_ev_send_string = __root.janet_ev_send_string;
    pub const janet_ev_sendto_buffer = __root.janet_ev_sendto_buffer;
    pub const janet_ev_sendto_string = __root.janet_ev_sendto_string;
    pub const start = __root.janet_async_start;
    pub const triggered = __root.janet_stream_edge_triggered;
    pub const close = __root.janet_stream_close;
    pub const read = __root.janet_ev_read;
    pub const readchunk = __root.janet_ev_readchunk;
    pub const recv = __root.janet_ev_recv;
    pub const recvchunk = __root.janet_ev_recvchunk;
    pub const recvfrom = __root.janet_ev_recvfrom;
    pub const buffer = __root.janet_ev_write_buffer;
    pub const string = __root.janet_ev_write_string;
};
pub const JanetStream = struct_JanetStream;
pub const struct_JanetFiber = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    flags: i32 = 0,
    frame: i32 = 0,
    stackstart: i32 = 0,
    stacktop: i32 = 0,
    capacity: i32 = 0,
    maxstack: i32 = 0,
    env: [*c]JanetTable = null,
    data: [*c]Janet = null,
    child: [*c]JanetFiber = null,
    last_value: Janet = @import("std").mem.zeroes(Janet),
    sched_id: u32 = 0,
    ev_callback: JanetEVCallback = null,
    ev_stream: [*c]JanetStream = null,
    ev_state: ?*anyopaque = null,
    supervisor_channel: ?*anyopaque = null,
    pub const janet_async_start_fiber = __root.janet_async_start_fiber;
    pub const janet_async_end = __root.janet_async_end;
    pub const janet_async_in_flight = __root.janet_async_in_flight;
    pub const janet_wrap_fiber = __root.janet_wrap_fiber;
    pub const janet_schedule = __root.janet_schedule;
    pub const janet_cancel = __root.janet_cancel;
    pub const janet_schedule_signal = __root.janet_schedule_signal;
    pub const janet_schedule_soon = __root.janet_schedule_soon;
    pub const janet_loop_fiber = __root.janet_loop_fiber;
    pub const janet_fiber_reset = __root.janet_fiber_reset;
    pub const janet_fiber_status = __root.janet_fiber_status;
    pub const janet_fiber_can_resume = __root.janet_fiber_can_resume;
    pub const janet_continue = __root.janet_continue;
    pub const janet_continue_signal = __root.janet_continue_signal;
    pub const janet_step = __root.janet_step;
    pub const janet_stacktrace = __root.janet_stacktrace;
    pub const janet_stacktrace_ext = __root.janet_stacktrace_ext;
    pub const fiber = __root.janet_async_start_fiber;
    pub const end = __root.janet_async_end;
    pub const flight = __root.janet_async_in_flight;
    pub const schedule = __root.janet_schedule;
    pub const cancel = __root.janet_cancel;
    pub const signal = __root.janet_schedule_signal;
    pub const soon = __root.janet_schedule_soon;
    pub const reset = __root.janet_fiber_reset;
    pub const status = __root.janet_fiber_status;
    pub const @"resume" = __root.janet_fiber_can_resume;
    pub const @"continue" = __root.janet_continue;
    pub const step = __root.janet_step;
    pub const stacktrace = __root.janet_stacktrace;
    pub const ext = __root.janet_stacktrace_ext;
};
pub const JanetFiber = struct_JanetFiber;
const union_unnamed_2 = extern union {
    fiber: [*c]JanetFiber,
    values: [*c]Janet,
};
pub const struct_JanetFuncEnv = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    as: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
    length: i32 = 0,
    offset: i32 = 0,
};
pub const JanetFuncEnv = struct_JanetFuncEnv;
pub const struct_JanetFunction = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    def: [*c]JanetFuncDef = null,
    _envs: [0][*c]JanetFuncEnv = @import("std").mem.zeroes([0][*c]JanetFuncEnv),
    pub fn envs(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._envs)).array.child) {
        return @ptrCast(@alignCast(&_self.*._envs));
    }
    pub const janet_wrap_function = __root.janet_wrap_function;
    pub const janet_fiber = __root.janet_fiber;
    pub const janet_pcall = __root.janet_pcall;
    pub const janet_call = __root.janet_call;
    pub const function = __root.janet_wrap_function;
    pub const fiber = __root.janet_fiber;
    pub const pcall = __root.janet_pcall;
    pub const call = __root.janet_call;
};
pub const JanetFunction = struct_JanetFunction;
pub const struct_JanetArray = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    count: i32 = 0,
    capacity: i32 = 0,
    data: [*c]Janet = null,
    pub const janet_wrap_array = __root.janet_wrap_array;
    pub const janet_array_ensure = __root.janet_array_ensure;
    pub const janet_array_setcount = __root.janet_array_setcount;
    pub const janet_array_push = __root.janet_array_push;
    pub const janet_array_pop = __root.janet_array_pop;
    pub const janet_array_peek = __root.janet_array_peek;
    pub const array = __root.janet_wrap_array;
    pub const ensure = __root.janet_array_ensure;
    pub const setcount = __root.janet_array_setcount;
    pub const push = __root.janet_array_push;
    pub const pop = __root.janet_array_pop;
    pub const peek = __root.janet_array_peek;
};
pub const JanetArray = struct_JanetArray;
pub const struct_JanetBuffer = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    count: i32 = 0,
    capacity: i32 = 0,
    data: [*c]u8 = null,
    pub const janet_wrap_buffer = __root.janet_wrap_buffer;
    pub const janet_buffer_init = __root.janet_buffer_init;
    pub const janet_buffer_deinit = __root.janet_buffer_deinit;
    pub const janet_buffer_ensure = __root.janet_buffer_ensure;
    pub const janet_buffer_setcount = __root.janet_buffer_setcount;
    pub const janet_buffer_extra = __root.janet_buffer_extra;
    pub const janet_buffer_push_bytes = __root.janet_buffer_push_bytes;
    pub const janet_buffer_push_string = __root.janet_buffer_push_string;
    pub const janet_buffer_push_cstring = __root.janet_buffer_push_cstring;
    pub const janet_buffer_push_u8 = __root.janet_buffer_push_u8;
    pub const janet_buffer_push_u16 = __root.janet_buffer_push_u16;
    pub const janet_buffer_push_u32 = __root.janet_buffer_push_u32;
    pub const janet_buffer_push_u64 = __root.janet_buffer_push_u64;
    pub const janet_to_string_b = __root.janet_to_string_b;
    pub const janet_description_b = __root.janet_description_b;
    pub const janet_formatb = __root.janet_formatb;
    pub const janet_formatbv = __root.janet_formatbv;
    pub const janet_marshal = __root.janet_marshal;
    pub const janet_pretty = __root.janet_pretty;
    pub const buffer = __root.janet_wrap_buffer;
    pub const init = __root.janet_buffer_init;
    pub const deinit = __root.janet_buffer_deinit;
    pub const ensure = __root.janet_buffer_ensure;
    pub const setcount = __root.janet_buffer_setcount;
    pub const extra = __root.janet_buffer_extra;
    pub const bytes = __root.janet_buffer_push_bytes;
    pub const string = __root.janet_buffer_push_string;
    pub const cstring = __root.janet_buffer_push_cstring;
    pub const @"u8" = __root.janet_buffer_push_u8;
    pub const @"u16" = __root.janet_buffer_push_u16;
    pub const @"u32" = __root.janet_buffer_push_u32;
    pub const @"u64" = __root.janet_buffer_push_u64;
    pub const b = __root.janet_to_string_b;
    pub const formatb = __root.janet_formatb;
    pub const formatbv = __root.janet_formatbv;
    pub const marshal = __root.janet_marshal;
    pub const pretty = __root.janet_pretty;
};
pub const JanetBuffer = struct_JanetBuffer;
pub const struct_JanetTupleHead = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    length: i32 = 0,
    hash: i32 = 0,
    sm_line: i32 = 0,
    sm_column: i32 = 0,
    _data: [0]Janet = @import("std").mem.zeroes([0]Janet),
    pub fn data(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._data)).array.child) {
        return @ptrCast(@alignCast(&_self.*._data));
    }
};
pub const JanetTupleHead = struct_JanetTupleHead;
pub const struct_JanetStructHead = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    length: i32 = 0,
    hash: i32 = 0,
    capacity: i32 = 0,
    proto: [*c]const JanetKV = null,
    _data: [0]JanetKV = @import("std").mem.zeroes([0]JanetKV),
    pub fn data(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._data)).array.child) {
        return @ptrCast(@alignCast(&_self.*._data));
    }
};
pub const JanetStructHead = struct_JanetStructHead;
pub const struct_JanetStringHead = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    length: i32 = 0,
    hash: i32 = 0,
    _data: [0]u8 = @import("std").mem.zeroes([0]u8),
    pub fn data(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._data)).array.child) {
        return @ptrCast(@alignCast(&_self.*._data));
    }
};
pub const JanetStringHead = struct_JanetStringHead;
pub const struct_JanetMarshalContext = extern struct {
    m_state: ?*anyopaque = null,
    u_state: ?*anyopaque = null,
    flags: c_int = 0,
    data: [*c]const u8 = null,
    at: [*c]const JanetAbstractType = null,
    pub const janet_marshal_size = __root.janet_marshal_size;
    pub const janet_marshal_int = __root.janet_marshal_int;
    pub const janet_marshal_int64 = __root.janet_marshal_int64;
    pub const janet_marshal_ptr = __root.janet_marshal_ptr;
    pub const janet_marshal_byte = __root.janet_marshal_byte;
    pub const janet_marshal_bytes = __root.janet_marshal_bytes;
    pub const janet_marshal_janet = __root.janet_marshal_janet;
    pub const janet_marshal_abstract = __root.janet_marshal_abstract;
    pub const janet_marshal_flags = __root.janet_marshal_flags;
    pub const janet_unmarshal_ensure = __root.janet_unmarshal_ensure;
    pub const janet_unmarshal_size = __root.janet_unmarshal_size;
    pub const janet_unmarshal_int = __root.janet_unmarshal_int;
    pub const janet_unmarshal_int64 = __root.janet_unmarshal_int64;
    pub const janet_unmarshal_ptr = __root.janet_unmarshal_ptr;
    pub const janet_unmarshal_byte = __root.janet_unmarshal_byte;
    pub const janet_unmarshal_bytes = __root.janet_unmarshal_bytes;
    pub const janet_unmarshal_janet = __root.janet_unmarshal_janet;
    pub const janet_unmarshal_abstract = __root.janet_unmarshal_abstract;
    pub const janet_unmarshal_abstract_threaded = __root.janet_unmarshal_abstract_threaded;
    pub const janet_unmarshal_abstract_reuse = __root.janet_unmarshal_abstract_reuse;
    pub const janet_unmarshal_flags = __root.janet_unmarshal_flags;
    pub const size = __root.janet_marshal_size;
    pub const int = __root.janet_marshal_int;
    pub const int64 = __root.janet_marshal_int64;
    pub const ptr = __root.janet_marshal_ptr;
    pub const byte = __root.janet_marshal_byte;
    pub const bytes = __root.janet_marshal_bytes;
    pub const janet = __root.janet_marshal_janet;
    pub const abstract = __root.janet_marshal_abstract;
    pub const ensure = __root.janet_unmarshal_ensure;
    pub const threaded = __root.janet_unmarshal_abstract_threaded;
    pub const reuse = __root.janet_unmarshal_abstract_reuse;
};
pub const JanetMarshalContext = struct_JanetMarshalContext;
pub const struct_JanetByteView = extern struct {
    bytes: [*c]const u8 = null,
    len: i32 = 0,
};
pub const JanetByteView = struct_JanetByteView;
pub const struct_JanetAbstractType = extern struct {
    name: [*c]const u8 = null,
    gc: ?*const fn (data: ?*anyopaque, len: usize) callconv(.c) c_int = null,
    gcmark: ?*const fn (data: ?*anyopaque, len: usize) callconv(.c) c_int = null,
    get: ?*const fn (data: ?*anyopaque, key: Janet, out: [*c]Janet) callconv(.c) c_int = null,
    put: ?*const fn (data: ?*anyopaque, key: Janet, value: Janet) callconv(.c) void = null,
    marshal: ?*const fn (p: ?*anyopaque, ctx: [*c]JanetMarshalContext) callconv(.c) void = null,
    unmarshal: ?*const fn (ctx: [*c]JanetMarshalContext) callconv(.c) ?*anyopaque = null,
    tostring: ?*const fn (p: ?*anyopaque, buffer: [*c]JanetBuffer) callconv(.c) void = null,
    compare: ?*const fn (lhs: ?*anyopaque, rhs: ?*anyopaque) callconv(.c) c_int = null,
    hash: ?*const fn (p: ?*anyopaque, len: usize) callconv(.c) i32 = null,
    next: ?*const fn (p: ?*anyopaque, key: Janet) callconv(.c) Janet = null,
    call: ?*const fn (p: ?*anyopaque, argc: i32, argv: [*c]Janet) callconv(.c) Janet = null,
    length: ?*const fn (p: ?*anyopaque, len: usize) callconv(.c) usize = null,
    bytes: ?*const fn (p: ?*anyopaque, len: usize) callconv(.c) JanetByteView = null,
    gcperthread: ?*const fn (data: ?*anyopaque, len: usize) callconv(.c) c_int = null,
    pub const janet_abstract_begin_threaded = __root.janet_abstract_begin_threaded;
    pub const janet_abstract_threaded = __root.janet_abstract_threaded;
    pub const janet_abstract_begin = __root.janet_abstract_begin;
    pub const janet_abstract = __root.janet_abstract;
    pub const janet_register_abstract_type = __root.janet_register_abstract_type;
    pub const threaded = __root.janet_abstract_begin_threaded;
    pub const begin = __root.janet_abstract_begin;
    pub const abstract = __root.janet_abstract;
    pub const @"type" = __root.janet_register_abstract_type;
};
pub const JanetAbstractType = struct_JanetAbstractType;
pub const struct_JanetAbstractHead = extern struct {
    gc: JanetGCObject = @import("std").mem.zeroes(JanetGCObject),
    type: [*c]const JanetAbstractType = null,
    size: usize = 0,
    _data: [0]c_longlong = @import("std").mem.zeroes([0]c_longlong),
    pub fn data(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._data)).array.child) {
        return @ptrCast(@alignCast(&_self.*._data));
    }
};
pub const JanetAbstractHead = struct_JanetAbstractHead;
pub const struct_JanetStackFrame = extern struct {
    func: [*c]JanetFunction = null,
    pc: [*c]u32 = null,
    env: [*c]JanetFuncEnv = null,
    prevframe: i32 = 0,
    flags: i32 = 0,
};
pub const JanetStackFrame = struct_JanetStackFrame;
pub const JanetCFunction = ?*const fn (argc: i32, argv: [*c]Janet) callconv(.c) Janet;
pub const struct_JanetReg = extern struct {
    name: [*c]const u8 = null,
    cfun: JanetCFunction = null,
    documentation: [*c]const u8 = null,
};
pub const JanetReg = struct_JanetReg;
pub const struct_JanetRegExt = extern struct {
    name: [*c]const u8 = null,
    cfun: JanetCFunction = null,
    documentation: [*c]const u8 = null,
    source_file: [*c]const u8 = null,
    source_line: i32 = 0,
};
pub const JanetRegExt = struct_JanetRegExt;
pub const struct_JanetMethod = extern struct {
    name: [*c]const u8 = null,
    cfun: JanetCFunction = null,
    pub const janet_nextmethod = __root.janet_nextmethod;
    pub const nextmethod = __root.janet_nextmethod;
};
pub const JanetMethod = struct_JanetMethod;
pub const struct_JanetView = extern struct {
    items: [*c]const Janet = null,
    len: i32 = 0,
};
pub const JanetView = struct_JanetView;
pub const struct_JanetDictView = extern struct {
    kvs: [*c]const JanetKV = null,
    len: i32 = 0,
    cap: i32 = 0,
};
pub const JanetDictView = struct_JanetDictView;
pub const struct_JanetRange = extern struct {
    start: i32 = 0,
    end: i32 = 0,
};
pub const JanetRange = struct_JanetRange;
pub const struct_JanetRNG = extern struct {
    a: u32 = 0,
    b: u32 = 0,
    c: u32 = 0,
    d: u32 = 0,
    counter: u32 = 0,
    pub const janet_rng_seed = __root.janet_rng_seed;
    pub const janet_rng_longseed = __root.janet_rng_longseed;
    pub const janet_rng_u32 = __root.janet_rng_u32;
    pub const janet_rng_double = __root.janet_rng_double;
    pub const seed = __root.janet_rng_seed;
    pub const longseed = __root.janet_rng_longseed;
    pub const @"u32" = __root.janet_rng_u32;
    pub const double = __root.janet_rng_double;
};
pub const JanetRNG = struct_JanetRNG;
pub const JANET_NUMBER: c_int = 0;
pub const JANET_NIL: c_int = 1;
pub const JANET_BOOLEAN: c_int = 2;
pub const JANET_FIBER: c_int = 3;
pub const JANET_STRING: c_int = 4;
pub const JANET_SYMBOL: c_int = 5;
pub const JANET_KEYWORD: c_int = 6;
pub const JANET_ARRAY: c_int = 7;
pub const JANET_TUPLE: c_int = 8;
pub const JANET_TABLE: c_int = 9;
pub const JANET_STRUCT: c_int = 10;
pub const JANET_BUFFER: c_int = 11;
pub const JANET_FUNCTION: c_int = 12;
pub const JANET_CFUNCTION: c_int = 13;
pub const JANET_ABSTRACT: c_int = 14;
pub const JANET_POINTER: c_int = 15;
pub const enum_JanetType = c_uint;
pub const JanetType = enum_JanetType;
pub const JanetSymbol = [*c]const u8;
pub const JanetKeyword = [*c]const u8;
pub const JanetTuple = [*c]const Janet;
pub const JanetStruct = [*c]const JanetKV;
pub const JanetAbstract = ?*anyopaque;
pub const JANET_ASYNC_EVENT_INIT: c_int = 0;
pub const JANET_ASYNC_EVENT_MARK: c_int = 1;
pub const JANET_ASYNC_EVENT_DEINIT: c_int = 2;
pub const JANET_ASYNC_EVENT_CLOSE: c_int = 3;
pub const JANET_ASYNC_EVENT_ERR: c_int = 4;
pub const JANET_ASYNC_EVENT_HUP: c_int = 5;
pub const JANET_ASYNC_EVENT_READ: c_int = 6;
pub const JANET_ASYNC_EVENT_WRITE: c_int = 7;
pub const JANET_ASYNC_EVENT_COMPLETE: c_int = 8;
pub const JANET_ASYNC_EVENT_FAILED: c_int = 9;
pub const JanetAsyncEvent = c_uint;
pub const JANET_ASYNC_LISTEN_READ: c_int = 1;
pub const JANET_ASYNC_LISTEN_WRITE: c_int = 2;
pub const JANET_ASYNC_LISTEN_BOTH: c_int = 3;
pub const JanetAsyncMode = c_uint;
pub extern fn janet_async_start_fiber(fiber: [*c]JanetFiber, stream: [*c]JanetStream, mode: JanetAsyncMode, callback: JanetEVCallback, state: ?*anyopaque) void;
pub extern fn janet_async_start(stream: [*c]JanetStream, mode: JanetAsyncMode, callback: JanetEVCallback, state: ?*anyopaque) noreturn;
pub extern fn janet_async_end(fiber: [*c]JanetFiber) void;
pub extern fn janet_async_in_flight(fiber: [*c]JanetFiber) void;
pub extern fn janet_stream_edge_triggered(stream: [*c]JanetStream) void;
pub extern fn janet_stream_level_triggered(stream: [*c]JanetStream) void;
pub extern fn janet_atomic_inc(x: [*c]volatile JanetAtomicInt) JanetAtomicInt;
pub extern fn janet_atomic_dec(x: [*c]volatile JanetAtomicInt) JanetAtomicInt;
pub extern fn janet_atomic_load(x: [*c]volatile JanetAtomicInt) JanetAtomicInt;
pub extern fn janet_atomic_load_relaxed(x: [*c]volatile JanetAtomicInt) JanetAtomicInt;
pub extern fn janet_struct_head(st: JanetStruct) [*c]JanetStructHead;
pub extern fn janet_abstract_head(abstract: ?*const anyopaque) [*c]JanetAbstractHead;
pub extern fn janet_string_head(s: JanetString) [*c]JanetStringHead;
pub extern fn janet_tuple_head(tuple: JanetTuple) [*c]JanetTupleHead;
pub extern fn janet_type(x: Janet) JanetType;
pub extern fn janet_checktype(x: Janet, @"type": JanetType) c_int;
pub extern fn janet_checktypes(x: Janet, typeflags: c_int) c_int;
pub extern fn janet_truthy(x: Janet) c_int;
pub extern fn janet_unwrap_struct(x: Janet) JanetStruct;
pub extern fn janet_unwrap_tuple(x: Janet) JanetTuple;
pub extern fn janet_unwrap_fiber(x: Janet) [*c]JanetFiber;
pub extern fn janet_unwrap_array(x: Janet) [*c]JanetArray;
pub extern fn janet_unwrap_table(x: Janet) [*c]JanetTable;
pub extern fn janet_unwrap_buffer(x: Janet) [*c]JanetBuffer;
pub extern fn janet_unwrap_string(x: Janet) JanetString;
pub extern fn janet_unwrap_symbol(x: Janet) JanetSymbol;
pub extern fn janet_unwrap_keyword(x: Janet) JanetKeyword;
pub extern fn janet_unwrap_abstract(x: Janet) JanetAbstract;
pub extern fn janet_unwrap_pointer(x: Janet) ?*anyopaque;
pub extern fn janet_unwrap_function(x: Janet) [*c]JanetFunction;
pub extern fn janet_unwrap_cfunction(x: Janet) JanetCFunction;
pub extern fn janet_unwrap_boolean(x: Janet) c_int;
pub extern fn janet_unwrap_number(x: Janet) f64;
pub extern fn janet_unwrap_integer(x: Janet) i32;
pub extern fn janet_wrap_nil() Janet;
pub extern fn janet_wrap_number(x: f64) Janet;
pub extern fn janet_wrap_true() Janet;
pub extern fn janet_wrap_false() Janet;
pub extern fn janet_wrap_boolean(x: c_int) Janet;
pub extern fn janet_wrap_string(x: JanetString) Janet;
pub extern fn janet_wrap_symbol(x: JanetSymbol) Janet;
pub extern fn janet_wrap_keyword(x: JanetKeyword) Janet;
pub extern fn janet_wrap_array(x: [*c]JanetArray) Janet;
pub extern fn janet_wrap_tuple(x: JanetTuple) Janet;
pub extern fn janet_wrap_struct(x: JanetStruct) Janet;
pub extern fn janet_wrap_fiber(x: [*c]JanetFiber) Janet;
pub extern fn janet_wrap_buffer(x: [*c]JanetBuffer) Janet;
pub extern fn janet_wrap_function(x: [*c]JanetFunction) Janet;
pub extern fn janet_wrap_cfunction(x: JanetCFunction) Janet;
pub extern fn janet_wrap_table(x: [*c]JanetTable) Janet;
pub extern fn janet_wrap_abstract(x: JanetAbstract) Janet;
pub extern fn janet_wrap_pointer(x: ?*anyopaque) Janet;
pub extern fn janet_wrap_integer(x: i32) Janet;
const struct_unnamed_3 = extern struct {
    low: c_uint = 0,
    high: c_uint = 0,
};
pub const union___mingw_dbl_type_t = extern union {
    x: f64,
    val: c_ulonglong,
    lh: struct_unnamed_3,
};
pub const __mingw_dbl_type_t = union___mingw_dbl_type_t;
pub const union___mingw_flt_type_t = extern union {
    x: f32,
    val: c_uint,
};
pub const __mingw_flt_type_t = union___mingw_flt_type_t;
// C:\msys64\ucrt64\include\math.h:129:11: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_4 = opaque {};
// C:\msys64\ucrt64\include\math.h:132:7: warning: union demoted to opaque type - has opaque field
pub const union___mingw_ldbl_type_t = opaque {};
pub const __mingw_ldbl_type_t = union___mingw_ldbl_type_t;
pub extern var __imp__HUGE: [*c]f64;
pub const struct__exception = extern struct {
    type: c_int = 0,
    name: [*c]const u8 = null,
    arg1: f64 = 0,
    arg2: f64 = 0,
    retval: f64 = 0,
    pub const _matherr = __root._matherr;
};
pub extern fn __mingw_raise_matherr_ret(typ: c_int, name: [*c]const u8, a1: f64, a2: f64, rslt: [*c]f64) c_int;
pub extern fn __mingw_raise_matherr(typ: c_int, name: [*c]const u8, a1: f64, a2: f64, rslt: f64) void;
pub extern fn __mingw_setusermatherr(?*const fn ([*c]struct__exception) callconv(.c) c_int) void;
pub extern fn __setusermatherr(?*const fn ([*c]struct__exception) callconv(.c) c_int) void;
pub extern fn sin(_X: f64) f64;
pub extern fn cos(_X: f64) f64;
pub extern fn tan(_X: f64) f64;
pub extern fn sinh(_X: f64) f64;
pub extern fn cosh(_X: f64) f64;
pub extern fn tanh(_X: f64) f64;
pub extern fn asin(_X: f64) f64;
pub extern fn acos(_X: f64) f64;
pub extern fn atan(_X: f64) f64;
pub extern fn atan2(_Y: f64, _X: f64) f64;
pub extern fn exp(_X: f64) f64;
pub extern fn log(_X: f64) f64;
pub extern fn log10(_X: f64) f64;
pub extern fn pow(_X: f64, _Y: f64) f64;
pub extern fn sqrt(_X: f64) f64;
pub extern fn ceil(_X: f64) f64;
pub extern fn floor(_X: f64) f64;
pub fn fabsf(arg_x: f32) callconv(.c) f32 {
    var x = arg_x;
    _ = &x;
    return @abs(@as(f32, x));
}
// C:\msys64\ucrt64\include\math.h:215:5: warning: TODO asm stmt

// C:\msys64\ucrt64\include\math.h:209:36: warning: unable to translate function, demoted to extern
pub extern fn fabsl(arg_x: c_longdouble) callconv(.c) c_longdouble;
pub fn fabs(arg_x: f64) callconv(.c) f64 {
    var x = arg_x;
    _ = &x;
    return @abs(@as(f64, x));
}
pub extern fn ldexp(_X: f64, _Y: c_int) f64;
pub extern fn frexp(_X: f64, _Y: [*c]c_int) f64;
pub extern fn modf(_X: f64, _Y: [*c]f64) f64;
pub extern fn fmod(_X: f64, _Y: f64) f64;
pub extern fn sincos(__x: f64, p_sin: [*c]f64, p_cos: [*c]f64) void;
pub extern fn sincosl(__x: c_longdouble, p_sin: [*c]c_longdouble, p_cos: [*c]c_longdouble) void;
pub extern fn sincosf(__x: f32, p_sin: [*c]f32, p_cos: [*c]f32) void;
pub const struct__complex = extern struct {
    x: f64 = 0,
    y: f64 = 0,
    pub const _cabs = __root._cabs;
    pub const cabs = __root._cabs;
};
pub extern fn _cabs(_ComplexA: struct__complex) f64;
pub extern fn _hypot(_X: f64, _Y: f64) f64;
pub extern fn _j0(_X: f64) f64;
pub extern fn _j1(_X: f64) f64;
pub extern fn _jn(_X: c_int, _Y: f64) f64;
pub extern fn _y0(_X: f64) f64;
pub extern fn _y1(_X: f64) f64;
pub extern fn _yn(_X: c_int, _Y: f64) f64;
pub extern fn _matherr([*c]struct__exception) c_int;
pub extern fn _chgsign(_X: f64) f64;
pub extern fn _copysign(_Number: f64, _Sign: f64) f64;
pub extern fn _logb(f64) f64;
pub extern fn _nextafter(f64, f64) f64;
pub extern fn _scalb(f64, c_long) f64;
pub extern fn _finite(f64) c_int;
pub extern fn _fpclass(f64) c_int;
pub extern fn _isnan(f64) c_int;
pub extern fn j0(f64) f64;
pub extern fn j1(f64) f64;
pub extern fn jn(c_int, f64) f64;
pub extern fn y0(f64) f64;
pub extern fn y1(f64) f64;
pub extern fn yn(c_int, f64) f64;
pub extern fn chgsign(f64) f64;
pub extern fn finite(f64) c_int;
pub extern fn fpclass(f64) c_int;
pub const float_t = f32;
pub const double_t = f64;
// C:\msys64\ucrt64\include\math.h:404:8: warning: member access of demoted record

// C:\msys64\ucrt64\include\math.h:398:28: warning: unable to translate function, demoted to extern
pub extern fn __fpclassifyl(arg_x: c_longdouble) callconv(.c) c_int;
pub fn __fpclassify(arg_x: f64) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_dbl_type_t = undefined;
    _ = &hlp;
    var l: c_uint = undefined;
    _ = &l;
    var h: c_uint = undefined;
    _ = &h;
    hlp.x = x;
    h = hlp.lh.high;
    l = hlp.lh.low | (h & @as(c_uint, 1048575));
    h &= 2146435072;
    if ((h | l) == @as(c_uint, 0)) return FP_ZERO;
    if (!(h != 0)) return FP_NORMAL | FP_ZERO;
    if (h == @as(c_uint, 2146435072)) return if (l != 0) FP_NAN else FP_NAN | FP_NORMAL;
    return FP_NORMAL;
}
pub fn __fpclassifyf(arg_x: f32) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_flt_type_t = undefined;
    _ = &hlp;
    hlp.x = x;
    hlp.val &= 2147483647;
    if (hlp.val == @as(c_uint, 0)) return FP_ZERO;
    if (hlp.val < @as(c_uint, 8388608)) return FP_NORMAL | FP_ZERO;
    if (hlp.val >= @as(c_uint, 2139095040)) return if (hlp.val > @as(c_uint, 2139095040)) FP_NAN else FP_NAN | FP_NORMAL;
    return FP_NORMAL;
}
pub fn __isnan(arg__x: f64) callconv(.c) c_int {
    var _x = arg__x;
    _ = &_x;
    var hlp: __mingw_dbl_type_t = undefined;
    _ = &hlp;
    var l: c_uint = undefined;
    _ = &l;
    var h: c_uint = undefined;
    _ = &h;
    hlp.x = _x;
    l = hlp.lh.low;
    h = hlp.lh.high & @as(c_uint, 2147483647);
    h |= (l | -%l) >> @intCast(@as(c_uint, 31));
    h = @as(c_uint, 2146435072) -% h;
    return @as(c_int, @bitCast(@as(c_uint, @truncate(h)))) >> @intCast(@as(c_int, 31));
}
pub fn __isnanf(arg__x: f32) callconv(.c) c_int {
    var _x = arg__x;
    _ = &_x;
    var hlp: __mingw_flt_type_t = undefined;
    _ = &hlp;
    var i: c_uint = undefined;
    _ = &i;
    hlp.x = _x;
    i = hlp.val & @as(c_uint, 2147483647);
    i = @as(c_uint, 2139095040) -% i;
    return @bitCast(@as(c_uint, @truncate(i >> @intCast(@as(c_uint, 31)))));
}
// C:\msys64\ucrt64\include\math.h:559:7: warning: member access of demoted record

// C:\msys64\ucrt64\include\math.h:551:28: warning: unable to translate function, demoted to extern
pub extern fn __isnanl(arg__x: c_longdouble) callconv(.c) c_int;
pub fn __signbit(arg_x: f64) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_dbl_type_t = undefined;
    _ = &hlp;
    hlp.x = x;
    return @intFromBool((hlp.lh.high & @as(c_uint, 2147483648)) != @as(c_uint, 0));
}
pub fn __signbitf(arg_x: f32) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_flt_type_t = undefined;
    _ = &hlp;
    hlp.x = x;
    return @intFromBool((hlp.val & @as(c_uint, 2147483648)) != @as(c_uint, 0));
}
// C:\msys64\ucrt64\include\math.h:627:7: warning: member access of demoted record

// C:\msys64\ucrt64\include\math.h:622:28: warning: unable to translate function, demoted to extern
pub extern fn __signbitl(arg_x: c_longdouble) callconv(.c) c_int;
pub extern fn sinf(_X: f32) f32;
pub extern fn sinl(c_longdouble) c_longdouble;
pub extern fn cosf(_X: f32) f32;
pub extern fn cosl(c_longdouble) c_longdouble;
pub extern fn tanf(_X: f32) f32;
pub extern fn tanl(c_longdouble) c_longdouble;
pub extern fn asinf(_X: f32) f32;
pub extern fn asinl(c_longdouble) c_longdouble;
pub extern fn acosf(f32) f32;
pub extern fn acosl(c_longdouble) c_longdouble;
pub extern fn atanf(f32) f32;
pub extern fn atanl(c_longdouble) c_longdouble;
pub extern fn atan2f(f32, f32) f32;
pub extern fn atan2l(c_longdouble, c_longdouble) c_longdouble;
pub extern fn sinhf(_X: f32) f32;
pub extern fn sinhl(c_longdouble) c_longdouble;
pub extern fn coshf(_X: f32) f32;
pub extern fn coshl(c_longdouble) c_longdouble;
pub extern fn tanhf(_X: f32) f32;
pub extern fn tanhl(c_longdouble) c_longdouble;
pub extern fn acosh(f64) f64;
pub extern fn acoshf(f32) f32;
pub extern fn acoshl(c_longdouble) c_longdouble;
pub extern fn asinh(f64) f64;
pub extern fn asinhf(f32) f32;
pub extern fn asinhl(c_longdouble) c_longdouble;
pub extern fn atanh(f64) f64;
pub extern fn atanhf(f32) f32;
pub extern fn atanhl(c_longdouble) c_longdouble;
pub extern fn expf(_X: f32) f32;
pub extern fn expl(c_longdouble) c_longdouble;
pub extern fn exp2(f64) f64;
pub extern fn exp2f(f32) f32;
pub extern fn exp2l(c_longdouble) c_longdouble;
pub extern fn expm1(f64) f64;
pub extern fn expm1f(f32) f32;
pub extern fn expm1l(c_longdouble) c_longdouble;
pub extern fn frexpf(_X: f32, _Y: [*c]c_int) f32;
pub extern fn frexpl(c_longdouble, [*c]c_int) c_longdouble;
pub extern fn ilogb(f64) c_int;
pub extern fn ilogbf(f32) c_int;
pub extern fn ilogbl(c_longdouble) c_int;
pub extern fn ldexpf(_X: f32, _Y: c_int) f32;
pub extern fn ldexpl(c_longdouble, c_int) c_longdouble;
pub extern fn logf(f32) f32;
pub extern fn logl(c_longdouble) c_longdouble;
pub extern fn log10f(f32) f32;
pub extern fn log10l(c_longdouble) c_longdouble;
pub extern fn log1p(f64) f64;
pub extern fn log1pf(f32) f32;
pub extern fn log1pl(c_longdouble) c_longdouble;
pub extern fn log2(f64) f64;
pub extern fn log2f(f32) f32;
pub extern fn log2l(c_longdouble) c_longdouble;
pub extern fn logb(f64) f64;
pub extern fn logbf(f32) f32;
pub extern fn logbl(c_longdouble) c_longdouble;
pub extern fn modff(f32, [*c]f32) f32;
pub extern fn modfl(c_longdouble, [*c]c_longdouble) c_longdouble;
pub extern fn scalbn(f64, c_int) f64;
pub extern fn scalbnf(f32, c_int) f32;
pub extern fn scalbnl(c_longdouble, c_int) c_longdouble;
pub extern fn scalbln(f64, c_long) f64;
pub extern fn scalblnf(f32, c_long) f32;
pub extern fn scalblnl(c_longdouble, c_long) c_longdouble;
pub extern fn cbrt(f64) f64;
pub extern fn cbrtf(f32) f32;
pub extern fn cbrtl(c_longdouble) c_longdouble;
pub extern fn hypot(f64, f64) f64;
pub extern fn hypotf(x: f32, y: f32) f32;
pub extern fn hypotl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn powf(_X: f32, _Y: f32) f32;
pub extern fn powl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn sqrtf(f32) f32;
pub extern fn sqrtl(c_longdouble) c_longdouble;
pub extern fn erf(f64) f64;
pub extern fn erff(f32) f32;
pub extern fn erfl(c_longdouble) c_longdouble;
pub extern fn erfc(f64) f64;
pub extern fn erfcf(f32) f32;
pub extern fn erfcl(c_longdouble) c_longdouble;
pub extern fn lgamma(f64) f64;
pub extern fn lgammaf(f32) f32;
pub extern fn lgammal(c_longdouble) c_longdouble;
pub extern var signgam: c_int;
pub extern fn tgamma(f64) f64;
pub extern fn tgammaf(f32) f32;
pub extern fn tgammal(c_longdouble) c_longdouble;
pub extern fn ceilf(f32) f32;
pub extern fn ceill(c_longdouble) c_longdouble;
pub extern fn floorf(f32) f32;
pub extern fn floorl(c_longdouble) c_longdouble;
pub extern fn nearbyint(f64) f64;
pub extern fn nearbyintf(f32) f32;
pub extern fn nearbyintl(c_longdouble) c_longdouble;
pub extern fn rint(f64) f64;
pub extern fn rintf(f32) f32;
pub extern fn rintl(c_longdouble) c_longdouble;
pub extern fn lrint(f64) c_long;
pub extern fn lrintf(f32) c_long;
pub extern fn lrintl(c_longdouble) c_long;
pub extern fn llrint(f64) c_longlong;
pub extern fn llrintf(f32) c_longlong;
pub extern fn llrintl(c_longdouble) c_longlong;
pub extern fn round(f64) f64;
pub extern fn roundf(f32) f32;
pub extern fn roundl(c_longdouble) c_longdouble;
pub extern fn lround(f64) c_long;
pub extern fn lroundf(f32) c_long;
pub extern fn lroundl(c_longdouble) c_long;
pub extern fn llround(f64) c_longlong;
pub extern fn llroundf(f32) c_longlong;
pub extern fn llroundl(c_longdouble) c_longlong;
pub extern fn trunc(f64) f64;
pub extern fn truncf(f32) f32;
pub extern fn truncl(c_longdouble) c_longdouble;
pub extern fn fmodf(f32, f32) f32;
pub extern fn fmodl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn remainder(f64, f64) f64;
pub extern fn remainderf(f32, f32) f32;
pub extern fn remainderl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn remquo(f64, f64, [*c]c_int) f64;
pub extern fn remquof(f32, f32, [*c]c_int) f32;
pub extern fn remquol(c_longdouble, c_longdouble, [*c]c_int) c_longdouble;
pub extern fn copysignl(c_longdouble, c_longdouble) c_longdouble;
pub fn copysign(arg_x: f64, arg_y: f64) callconv(.c) f64 {
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var hx: __mingw_dbl_type_t = undefined;
    _ = &hx;
    var hy: __mingw_dbl_type_t = undefined;
    _ = &hy;
    hx.x = x;
    hy.x = y;
    hx.lh.high = (hx.lh.high & @as(c_uint, 2147483647)) | (hy.lh.high & @as(c_uint, 2147483648));
    return hx.x;
}
pub fn copysignf(arg_x: f32, arg_y: f32) callconv(.c) f32 {
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var hx: __mingw_flt_type_t = undefined;
    _ = &hx;
    var hy: __mingw_flt_type_t = undefined;
    _ = &hy;
    hx.x = x;
    hy.x = y;
    hx.val = (hx.val & @as(c_uint, 2147483647)) | (hy.val & @as(c_uint, 2147483648));
    return hx.x;
}
pub extern fn nan(tagp: [*c]const u8) f64;
pub extern fn nanf(tagp: [*c]const u8) f32;
pub extern fn nanl(tagp: [*c]const u8) c_longdouble;
pub extern fn nextafter(f64, f64) f64;
pub extern fn nextafterf(f32, f32) f32;
pub extern fn nextafterl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn nexttoward(f64, c_longdouble) f64;
pub extern fn nexttowardf(f32, c_longdouble) f32;
pub extern fn nexttowardl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fdim(x: f64, y: f64) f64;
pub extern fn fdimf(x: f32, y: f32) f32;
pub extern fn fdiml(x: c_longdouble, y: c_longdouble) c_longdouble;
pub extern fn fmax(f64, f64) f64;
pub extern fn fmaxf(f32, f32) f32;
pub extern fn fmaxl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fmin(f64, f64) f64;
pub extern fn fminf(f32, f32) f32;
pub extern fn fminl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fma(f64, f64, f64) f64;
pub extern fn fmaf(f32, f32, f32) f32;
pub extern fn fmal(c_longdouble, c_longdouble, c_longdouble) c_longdouble;
pub extern fn _copysignf(_Number: f32, _Sign: f32) f32;
pub extern fn _chgsignf(_X: f32) f32;
pub extern fn _logbf(_X: f32) f32;
pub extern fn _nextafterf(_X: f32, _Y: f32) f32;
pub extern fn _finitef(_X: f32) c_int;
pub extern fn _isnanf(_X: f32) c_int;
pub extern fn _fpclassf(_X: f32) c_int;
pub extern fn _chgsignl(c_longdouble) c_longdouble;
pub extern fn janet_nanbox_to_pointer(x: Janet) ?*anyopaque;
pub extern fn janet_nanbox_from_pointer(p: ?*anyopaque, tagmask: u64) Janet;
pub extern fn janet_nanbox_from_cpointer(p: ?*const anyopaque, tagmask: u64) Janet;
pub extern fn janet_nanbox_from_double(d: f64) Janet;
pub extern fn janet_nanbox_from_bits(bits: u64) Janet;
pub extern fn janet_checkint8(x: Janet) c_int;
pub extern fn janet_checkuint8(x: Janet) c_int;
pub extern fn janet_checkint16(x: Janet) c_int;
pub extern fn janet_checkuint16(x: Janet) c_int;
pub extern fn janet_checkint(x: Janet) c_int;
pub extern fn janet_checkuint(x: Janet) c_int;
pub extern fn janet_checkint64(x: Janet) c_int;
pub extern fn janet_checkuint64(x: Janet) c_int;
pub extern fn janet_checksize(x: Janet) c_int;
pub extern fn janet_checkabstract(x: Janet, at: [*c]const JanetAbstractType) JanetAbstract;
pub const JanetParseState = struct_JanetParseState;
pub const struct_JanetParser = extern struct {
    args: [*c]Janet = null,
    @"error": [*c]const u8 = null,
    states: [*c]JanetParseState = null,
    buf: [*c]u8 = null,
    argcount: usize = 0,
    argcap: usize = 0,
    statecount: usize = 0,
    statecap: usize = 0,
    bufcount: usize = 0,
    bufcap: usize = 0,
    line: usize = 0,
    column: usize = 0,
    pending: usize = 0,
    lookback: c_int = 0,
    flag: c_int = 0,
    pub const janet_parser_init = __root.janet_parser_init;
    pub const janet_parser_deinit = __root.janet_parser_deinit;
    pub const janet_parser_consume = __root.janet_parser_consume;
    pub const janet_parser_status = __root.janet_parser_status;
    pub const janet_parser_produce = __root.janet_parser_produce;
    pub const janet_parser_produce_wrapped = __root.janet_parser_produce_wrapped;
    pub const janet_parser_error = __root.janet_parser_error;
    pub const janet_parser_flush = __root.janet_parser_flush;
    pub const janet_parser_eof = __root.janet_parser_eof;
    pub const janet_parser_has_more = __root.janet_parser_has_more;
    pub const init = __root.janet_parser_init;
    pub const deinit = __root.janet_parser_deinit;
    pub const consume = __root.janet_parser_consume;
    pub const status = __root.janet_parser_status;
    pub const produce = __root.janet_parser_produce;
    pub const wrapped = __root.janet_parser_produce_wrapped;
    pub const flush = __root.janet_parser_flush;
    pub const eof = __root.janet_parser_eof;
    pub const more = __root.janet_parser_has_more;
};
pub const JanetParser = struct_JanetParser;
pub const Consumer = ?*const fn (p: [*c]JanetParser, state: [*c]JanetParseState, c: u8) callconv(.c) c_int;
pub const struct_JanetParseState = extern struct {
    counter: i32 = 0,
    argn: i32 = 0,
    flags: c_int = 0,
    line: usize = 0,
    column: usize = 0,
    consumer: Consumer = null,
};
pub const JANET_PARSE_ROOT: c_int = 0;
pub const JANET_PARSE_ERROR: c_int = 1;
pub const JANET_PARSE_PENDING: c_int = 2;
pub const JANET_PARSE_DEAD: c_int = 3;
pub const enum_JanetParserStatus = c_uint;
pub const struct_JanetFile = extern struct {
    file: [*c]FILE = null,
    flags: i32 = 0,
    vbufsize: usize = 0,
    pub const janet_file_close = __root.janet_file_close;
    pub const close = __root.janet_file_close;
};
pub const JanetFile = struct_JanetFile;
pub const JanetTryState = extern struct {
    stackn: i32 = 0,
    gc_handle: c_int = 0,
    vm_fiber: [*c]JanetFiber = null,
    vm_jmp_buf: [*c]jmp_buf = null,
    vm_return_reg: [*c]Janet = null,
    buf: jmp_buf = @import("std").mem.zeroes(jmp_buf),
    payload: Janet = @import("std").mem.zeroes(Janet),
    coerce_error: c_int = 0,
    pub const janet_try_init = __root.janet_try_init;
    pub const janet_restore = __root.janet_restore;
    pub const init = __root.janet_try_init;
    pub const restore = __root.janet_restore;
};
pub const JANET_OAT_SLOT: c_int = 0;
pub const JANET_OAT_ENVIRONMENT: c_int = 1;
pub const JANET_OAT_CONSTANT: c_int = 2;
pub const JANET_OAT_INTEGER: c_int = 3;
pub const JANET_OAT_TYPE: c_int = 4;
pub const JANET_OAT_SIMPLETYPE: c_int = 5;
pub const JANET_OAT_LABEL: c_int = 6;
pub const JANET_OAT_FUNCDEF: c_int = 7;
pub const enum_JanetOpArgType = c_uint;
pub const JINT_0: c_int = 0;
pub const JINT_S: c_int = 1;
pub const JINT_L: c_int = 2;
pub const JINT_SS: c_int = 3;
pub const JINT_SL: c_int = 4;
pub const JINT_ST: c_int = 5;
pub const JINT_SI: c_int = 6;
pub const JINT_SD: c_int = 7;
pub const JINT_SU: c_int = 8;
pub const JINT_SSS: c_int = 9;
pub const JINT_SSI: c_int = 10;
pub const JINT_SSU: c_int = 11;
pub const JINT_SES: c_int = 12;
pub const JINT_SC: c_int = 13;
pub const enum_JanetInstructionType = c_uint;
pub const JOP_NOOP: c_int = 0;
pub const JOP_ERROR: c_int = 1;
pub const JOP_TYPECHECK: c_int = 2;
pub const JOP_RETURN: c_int = 3;
pub const JOP_RETURN_NIL: c_int = 4;
pub const JOP_ADD_IMMEDIATE: c_int = 5;
pub const JOP_ADD: c_int = 6;
pub const JOP_SUBTRACT_IMMEDIATE: c_int = 7;
pub const JOP_SUBTRACT: c_int = 8;
pub const JOP_MULTIPLY_IMMEDIATE: c_int = 9;
pub const JOP_MULTIPLY: c_int = 10;
pub const JOP_DIVIDE_IMMEDIATE: c_int = 11;
pub const JOP_DIVIDE: c_int = 12;
pub const JOP_DIVIDE_FLOOR: c_int = 13;
pub const JOP_MODULO: c_int = 14;
pub const JOP_REMAINDER: c_int = 15;
pub const JOP_BAND: c_int = 16;
pub const JOP_BOR: c_int = 17;
pub const JOP_BXOR: c_int = 18;
pub const JOP_BNOT: c_int = 19;
pub const JOP_SHIFT_LEFT: c_int = 20;
pub const JOP_SHIFT_LEFT_IMMEDIATE: c_int = 21;
pub const JOP_SHIFT_RIGHT: c_int = 22;
pub const JOP_SHIFT_RIGHT_IMMEDIATE: c_int = 23;
pub const JOP_SHIFT_RIGHT_UNSIGNED: c_int = 24;
pub const JOP_SHIFT_RIGHT_UNSIGNED_IMMEDIATE: c_int = 25;
pub const JOP_MOVE_FAR: c_int = 26;
pub const JOP_MOVE_NEAR: c_int = 27;
pub const JOP_JUMP: c_int = 28;
pub const JOP_JUMP_IF: c_int = 29;
pub const JOP_JUMP_IF_NOT: c_int = 30;
pub const JOP_JUMP_IF_NIL: c_int = 31;
pub const JOP_JUMP_IF_NOT_NIL: c_int = 32;
pub const JOP_GREATER_THAN: c_int = 33;
pub const JOP_GREATER_THAN_IMMEDIATE: c_int = 34;
pub const JOP_LESS_THAN: c_int = 35;
pub const JOP_LESS_THAN_IMMEDIATE: c_int = 36;
pub const JOP_EQUALS: c_int = 37;
pub const JOP_EQUALS_IMMEDIATE: c_int = 38;
pub const JOP_COMPARE: c_int = 39;
pub const JOP_LOAD_NIL: c_int = 40;
pub const JOP_LOAD_TRUE: c_int = 41;
pub const JOP_LOAD_FALSE: c_int = 42;
pub const JOP_LOAD_INTEGER: c_int = 43;
pub const JOP_LOAD_CONSTANT: c_int = 44;
pub const JOP_LOAD_UPVALUE: c_int = 45;
pub const JOP_LOAD_SELF: c_int = 46;
pub const JOP_SET_UPVALUE: c_int = 47;
pub const JOP_CLOSURE: c_int = 48;
pub const JOP_PUSH: c_int = 49;
pub const JOP_PUSH_2: c_int = 50;
pub const JOP_PUSH_3: c_int = 51;
pub const JOP_PUSH_ARRAY: c_int = 52;
pub const JOP_CALL: c_int = 53;
pub const JOP_TAILCALL: c_int = 54;
pub const JOP_RESUME: c_int = 55;
pub const JOP_SIGNAL: c_int = 56;
pub const JOP_PROPAGATE: c_int = 57;
pub const JOP_IN: c_int = 58;
pub const JOP_GET: c_int = 59;
pub const JOP_PUT: c_int = 60;
pub const JOP_GET_INDEX: c_int = 61;
pub const JOP_PUT_INDEX: c_int = 62;
pub const JOP_LENGTH: c_int = 63;
pub const JOP_MAKE_ARRAY: c_int = 64;
pub const JOP_MAKE_BUFFER: c_int = 65;
pub const JOP_MAKE_STRING: c_int = 66;
pub const JOP_MAKE_STRUCT: c_int = 67;
pub const JOP_MAKE_TABLE: c_int = 68;
pub const JOP_MAKE_TUPLE: c_int = 69;
pub const JOP_MAKE_BRACKET_TUPLE: c_int = 70;
pub const JOP_GREATER_THAN_EQUAL: c_int = 71;
pub const JOP_LESS_THAN_EQUAL: c_int = 72;
pub const JOP_NEXT: c_int = 73;
pub const JOP_NOT_EQUALS: c_int = 74;
pub const JOP_NOT_EQUALS_IMMEDIATE: c_int = 75;
pub const JOP_CANCEL: c_int = 76;
pub const JOP_INSTRUCTION_COUNT: c_int = 77;
pub const enum_JanetOpCode = c_uint;
pub extern const janet_instructions: [77]enum_JanetInstructionType;
pub extern const janet_stream_type: JanetAbstractType;
pub extern const janet_channel_type: JanetAbstractType;
pub extern fn janet_loop() void;
pub extern fn janet_loop_done() c_int;
pub extern fn janet_loop1() [*c]JanetFiber;
pub extern fn janet_loop1_interrupt(vm: ?*JanetVM) void;
pub extern fn janet_stream(handle: JanetHandle, flags: u32, methods: [*c]const JanetMethod) [*c]JanetStream;
pub extern fn janet_stream_ext(handle: JanetHandle, flags: u32, methods: [*c]const JanetMethod, size: usize) [*c]JanetStream;
pub extern fn janet_stream_close(stream: [*c]JanetStream) void;
pub extern fn janet_cfun_stream_close(argc: i32, argv: [*c]Janet) Janet;
pub extern fn janet_cfun_stream_read(argc: i32, argv: [*c]Janet) Janet;
pub extern fn janet_cfun_stream_chunk(argc: i32, argv: [*c]Janet) Janet;
pub extern fn janet_cfun_stream_write(argc: i32, argv: [*c]Janet) Janet;
pub extern fn janet_stream_flags(stream: [*c]JanetStream, flags: u32) void;
pub extern fn janet_schedule(fiber: [*c]JanetFiber, value: Janet) void;
pub extern fn janet_cancel(fiber: [*c]JanetFiber, value: Janet) void;
pub extern fn janet_schedule_signal(fiber: [*c]JanetFiber, value: Janet, sig: JanetSignal) void;
pub extern fn janet_schedule_soon(fiber: [*c]JanetFiber, value: Janet, sig: JanetSignal) void;
pub extern fn janet_await() noreturn;
pub extern fn janet_sleep_await(sec: f64) noreturn;
pub extern fn janet_addtimeout(sec: f64) void;
pub extern fn janet_addtimeout_nil(sec: f64) void;
pub extern fn janet_ev_inc_refcount() void;
pub extern fn janet_ev_dec_refcount() void;
pub extern fn janet_abstract_begin_threaded(atype: [*c]const JanetAbstractType, size: usize) ?*anyopaque;
pub extern fn janet_abstract_end_threaded(x: ?*anyopaque) ?*anyopaque;
pub extern fn janet_abstract_threaded(atype: [*c]const JanetAbstractType, size: usize) ?*anyopaque;
pub extern fn janet_abstract_incref(abst: ?*anyopaque) i32;
pub extern fn janet_abstract_decref(abst: ?*anyopaque) i32;
pub extern fn janet_abstract_decref_maybe_free(abst: ?*anyopaque) i32;
pub extern fn janet_channel_make(limit: u32) ?*JanetChannel;
pub extern fn janet_channel_make_threaded(limit: u32) ?*JanetChannel;
pub extern fn janet_getchannel(argv: [*c]const Janet, n: i32) ?*JanetChannel;
pub extern fn janet_optchannel(argv: [*c]const Janet, argc: i32, n: i32, dflt: ?*JanetChannel) ?*JanetChannel;
pub extern fn janet_channel_give(channel: ?*JanetChannel, x: Janet) c_int;
pub extern fn janet_channel_take(channel: ?*JanetChannel, out: [*c]Janet) c_int;
pub extern fn janet_os_mutex_size() usize;
pub extern fn janet_os_rwlock_size() usize;
pub extern fn janet_os_mutex_init(mutex: ?*JanetOSMutex) void;
pub extern fn janet_os_mutex_deinit(mutex: ?*JanetOSMutex) void;
pub extern fn janet_os_mutex_lock(mutex: ?*JanetOSMutex) void;
pub extern fn janet_os_mutex_unlock(mutex: ?*JanetOSMutex) void;
pub extern fn janet_os_rwlock_init(rwlock: ?*JanetOSRWLock) void;
pub extern fn janet_os_rwlock_deinit(rwlock: ?*JanetOSRWLock) void;
pub extern fn janet_os_rwlock_rlock(rwlock: ?*JanetOSRWLock) void;
pub extern fn janet_os_rwlock_wlock(rwlock: ?*JanetOSRWLock) void;
pub extern fn janet_os_rwlock_runlock(rwlock: ?*JanetOSRWLock) void;
pub extern fn janet_os_rwlock_wunlock(rwlock: ?*JanetOSRWLock) void;
pub extern fn janet_ev_lasterr() Janet;
pub const JanetEVGenericMessage = extern struct {
    tag: c_int = 0,
    argi: c_int = 0,
    argp: ?*anyopaque = null,
    argj: Janet = @import("std").mem.zeroes(Janet),
    fiber: [*c]JanetFiber = null,
    pub const janet_ev_default_threaded_callback = __root.janet_ev_default_threaded_callback;
    pub const callback = __root.janet_ev_default_threaded_callback;
};
pub const JanetThreadedSubroutine = ?*const fn (arguments: JanetEVGenericMessage) callconv(.c) JanetEVGenericMessage;
pub const JanetCallback = ?*const fn (return_value: JanetEVGenericMessage) callconv(.c) void;
pub const JanetThreadedCallback = ?*const fn (return_value: JanetEVGenericMessage) callconv(.c) void;
pub extern fn janet_ev_threaded_call(fp: JanetThreadedSubroutine, arguments: JanetEVGenericMessage, cb: JanetThreadedCallback) void;
pub extern fn janet_ev_threaded_await(fp: JanetThreadedSubroutine, tag: c_int, argi: c_int, argp: ?*anyopaque) noreturn;
pub extern fn janet_ev_post_event(vm: ?*JanetVM, cb: JanetCallback, msg: JanetEVGenericMessage) void;
pub extern fn janet_ev_default_threaded_callback(return_value: JanetEVGenericMessage) void;
pub extern fn janet_ev_read(stream: [*c]JanetStream, buf: [*c]JanetBuffer, nbytes: i32) noreturn;
pub extern fn janet_ev_readchunk(stream: [*c]JanetStream, buf: [*c]JanetBuffer, nbytes: i32) noreturn;
pub extern fn janet_ev_recv(stream: [*c]JanetStream, buf: [*c]JanetBuffer, nbytes: i32, flags: c_int) noreturn;
pub extern fn janet_ev_recvchunk(stream: [*c]JanetStream, buf: [*c]JanetBuffer, nbytes: i32, flags: c_int) noreturn;
pub extern fn janet_ev_recvfrom(stream: [*c]JanetStream, buf: [*c]JanetBuffer, nbytes: i32, flags: c_int) noreturn;
pub extern fn janet_ev_write_buffer(stream: [*c]JanetStream, buf: [*c]JanetBuffer) noreturn;
pub extern fn janet_ev_write_string(stream: [*c]JanetStream, str: JanetString) noreturn;
pub extern fn janet_ev_send_buffer(stream: [*c]JanetStream, buf: [*c]JanetBuffer, flags: c_int) noreturn;
pub extern fn janet_ev_send_string(stream: [*c]JanetStream, str: JanetString, flags: c_int) noreturn;
pub extern fn janet_ev_sendto_buffer(stream: [*c]JanetStream, buf: [*c]JanetBuffer, dest: ?*anyopaque, flags: c_int) noreturn;
pub extern fn janet_ev_sendto_string(stream: [*c]JanetStream, str: JanetString, dest: ?*anyopaque, flags: c_int) noreturn;
pub extern const janet_parser_type: JanetAbstractType;
pub extern fn janet_parser_init(parser: [*c]JanetParser) void;
pub extern fn janet_parser_deinit(parser: [*c]JanetParser) void;
pub extern fn janet_parser_consume(parser: [*c]JanetParser, c: u8) void;
pub extern fn janet_parser_status(parser: [*c]JanetParser) enum_JanetParserStatus;
pub extern fn janet_parser_produce(parser: [*c]JanetParser) Janet;
pub extern fn janet_parser_produce_wrapped(parser: [*c]JanetParser) Janet;
pub extern fn janet_parser_error(parser: [*c]JanetParser) [*c]const u8;
pub extern fn janet_parser_flush(parser: [*c]JanetParser) void;
pub extern fn janet_parser_eof(parser: [*c]JanetParser) void;
pub extern fn janet_parser_has_more(parser: [*c]JanetParser) c_int;
pub const JANET_ASSEMBLE_OK: c_int = 0;
pub const JANET_ASSEMBLE_ERROR: c_int = 1;
pub const enum_JanetAssembleStatus = c_uint;
pub const struct_JanetAssembleResult = extern struct {
    funcdef: [*c]JanetFuncDef = null,
    @"error": JanetString = null,
    status: enum_JanetAssembleStatus = @import("std").mem.zeroes(enum_JanetAssembleStatus),
};
pub const JanetAssembleResult = struct_JanetAssembleResult;
pub extern fn janet_asm(source: Janet, flags: c_int) JanetAssembleResult;
pub extern fn janet_disasm(def: [*c]JanetFuncDef) Janet;
pub extern fn janet_asm_decode_instruction(instr: u32) Janet;
pub const JANET_COMPILE_OK: c_int = 0;
pub const JANET_COMPILE_ERROR: c_int = 1;
pub const enum_JanetCompileStatus = c_uint;
pub const struct_JanetCompileResult = extern struct {
    funcdef: [*c]JanetFuncDef = null,
    @"error": JanetString = null,
    macrofiber: [*c]JanetFiber = null,
    error_mapping: JanetSourceMapping = @import("std").mem.zeroes(JanetSourceMapping),
    status: enum_JanetCompileStatus = @import("std").mem.zeroes(enum_JanetCompileStatus),
};
pub const JanetCompileResult = struct_JanetCompileResult;
pub extern fn janet_compile(source: Janet, env: [*c]JanetTable, where: JanetString) JanetCompileResult;
pub extern fn janet_compile_lint(source: Janet, env: [*c]JanetTable, where: JanetString, lints: [*c]JanetArray) JanetCompileResult;
pub extern fn janet_core_env(replacements: [*c]JanetTable) [*c]JanetTable;
pub extern fn janet_core_lookup_table(replacements: [*c]JanetTable) [*c]JanetTable;
pub extern fn janet_dobytes(env: [*c]JanetTable, bytes: [*c]const u8, len: i32, sourcePath: [*c]const u8, out: [*c]Janet) c_int;
pub extern fn janet_dostring(env: [*c]JanetTable, str: [*c]const u8, sourcePath: [*c]const u8, out: [*c]Janet) c_int;
pub extern fn janet_loop_fiber(fiber: [*c]JanetFiber) c_int;
pub extern fn janet_scan_number(str: [*c]const u8, len: i32, out: [*c]f64) c_int;
pub extern fn janet_scan_number_base(str: [*c]const u8, len: i32, base: i32, out: [*c]f64) c_int;
pub extern fn janet_scan_int64(str: [*c]const u8, len: i32, out: [*c]i64) c_int;
pub extern fn janet_scan_uint64(str: [*c]const u8, len: i32, out: [*c]u64) c_int;
pub extern fn janet_scan_numeric(str: [*c]const u8, len: i32, out: [*c]Janet) c_int;
pub extern fn janet_debug_break(def: [*c]JanetFuncDef, pc: i32) void;
pub extern fn janet_debug_unbreak(def: [*c]JanetFuncDef, pc: i32) void;
pub extern fn janet_debug_find(def_out: [*c][*c]JanetFuncDef, pc_out: [*c]i32, source: JanetString, line: i32, column: i32) void;
pub extern const janet_rng_type: JanetAbstractType;
pub extern fn janet_default_rng() [*c]JanetRNG;
pub extern fn janet_rng_seed(rng: [*c]JanetRNG, seed: u32) void;
pub extern fn janet_rng_longseed(rng: [*c]JanetRNG, bytes: [*c]const u8, len: i32) void;
pub extern fn janet_rng_u32(rng: [*c]JanetRNG) u32;
pub extern fn janet_rng_double(rng: [*c]JanetRNG) f64;
pub extern fn janet_array(capacity: i32) [*c]JanetArray;
pub extern fn janet_array_weak(capacity: i32) [*c]JanetArray;
pub extern fn janet_array_n(elements: [*c]const Janet, n: i32) [*c]JanetArray;
pub extern fn janet_array_ensure(array: [*c]JanetArray, capacity: i32, growth: i32) void;
pub extern fn janet_array_setcount(array: [*c]JanetArray, count: i32) void;
pub extern fn janet_array_push(array: [*c]JanetArray, x: Janet) void;
pub extern fn janet_array_pop(array: [*c]JanetArray) Janet;
pub extern fn janet_array_peek(array: [*c]JanetArray) Janet;
pub extern fn janet_buffer(capacity: i32) [*c]JanetBuffer;
pub extern fn janet_buffer_init(buffer: [*c]JanetBuffer, capacity: i32) [*c]JanetBuffer;
pub extern fn janet_pointer_buffer_unsafe(memory: ?*anyopaque, capacity: i32, count: i32) [*c]JanetBuffer;
pub extern fn janet_buffer_deinit(buffer: [*c]JanetBuffer) void;
pub extern fn janet_buffer_ensure(buffer: [*c]JanetBuffer, capacity: i32, growth: i32) void;
pub extern fn janet_buffer_setcount(buffer: [*c]JanetBuffer, count: i32) void;
pub extern fn janet_buffer_extra(buffer: [*c]JanetBuffer, n: i32) void;
pub extern fn janet_buffer_push_bytes(buffer: [*c]JanetBuffer, string: [*c]const u8, len: i32) void;
pub extern fn janet_buffer_push_string(buffer: [*c]JanetBuffer, string: JanetString) void;
pub extern fn janet_buffer_push_cstring(buffer: [*c]JanetBuffer, cstring: [*c]const u8) void;
pub extern fn janet_buffer_push_u8(buffer: [*c]JanetBuffer, x: u8) void;
pub extern fn janet_buffer_push_u16(buffer: [*c]JanetBuffer, x: u16) void;
pub extern fn janet_buffer_push_u32(buffer: [*c]JanetBuffer, x: u32) void;
pub extern fn janet_buffer_push_u64(buffer: [*c]JanetBuffer, x: u64) void;
pub extern fn janet_tuple_begin(length: i32) [*c]Janet;
pub extern fn janet_tuple_end(tuple: [*c]Janet) JanetTuple;
pub extern fn janet_tuple_n(values: [*c]const Janet, n: i32) JanetTuple;
pub extern fn janet_string_begin(length: i32) [*c]u8;
pub extern fn janet_string_end(str: [*c]u8) JanetString;
pub extern fn janet_string(buf: [*c]const u8, len: i32) JanetString;
pub extern fn janet_cstring(cstring: [*c]const u8) JanetString;
pub extern fn janet_string_compare(lhs: JanetString, rhs: JanetString) c_int;
pub extern fn janet_string_equal(lhs: JanetString, rhs: JanetString) c_int;
pub extern fn janet_string_equalconst(lhs: JanetString, rhs: [*c]const u8, rlen: i32, rhash: i32) c_int;
pub extern fn janet_description(x: Janet) JanetString;
pub extern fn janet_to_string(x: Janet) JanetString;
pub extern fn janet_to_string_b(buffer: [*c]JanetBuffer, x: Janet) void;
pub extern fn janet_description_b(buffer: [*c]JanetBuffer, x: Janet) void;
pub extern fn janet_formatc(format: [*c]const u8, ...) JanetString;
pub extern fn janet_formatb(bufp: [*c]JanetBuffer, format: [*c]const u8, ...) [*c]JanetBuffer;
pub extern fn janet_formatbv(bufp: [*c]JanetBuffer, format: [*c]const u8, args: va_list) void;
pub extern fn janet_symbol(str: [*c]const u8, len: i32) JanetSymbol;
pub extern fn janet_csymbol(str: [*c]const u8) JanetSymbol;
pub extern fn janet_symbol_gen() JanetSymbol;
pub extern fn janet_struct_begin(count: i32) [*c]JanetKV;
pub extern fn janet_struct_put(st: [*c]JanetKV, key: Janet, value: Janet) void;
pub extern fn janet_struct_end(st: [*c]JanetKV) JanetStruct;
pub extern fn janet_struct_get(st: JanetStruct, key: Janet) Janet;
pub extern fn janet_struct_rawget(st: JanetStruct, key: Janet) Janet;
pub extern fn janet_struct_get_ex(st: JanetStruct, key: Janet, which: [*c]JanetStruct) Janet;
pub extern fn janet_struct_to_table(st: JanetStruct) [*c]JanetTable;
pub extern fn janet_struct_find(st: JanetStruct, key: Janet) [*c]const JanetKV;
pub extern fn janet_table(capacity: i32) [*c]JanetTable;
pub extern fn janet_table_init(table: [*c]JanetTable, capacity: i32) [*c]JanetTable;
pub extern fn janet_table_init_raw(table: [*c]JanetTable, capacity: i32) [*c]JanetTable;
pub extern fn janet_table_deinit(table: [*c]JanetTable) void;
pub extern fn janet_table_get(t: [*c]JanetTable, key: Janet) Janet;
pub extern fn janet_table_get_ex(t: [*c]JanetTable, key: Janet, which: [*c][*c]JanetTable) Janet;
pub extern fn janet_table_rawget(t: [*c]JanetTable, key: Janet) Janet;
pub extern fn janet_table_remove(t: [*c]JanetTable, key: Janet) Janet;
pub extern fn janet_table_put(t: [*c]JanetTable, key: Janet, value: Janet) void;
pub extern fn janet_table_to_struct(t: [*c]JanetTable) JanetStruct;
pub extern fn janet_table_merge_table(table: [*c]JanetTable, other: [*c]JanetTable) void;
pub extern fn janet_table_merge_struct(table: [*c]JanetTable, other: JanetStruct) void;
pub extern fn janet_table_find(t: [*c]JanetTable, key: Janet) [*c]JanetKV;
pub extern fn janet_table_clone(table: [*c]JanetTable) [*c]JanetTable;
pub extern fn janet_table_clear(table: [*c]JanetTable) void;
pub extern fn janet_table_weakk(capacity: i32) [*c]JanetTable;
pub extern fn janet_table_weakv(capacity: i32) [*c]JanetTable;
pub extern fn janet_table_weakkv(capacity: i32) [*c]JanetTable;
pub extern fn janet_fiber(callee: [*c]JanetFunction, capacity: i32, argc: i32, argv: [*c]const Janet) [*c]JanetFiber;
pub extern fn janet_fiber_reset(fiber: [*c]JanetFiber, callee: [*c]JanetFunction, argc: i32, argv: [*c]const Janet) [*c]JanetFiber;
pub extern fn janet_fiber_status(fiber: [*c]JanetFiber) JanetFiberStatus;
pub extern fn janet_fiber_can_resume(fiber: [*c]JanetFiber) c_int;
pub extern fn janet_current_fiber() [*c]JanetFiber;
pub extern fn janet_root_fiber() [*c]JanetFiber;
pub extern fn janet_indexed_view(seq: Janet, data: [*c][*c]const Janet, len: [*c]i32) c_int;
pub extern fn janet_bytes_view(str: Janet, data: [*c][*c]const u8, len: [*c]i32) c_int;
pub extern fn janet_dictionary_view(tab: Janet, data: [*c][*c]const JanetKV, len: [*c]i32, cap: [*c]i32) c_int;
pub extern fn janet_dictionary_get(data: [*c]const JanetKV, cap: i32, key: Janet) Janet;
pub extern fn janet_dictionary_next(kvs: [*c]const JanetKV, cap: i32, kv: [*c]const JanetKV) [*c]const JanetKV;
pub extern fn janet_abstract_begin(@"type": [*c]const JanetAbstractType, size: usize) ?*anyopaque;
pub extern fn janet_abstract_end(abstractTemplate: ?*anyopaque) JanetAbstract;
pub extern fn janet_abstract(@"type": [*c]const JanetAbstractType, size: usize) JanetAbstract;
pub const JanetModule = ?*const fn ([*c]JanetTable) callconv(.c) void;
pub const JanetModconf = ?*const fn () callconv(.c) JanetBuildConfig;
pub extern fn janet_native(name: [*c]const u8, @"error": [*c]JanetString) JanetModule;
pub extern fn janet_marshal(buf: [*c]JanetBuffer, x: Janet, rreg: [*c]JanetTable, flags: c_int) void;
pub extern fn janet_unmarshal(bytes: [*c]const u8, len: usize, flags: c_int, reg: [*c]JanetTable, next: [*c][*c]const u8) Janet;
pub extern fn janet_env_lookup(env: [*c]JanetTable) [*c]JanetTable;
pub extern fn janet_env_lookup_into(renv: [*c]JanetTable, env: [*c]JanetTable, prefix: [*c]const u8, recurse: c_int) void;
pub extern fn janet_collect() void;
pub extern fn janet_gcroot(root: Janet) void;
pub extern fn janet_gcunroot(root: Janet) c_int;
pub extern fn janet_gclock() c_int;
pub extern fn janet_gcunlock(handle: c_int) void;
pub extern fn janet_mark(x: Janet) void;
pub extern fn janet_sweep() void;
pub extern fn janet_clear_memory() void;
pub extern fn janet_gcunrootall(root: Janet) c_int;
pub extern fn janet_gcpressure(s: usize) void;
pub extern fn janet_funcdef_alloc() [*c]JanetFuncDef;
pub extern fn janet_thunk(def: [*c]JanetFuncDef) [*c]JanetFunction;
pub extern fn janet_thunk_delay(x: Janet) [*c]JanetFunction;
pub extern fn janet_verify(def: [*c]JanetFuncDef) c_int;
pub extern fn janet_pretty(buffer: [*c]JanetBuffer, depth: c_int, flags: c_int, x: Janet) [*c]JanetBuffer;
pub extern fn janet_try_init(state: [*c]JanetTryState) void;
pub extern fn janet_restore(state: [*c]JanetTryState) void;
pub extern fn janet_equals(x: Janet, y: Janet) c_int;
pub extern fn janet_hash(x: Janet) i32;
pub extern fn janet_compare(x: Janet, y: Janet) c_int;
pub extern fn janet_cstrcmp(str: JanetString, other: [*c]const u8) c_int;
pub extern fn janet_in(ds: Janet, key: Janet) Janet;
pub extern fn janet_get(ds: Janet, key: Janet) Janet;
pub extern fn janet_next(ds: Janet, key: Janet) Janet;
pub extern fn janet_getindex(ds: Janet, index: i32) Janet;
pub extern fn janet_length(x: Janet) i32;
pub extern fn janet_lengthv(x: Janet) Janet;
pub extern fn janet_put(ds: Janet, key: Janet, value: Janet) void;
pub extern fn janet_putindex(ds: Janet, index: i32, value: Janet) void;
pub extern fn janet_wrap_number_safe(x: f64) Janet;
pub extern fn janet_keyeq(x: Janet, cstring: [*c]const u8) c_int;
pub extern fn janet_streq(x: Janet, cstring: [*c]const u8) c_int;
pub extern fn janet_symeq(x: Janet, cstring: [*c]const u8) c_int;
pub extern fn janet_sorted_keys(dict: [*c]const JanetKV, cap: i32, index_buffer: [*c]i32) i32;
pub extern fn janet_init() c_int;
pub extern fn janet_deinit() void;
pub extern fn janet_vm_alloc() ?*JanetVM;
pub extern fn janet_local_vm() ?*JanetVM;
pub extern fn janet_vm_free(vm: ?*JanetVM) void;
pub extern fn janet_vm_save(into: ?*JanetVM) void;
pub extern fn janet_vm_load(from: ?*JanetVM) void;
pub extern fn janet_interpreter_interrupt(vm: ?*JanetVM) void;
pub extern fn janet_interpreter_interrupt_handled(vm: ?*JanetVM) void;
pub extern fn janet_continue(fiber: [*c]JanetFiber, in: Janet, out: [*c]Janet) JanetSignal;
pub extern fn janet_continue_signal(fiber: [*c]JanetFiber, in: Janet, out: [*c]Janet, sig: JanetSignal) JanetSignal;
pub extern fn janet_pcall(fun: [*c]JanetFunction, argn: i32, argv: [*c]const Janet, out: [*c]Janet, f: [*c][*c]JanetFiber) JanetSignal;
pub extern fn janet_step(fiber: [*c]JanetFiber, in: Janet, out: [*c]Janet) JanetSignal;
pub extern fn janet_call(fun: [*c]JanetFunction, argc: i32, argv: [*c]const Janet) Janet;
pub extern fn janet_mcall(name: [*c]const u8, argc: i32, argv: [*c]Janet) Janet;
pub extern fn janet_stacktrace(fiber: [*c]JanetFiber, err: Janet) void;
pub extern fn janet_stacktrace_ext(fiber: [*c]JanetFiber, err: Janet, prefix: [*c]const u8) void;
pub extern fn janet_sandbox(flags: u32) void;
pub extern fn janet_sandbox_assert(forbidden_flags: u32) void;
pub const JanetScratchFinalizer = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn janet_smalloc(size: usize) ?*anyopaque;
pub extern fn janet_srealloc(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn janet_scalloc(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn janet_sfinalizer(mem: ?*anyopaque, finalizer: JanetScratchFinalizer) void;
pub extern fn janet_sfree(mem: ?*anyopaque) void;
pub const JANET_BINDING_NONE: c_int = 0;
pub const JANET_BINDING_DEF: c_int = 1;
pub const JANET_BINDING_VAR: c_int = 2;
pub const JANET_BINDING_MACRO: c_int = 3;
pub const JANET_BINDING_DYNAMIC_DEF: c_int = 4;
pub const JANET_BINDING_DYNAMIC_MACRO: c_int = 5;
pub const JanetBindingType = c_uint;
pub const JANET_BINDING_DEP_NONE: c_int = 0;
pub const JANET_BINDING_DEP_RELAXED: c_int = 1;
pub const JANET_BINDING_DEP_NORMAL: c_int = 2;
pub const JANET_BINDING_DEP_STRICT: c_int = 3;
const enum_unnamed_5 = c_uint;
pub const JanetBinding = extern struct {
    type: JanetBindingType = @import("std").mem.zeroes(JanetBindingType),
    value: Janet = @import("std").mem.zeroes(Janet),
    deprecation: enum_unnamed_5 = @import("std").mem.zeroes(enum_unnamed_5),
};
pub extern fn janet_def(env: [*c]JanetTable, name: [*c]const u8, val: Janet, documentation: [*c]const u8) void;
pub extern fn janet_var(env: [*c]JanetTable, name: [*c]const u8, val: Janet, documentation: [*c]const u8) void;
pub extern fn janet_cfuns(env: [*c]JanetTable, regprefix: [*c]const u8, cfuns: [*c]const JanetReg) void;
pub extern fn janet_cfuns_prefix(env: [*c]JanetTable, regprefix: [*c]const u8, cfuns: [*c]const JanetReg) void;
pub extern fn janet_resolve(env: [*c]JanetTable, sym: JanetSymbol, out: [*c]Janet) JanetBindingType;
pub extern fn janet_resolve_ext(env: [*c]JanetTable, sym: JanetSymbol) JanetBinding;
pub extern fn janet_resolve_core(name: [*c]const u8) Janet;
pub extern fn janet_cfuns_ext(env: [*c]JanetTable, regprefix: [*c]const u8, cfuns: [*c]const JanetRegExt) void;
pub extern fn janet_cfuns_ext_prefix(env: [*c]JanetTable, regprefix: [*c]const u8, cfuns: [*c]const JanetRegExt) void;
pub extern fn janet_def_sm(env: [*c]JanetTable, name: [*c]const u8, val: Janet, documentation: [*c]const u8, source_file: [*c]const u8, source_line: i32) void;
pub extern fn janet_var_sm(env: [*c]JanetTable, name: [*c]const u8, val: Janet, documentation: [*c]const u8, source_file: [*c]const u8, source_line: i32) void;
pub extern fn janet_register(name: [*c]const u8, cfun: JanetCFunction) void;
pub extern fn janet_signalv(signal: JanetSignal, message: Janet) noreturn;
pub extern fn janet_panicv(message: Janet) noreturn;
pub extern fn janet_panic(message: [*c]const u8) noreturn;
pub extern fn janet_panics(message: JanetString) noreturn;
pub extern fn janet_panicf(format: [*c]const u8, ...) noreturn;
pub extern fn janet_dynprintf(name: [*c]const u8, dflt_file: [*c]FILE, format: [*c]const u8, ...) void;
pub extern fn janet_panic_type(x: Janet, n: i32, expected: c_int) noreturn;
pub extern fn janet_panic_abstract(x: Janet, n: i32, at: [*c]const JanetAbstractType) noreturn;
pub extern fn janet_arity(arity: i32, min: i32, max: i32) void;
pub extern fn janet_fixarity(arity: i32, fix: i32) void;
pub extern fn janet_getmethod(method: JanetKeyword, methods: [*c]const JanetMethod, out: [*c]Janet) c_int;
pub extern fn janet_nextmethod(methods: [*c]const JanetMethod, key: Janet) Janet;
pub extern fn janet_getnumber(argv: [*c]const Janet, n: i32) f64;
pub extern fn janet_getarray(argv: [*c]const Janet, n: i32) [*c]JanetArray;
pub extern fn janet_gettuple(argv: [*c]const Janet, n: i32) JanetTuple;
pub extern fn janet_gettable(argv: [*c]const Janet, n: i32) [*c]JanetTable;
pub extern fn janet_getstruct(argv: [*c]const Janet, n: i32) JanetStruct;
pub extern fn janet_getstring(argv: [*c]const Janet, n: i32) JanetString;
pub extern fn janet_getcstring(argv: [*c]const Janet, n: i32) [*c]const u8;
pub extern fn janet_getcbytes(argv: [*c]const Janet, n: i32) [*c]const u8;
pub extern fn janet_getsymbol(argv: [*c]const Janet, n: i32) JanetSymbol;
pub extern fn janet_getkeyword(argv: [*c]const Janet, n: i32) JanetKeyword;
pub extern fn janet_getbuffer(argv: [*c]const Janet, n: i32) [*c]JanetBuffer;
pub extern fn janet_getfiber(argv: [*c]const Janet, n: i32) [*c]JanetFiber;
pub extern fn janet_getfunction(argv: [*c]const Janet, n: i32) [*c]JanetFunction;
pub extern fn janet_getcfunction(argv: [*c]const Janet, n: i32) JanetCFunction;
pub extern fn janet_getboolean(argv: [*c]const Janet, n: i32) c_int;
pub extern fn janet_getpointer(argv: [*c]const Janet, n: i32) ?*anyopaque;
pub extern fn janet_getnat(argv: [*c]const Janet, n: i32) i32;
pub extern fn janet_getinteger(argv: [*c]const Janet, n: i32) i32;
pub extern fn janet_getinteger8(argv: [*c]const Janet, n: i32) i8;
pub extern fn janet_getinteger16(argv: [*c]const Janet, n: i32) i16;
pub extern fn janet_getinteger64(argv: [*c]const Janet, n: i32) i64;
pub extern fn janet_getuinteger(argv: [*c]const Janet, n: i32) u32;
pub extern fn janet_getuinteger8(argv: [*c]const Janet, n: i32) u8;
pub extern fn janet_getuinteger16(argv: [*c]const Janet, n: i32) u16;
pub extern fn janet_getuinteger64(argv: [*c]const Janet, n: i32) u64;
pub extern fn janet_getsize(argv: [*c]const Janet, n: i32) usize;
pub extern fn janet_getindexed(argv: [*c]const Janet, n: i32) JanetView;
pub extern fn janet_getbytes(argv: [*c]const Janet, n: i32) JanetByteView;
pub extern fn janet_getdictionary(argv: [*c]const Janet, n: i32) JanetDictView;
pub extern fn janet_getabstract(argv: [*c]const Janet, n: i32, at: [*c]const JanetAbstractType) ?*anyopaque;
pub extern fn janet_getslice(argc: i32, argv: [*c]const Janet) JanetRange;
pub extern fn janet_gethalfrange(argv: [*c]const Janet, n: i32, length: i32, which: [*c]const u8) i32;
pub extern fn janet_getstartrange(argv: [*c]const Janet, argc: i32, n: i32, length: i32) i32;
pub extern fn janet_getendrange(argv: [*c]const Janet, argc: i32, n: i32, length: i32) i32;
pub extern fn janet_getargindex(argv: [*c]const Janet, n: i32, length: i32, which: [*c]const u8) i32;
pub extern fn janet_getflags(argv: [*c]const Janet, n: i32, flags: [*c]const u8) u64;
pub extern fn janet_optnumber(argv: [*c]const Janet, argc: i32, n: i32, dflt: f64) f64;
pub extern fn janet_opttuple(argv: [*c]const Janet, argc: i32, n: i32, dflt: JanetTuple) JanetTuple;
pub extern fn janet_optstruct(argv: [*c]const Janet, argc: i32, n: i32, dflt: JanetStruct) JanetStruct;
pub extern fn janet_optstring(argv: [*c]const Janet, argc: i32, n: i32, dflt: JanetString) JanetString;
pub extern fn janet_optcstring(argv: [*c]const Janet, argc: i32, n: i32, dflt: [*c]const u8) [*c]const u8;
pub extern fn janet_optcbytes(argv: [*c]const Janet, argc: i32, n: i32, dflt: [*c]const u8) [*c]const u8;
pub extern fn janet_optsymbol(argv: [*c]const Janet, argc: i32, n: i32, dflt: JanetString) JanetSymbol;
pub extern fn janet_optkeyword(argv: [*c]const Janet, argc: i32, n: i32, dflt: JanetString) JanetKeyword;
pub extern fn janet_optfiber(argv: [*c]const Janet, argc: i32, n: i32, dflt: [*c]JanetFiber) [*c]JanetFiber;
pub extern fn janet_optfunction(argv: [*c]const Janet, argc: i32, n: i32, dflt: [*c]JanetFunction) [*c]JanetFunction;
pub extern fn janet_optcfunction(argv: [*c]const Janet, argc: i32, n: i32, dflt: JanetCFunction) JanetCFunction;
pub extern fn janet_optboolean(argv: [*c]const Janet, argc: i32, n: i32, dflt: c_int) c_int;
pub extern fn janet_optpointer(argv: [*c]const Janet, argc: i32, n: i32, dflt: ?*anyopaque) ?*anyopaque;
pub extern fn janet_optnat(argv: [*c]const Janet, argc: i32, n: i32, dflt: i32) i32;
pub extern fn janet_optinteger(argv: [*c]const Janet, argc: i32, n: i32, dflt: i32) i32;
pub extern fn janet_optinteger64(argv: [*c]const Janet, argc: i32, n: i32, dflt: i64) i64;
pub extern fn janet_optsize(argv: [*c]const Janet, argc: i32, n: i32, dflt: usize) usize;
pub extern fn janet_optabstract(argv: [*c]const Janet, argc: i32, n: i32, at: [*c]const JanetAbstractType, dflt: JanetAbstract) JanetAbstract;
pub extern fn janet_optuinteger(argv: [*c]const Janet, argc: i32, n: i32, dflt: u32) u32;
pub extern fn janet_optuinteger64(argv: [*c]const Janet, argc: i32, n: i32, dflt: u64) u64;
pub extern fn janet_optbuffer(argv: [*c]const Janet, argc: i32, n: i32, dflt_len: i32) [*c]JanetBuffer;
pub extern fn janet_opttable(argv: [*c]const Janet, argc: i32, n: i32, dflt_len: i32) [*c]JanetTable;
pub extern fn janet_optarray(argv: [*c]const Janet, argc: i32, n: i32, dflt_len: i32) [*c]JanetArray;
pub extern fn janet_dyn(name: [*c]const u8) Janet;
pub extern fn janet_setdyn(name: [*c]const u8, value: Janet) void;
pub extern const janet_file_type: JanetAbstractType;
pub extern fn janet_makefile(f: [*c]FILE, flags: i32) Janet;
pub extern fn janet_makejfile(f: [*c]FILE, flags: i32) [*c]JanetFile;
pub extern fn janet_getfile(argv: [*c]const Janet, n: i32, flags: [*c]i32) [*c]FILE;
pub extern fn janet_dynfile(name: [*c]const u8, def: [*c]FILE) [*c]FILE;
pub extern fn janet_getjfile(argv: [*c]const Janet, n: i32) [*c]JanetFile;
pub extern fn janet_checkfile(j: Janet) JanetAbstract;
pub extern fn janet_unwrapfile(j: Janet, flags: [*c]i32) [*c]FILE;
pub extern fn janet_file_close(file: [*c]JanetFile) c_int;
pub extern fn janet_cryptorand(out: [*c]u8, n: usize) c_int;
pub extern fn janet_marshal_size(ctx: [*c]JanetMarshalContext, value: usize) void;
pub extern fn janet_marshal_int(ctx: [*c]JanetMarshalContext, value: i32) void;
pub extern fn janet_marshal_int64(ctx: [*c]JanetMarshalContext, value: i64) void;
pub extern fn janet_marshal_ptr(ctx: [*c]JanetMarshalContext, value: ?*const anyopaque) void;
pub extern fn janet_marshal_byte(ctx: [*c]JanetMarshalContext, value: u8) void;
pub extern fn janet_marshal_bytes(ctx: [*c]JanetMarshalContext, bytes: [*c]const u8, len: usize) void;
pub extern fn janet_marshal_janet(ctx: [*c]JanetMarshalContext, x: Janet) void;
pub extern fn janet_marshal_abstract(ctx: [*c]JanetMarshalContext, abstract: JanetAbstract) void;
pub extern fn janet_marshal_flags(ctx: [*c]JanetMarshalContext) c_int;
pub extern fn janet_unmarshal_ensure(ctx: [*c]JanetMarshalContext, size: usize) void;
pub extern fn janet_unmarshal_size(ctx: [*c]JanetMarshalContext) usize;
pub extern fn janet_unmarshal_int(ctx: [*c]JanetMarshalContext) i32;
pub extern fn janet_unmarshal_int64(ctx: [*c]JanetMarshalContext) i64;
pub extern fn janet_unmarshal_ptr(ctx: [*c]JanetMarshalContext) ?*anyopaque;
pub extern fn janet_unmarshal_byte(ctx: [*c]JanetMarshalContext) u8;
pub extern fn janet_unmarshal_bytes(ctx: [*c]JanetMarshalContext, dest: [*c]u8, len: usize) void;
pub extern fn janet_unmarshal_janet(ctx: [*c]JanetMarshalContext) Janet;
pub extern fn janet_unmarshal_abstract(ctx: [*c]JanetMarshalContext, size: usize) JanetAbstract;
pub extern fn janet_unmarshal_abstract_threaded(ctx: [*c]JanetMarshalContext, size: usize) JanetAbstract;
pub extern fn janet_unmarshal_abstract_reuse(ctx: [*c]JanetMarshalContext, p: ?*anyopaque) void;
pub extern fn janet_unmarshal_flags(ctx: [*c]JanetMarshalContext) c_int;
pub extern fn janet_register_abstract_type(at: [*c]const JanetAbstractType) void;
pub extern fn janet_get_abstract_type(key: Janet) [*c]const JanetAbstractType;
pub extern const janet_peg_type: JanetAbstractType;
pub const RULE_LITERAL: c_int = 0;
pub const RULE_NCHAR: c_int = 1;
pub const RULE_NOTNCHAR: c_int = 2;
pub const RULE_RANGE: c_int = 3;
pub const RULE_SET: c_int = 4;
pub const RULE_LOOK: c_int = 5;
pub const RULE_CHOICE: c_int = 6;
pub const RULE_SEQUENCE: c_int = 7;
pub const RULE_IF: c_int = 8;
pub const RULE_IFNOT: c_int = 9;
pub const RULE_NOT: c_int = 10;
pub const RULE_BETWEEN: c_int = 11;
pub const RULE_GETTAG: c_int = 12;
pub const RULE_CAPTURE: c_int = 13;
pub const RULE_POSITION: c_int = 14;
pub const RULE_ARGUMENT: c_int = 15;
pub const RULE_CONSTANT: c_int = 16;
pub const RULE_ACCUMULATE: c_int = 17;
pub const RULE_GROUP: c_int = 18;
pub const RULE_REPLACE: c_int = 19;
pub const RULE_MATCHTIME: c_int = 20;
pub const RULE_ERROR: c_int = 21;
pub const RULE_DROP: c_int = 22;
pub const RULE_BACKMATCH: c_int = 23;
pub const RULE_TO: c_int = 24;
pub const RULE_THRU: c_int = 25;
pub const RULE_LENPREFIX: c_int = 26;
pub const RULE_READINT: c_int = 27;
pub const RULE_LINE: c_int = 28;
pub const RULE_COLUMN: c_int = 29;
pub const RULE_UNREF: c_int = 30;
pub const RULE_CAPTURE_NUM: c_int = 31;
pub const RULE_SUB: c_int = 32;
pub const RULE_TIL: c_int = 33;
pub const RULE_SPLIT: c_int = 34;
pub const RULE_NTH: c_int = 35;
pub const RULE_ONLY_TAGS: c_int = 36;
pub const RULE_MATCHSPLICE: c_int = 37;
pub const RULE_DEBUG: c_int = 38;
pub const JanetPegOpcode = c_uint;
pub const JanetPeg = extern struct {
    bytecode: [*c]u32 = null,
    constants: [*c]Janet = null,
    bytecode_len: usize = 0,
    num_constants: u32 = 0,
    has_backref: c_int = 0,
};
pub extern const janet_s64_type: JanetAbstractType;
pub extern const janet_u64_type: JanetAbstractType;
pub const JANET_INT_NONE: c_int = 0;
pub const JANET_INT_S64: c_int = 1;
pub const JANET_INT_U64: c_int = 2;
pub const JanetIntType = c_uint;
pub extern fn janet_is_int(x: Janet) JanetIntType;
pub extern fn janet_wrap_s64(x: i64) Janet;
pub extern fn janet_wrap_u64(x: u64) Janet;
pub extern fn janet_unwrap_s64(x: Janet) i64;
pub extern fn janet_unwrap_u64(x: Janet) u64;
pub extern fn janet_malloc(usize) ?*anyopaque;
pub extern fn janet_realloc(?*anyopaque, usize) ?*anyopaque;
pub extern fn janet_calloc(usize, usize) ?*anyopaque;
pub extern fn janet_free(?*anyopaque) void;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 7);
pub const __GNUC_MINOR__ = @as(c_int, 1);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 0);
pub const __ARO_EMULATE_NO__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_GCC__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const _WIN32 = @as(c_int, 1);
pub const _WIN64 = @as(c_int, 1);
pub const WIN32 = @as(c_int, 1);
pub const __WIN32 = @as(c_int, 1);
pub const __WIN32__ = @as(c_int, 1);
pub const WINNT = @as(c_int, 1);
pub const __WINNT = @as(c_int, 1);
pub const __WINNT__ = @as(c_int, 1);
pub const WIN64 = @as(c_int, 1);
pub const __WIN64 = @as(c_int, 1);
pub const __WIN64__ = @as(c_int, 1);
pub const __MINGW64__ = @as(c_int, 1);
pub const __MSVCRT__ = @as(c_int, 1);
pub const __MINGW32__ = @as(c_int, 1);
pub const __declspec = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// <builtin>:34:9
pub const _cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`");
// <builtin>:35:9
pub const __cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`");
// <builtin>:36:9
pub const _stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`");
// <builtin>:37:9
pub const __stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`");
// <builtin>:38:9
pub const _fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// <builtin>:39:9
pub const __fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// <builtin>:40:9
pub const _thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`");
// <builtin>:41:9
pub const __thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`");
// <builtin>:42:9
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// <builtin>:50:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// <builtin>:51:9
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __SHSTK__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WINT_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 16);
pub const __WINT_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 16);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 10);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
pub const __SIZEOF_WINT_T__ = @as(c_int, 2);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_longlong;
pub const __UINTPTR_TYPE__ = c_ulonglong;
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// <builtin>:169:9
pub const __INTMAX_C = __helpers.LL_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// <builtin>:172:9
pub const __UINTMAX_C = __helpers.ULL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_longlong;
pub const __SIZE_TYPE__ = c_ulonglong;
pub const __WCHAR_TYPE__ = c_ushort;
pub const __WINT_TYPE__ = c_ushort;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// <builtin>:198:9
pub const __INT64_C = __helpers.LL_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// <builtin>:223:9
pub const __UINT32_C = __helpers.U_SUFFIX;
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// <builtin>:232:9
pub const __UINT64_C = __helpers.ULL_SUFFIX;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "lld";
pub const INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_LEAST64_FMTo__ = "llo";
pub const UINT_LEAST64_FMTu__ = "llu";
pub const UINT_LEAST64_FMTx__ = "llx";
pub const UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "lld";
pub const INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_FAST64_FMTo__ = "llo";
pub const UINT_FAST64_FMTu__ = "llu";
pub const UINT_FAST64_FMTx__ = "llx";
pub const UINT_FAST64_FMTX__ = "llX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __pic__ = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const JANETCONF_H = "";
pub const JANET_VERSION_MAJOR = @as(c_int, 1);
pub const JANET_VERSION_MINOR = @as(c_int, 43);
pub const JANET_VERSION_PATCH = @as(c_int, 0);
pub const JANET_VERSION_EXTRA = "";
pub const JANET_VERSION = "1.43.0";
pub const JANET_H_defined = "";
pub const JANET_BUILD = "local";
pub const JANET_WINDOWS = @as(c_int, 1);
pub const JANET_MINGW = "";
pub const JANET_64 = @as(c_int, 1);
pub const JANET_LITTLE_ENDIAN = @as(c_int, 1);
pub const JANET_INTMAX_DOUBLE = @as(f64, 9007199254740992.0);
pub const JANET_INTMIN_DOUBLE = -@as(f64, 9007199254740992.0);
pub const JANET_INTMAX_INT64 = __helpers.promoteIntLiteral(c_int, 9007199254740992, .decimal);
pub const JANET_INTMIN_INT64 = -__helpers.promoteIntLiteral(c_int, 9007199254740992, .decimal);
pub const JANET_THREAD_LOCAL = @compileError("unable to translate C expr: unexpected token '__thread'");
// janet.h:258:9
pub const JANET_DYNAMIC_MODULES = "";
pub const JANET_FFI = "";
pub const JANET_FFI_JIT = "";
pub const JANET_ASSEMBLER = "";
pub const JANET_PEG = "";
pub const JANET_EV = "";
pub const JANET_FILEWATCH = "";
pub const JANET_NET = "";
pub const JANET_INT_TYPES = "";
pub const JANET_EXPORT = @compileError("unable to translate macro: undefined identifier `dllexport`");
// janet.h:338:9
pub const JANET_API = @compileError("unable to translate macro: undefined identifier `dllexport`");
// janet.h:350:9
pub const JANET_NO_RETURN = @compileError("unable to translate macro: undefined identifier `noreturn`");
// janet.h:360:9
pub const JANET_RECURSION_GUARD = @as(c_int, 1024);
pub const JANET_MAX_PROTO_DEPTH = @as(c_int, 200);
pub const JANET_MAX_MACRO_EXPAND = @as(c_int, 200);
pub const JANET_STACK_MAX = __helpers.promoteIntLiteral(c_int, 0x7fffffff, .hex);
pub const JANET_NANBOX_64 = "";
pub const JANET_NANBOX_64_POINTER_SHIFT = @as(c_int, 0);
pub const JANET_NANBOX_BIT = @as(c_int, 0x1);
pub const JANET_SINGLE_THREADED_BIT = @as(c_int, 0);
pub const JANET_NANBOX_POINTER_SHIFT_BITS = if (__helpers.cast(bool, JANET_NANBOX_64_POINTER_SHIFT)) @as(c_int, 0x4) << JANET_NANBOX_64_POINTER_SHIFT else @as(c_int, 0);
pub const JANET_CURRENT_CONFIG_BITS = (JANET_SINGLE_THREADED_BIT | JANET_NANBOX_BIT) | JANET_NANBOX_POINTER_SHIFT_BITS;
pub inline fn janet_config_current() JanetBuildConfig {
    return @import("std").mem.zeroInit(JanetBuildConfig, .{ JANET_VERSION_MAJOR, JANET_VERSION_MINOR, JANET_VERSION_PATCH, JANET_CURRENT_CONFIG_BITS });
}
pub const _CRT_RAND_S = "";
pub const _INC_STDLIB = "";
pub const _INC_CORECRT = "";
pub const _INC__MINGW_H = "";
pub const _INC_CRTDEFS_MACRO = "";
pub const __MINGW64_PASTE2 = @compileError("unable to translate C expr: unexpected token '##'");
// C:\msys64\ucrt64\include\_mingw_mac.h:10:9
pub inline fn __MINGW64_PASTE(x: anytype, y: anytype) @TypeOf(__MINGW64_PASTE2(x, y)) {
    _ = &x;
    _ = &y;
    return __MINGW64_PASTE2(x, y);
}
pub const __STRINGIFY = @compileError("unable to translate C expr: unexpected token ''");
// C:\msys64\ucrt64\include\_mingw_mac.h:13:9
pub inline fn __MINGW64_STRINGIFY(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub const __MINGW64_VERSION_MAJOR = @as(c_int, 15);
pub const __MINGW64_VERSION_MINOR = @as(c_int, 0);
pub const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
pub const __MINGW64_VERSION_RC = @as(c_int, 0);
pub const __MINGW64_VERSION_STR = __MINGW64_STRINGIFY(__MINGW64_VERSION_MAJOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_MINOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_BUGFIX);
pub const __MINGW64_VERSION_STATE = "alpha";
pub const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
pub const __MINGW32_MINOR_VERSION = @as(c_int, 11);
pub const _M_AMD64 = @as(c_int, 100);
pub const _M_X64 = @as(c_int, 100);
pub const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
pub const __MINGW_IMP_SYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`");
// C:\msys64\ucrt64\include\_mingw_mac.h:129:11
pub const __MINGW_IMP_LSYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`");
// C:\msys64\ucrt64\include\_mingw_mac.h:130:11
pub inline fn __MINGW_USYMBOL(sym: anytype) @TypeOf(sym) {
    _ = &sym;
    return sym;
}
pub const __MINGW_LSYMBOL = @compileError("unable to translate macro: undefined identifier `_`");
// C:\msys64\ucrt64\include\_mingw_mac.h:132:11
pub const __MINGW_ASM_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// C:\msys64\ucrt64\include\_mingw_mac.h:140:9
pub const __MINGW_ASM_CRT_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// C:\msys64\ucrt64\include\_mingw_mac.h:141:9
pub const __MINGW_EXTENSION = @compileError("unable to translate C expr: unexpected token '__extension__'");
// C:\msys64\ucrt64\include\_mingw_mac.h:173:13
pub const __C89_NAMELESS = __MINGW_EXTENSION;
pub const __C89_NAMELESSSTRUCTNAME = "";
pub const __C89_NAMELESSSTRUCTNAME1 = "";
pub const __C89_NAMELESSSTRUCTNAME2 = "";
pub const __C89_NAMELESSSTRUCTNAME3 = "";
pub const __C89_NAMELESSSTRUCTNAME4 = "";
pub const __C89_NAMELESSSTRUCTNAME5 = "";
pub const __C89_NAMELESSUNIONNAME = "";
pub const __C89_NAMELESSUNIONNAME1 = "";
pub const __C89_NAMELESSUNIONNAME2 = "";
pub const __C89_NAMELESSUNIONNAME3 = "";
pub const __C89_NAMELESSUNIONNAME4 = "";
pub const __C89_NAMELESSUNIONNAME5 = "";
pub const __C89_NAMELESSUNIONNAME6 = "";
pub const __C89_NAMELESSUNIONNAME7 = "";
pub const __C89_NAMELESSUNIONNAME8 = "";
pub const __GNU_EXTENSION = __MINGW_EXTENSION;
pub const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
pub const __MINGW_POISON_NAME = @compileError("unable to translate macro: undefined identifier `_layout_has_not_been_verified_and_its_declaration_is_most_likely_incorrect`");
// C:\msys64\ucrt64\include\_mingw_mac.h:213:11
pub const __MSABI_LONG = __helpers.L_SUFFIX;
pub const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
pub inline fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    _ = &major;
    _ = &minor;
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
pub inline fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &major;
    _ = &minor;
    return @as(c_int, 0);
}
pub inline fn __MINGW_ATTRIB_DEPRECATED_STR(X: anytype) void {
    _ = &X;
    return;
}
pub const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
pub const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
pub const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_MSVC2005_DEPREC_STR);
pub const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
pub const __MINGW_MS_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:293:9
pub const __MINGW_MS_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:296:9
pub const __MINGW_GNU_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:299:9
pub const __MINGW_GNU_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:302:9
pub const __mingw_ovr = @compileError("unable to translate macro: undefined identifier `__unused__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:311:11
pub const __mingw_attribute_artificial = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:318:11
pub const __MINGW_SELECTANY = @compileError("unable to translate macro: undefined identifier `__selectany__`");
// C:\msys64\ucrt64\include\_mingw_mac.h:324:9
pub const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
pub const __mingw_bos_ovr = __mingw_ovr;
pub const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
pub const _INC_MINGW_SECAPI = "";
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
pub const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate macro: undefined identifier `_s`");
// C:\msys64\ucrt64\include\_mingw_secapi.h:41:9
pub const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token '__cdecl'");
// C:\msys64\ucrt64\include\_mingw_secapi.h:69:9
pub const __LONG32 = c_long;
pub const __MINGW_IMPORT = @compileError("unable to translate macro: undefined identifier `__dllimport__`");
// C:\msys64\ucrt64\include\_mingw.h:44:12
pub const __USE_CRTIMP = @as(c_int, 1);
pub const _CRTIMP = @compileError("unable to translate macro: undefined identifier `__dllimport__`");
// C:\msys64\ucrt64\include\_mingw.h:52:15
pub const __DECLSPEC_SUPPORTED = "";
pub const USE___UUIDOF = @as(c_int, 0);
pub const _inline = @compileError("unable to translate C expr: unexpected token '__inline'");
// C:\msys64\ucrt64\include\_mingw.h:74:9
pub const __CRT_INLINE = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// C:\msys64\ucrt64\include\_mingw.h:83:11
pub const __MINGW_INTRIN_INLINE = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// C:\msys64\ucrt64\include\_mingw.h:90:9
pub const __MINGW_CXX11_CONSTEXPR = "";
pub const __MINGW_CXX14_CONSTEXPR = "";
pub const __UNUSED_PARAM = @compileError("unable to translate macro: undefined identifier `__unused__`");
// C:\msys64\ucrt64\include\_mingw.h:118:11
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// C:\msys64\ucrt64\include\_mingw.h:133:10
pub const __MINGW_ATTRIB_NORETURN = @compileError("unable to translate macro: undefined identifier `__noreturn__`");
// C:\msys64\ucrt64\include\_mingw.h:149:9
pub const __MINGW_ATTRIB_CONST = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// C:\msys64\ucrt64\include\_mingw.h:150:9
pub const __MINGW_ATTRIB_MALLOC = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// C:\msys64\ucrt64\include\_mingw.h:160:9
pub const __MINGW_ATTRIB_PURE = @compileError("unable to translate macro: undefined identifier `__pure__`");
// C:\msys64\ucrt64\include\_mingw.h:161:9
pub const __MINGW_ATTRIB_NONNULL = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// C:\msys64\ucrt64\include\_mingw.h:174:9
pub const __MINGW_ATTRIB_UNUSED = @compileError("unable to translate macro: undefined identifier `__unused__`");
// C:\msys64\ucrt64\include\_mingw.h:180:9
pub const __MINGW_ATTRIB_USED = @compileError("unable to translate macro: undefined identifier `__used__`");
// C:\msys64\ucrt64\include\_mingw.h:186:9
pub const __MINGW_ATTRIB_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// C:\msys64\ucrt64\include\_mingw.h:187:9
pub const __MINGW_ATTRIB_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// C:\msys64\ucrt64\include\_mingw.h:189:9
pub const __MINGW_NOTHROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// C:\msys64\ucrt64\include\_mingw.h:204:9
pub const __MINGW_ATTRIB_NO_OPTIMIZE = @compileError("unable to translate macro: undefined identifier `__optimize__`");
// C:\msys64\ucrt64\include\_mingw.h:212:9
pub const __MINGW_PRAGMA_PARAM_IMPL = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// C:\msys64\ucrt64\include\_mingw.h:231:9
pub inline fn __MINGW_PRAGMA_PARAM(x: anytype) @TypeOf(__MINGW_PRAGMA_PARAM_IMPL(x)) {
    _ = &x;
    return __MINGW_PRAGMA_PARAM_IMPL(x);
}
pub const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate macro: undefined identifier `message`");
// C:\msys64\ucrt64\include\_mingw.h:240:9
pub const __MSVCRT_VERSION__ = @as(c_int, 0xE00);
pub const _UCRT = "";
pub inline fn __MINGW_UCRT_ASM_CALL(func: anytype) @TypeOf(__MINGW_ASM_CALL(func)) {
    _ = &func;
    return __MINGW_ASM_CALL(func);
}
pub const _WIN32_WINNT = @as(c_int, 0xA00);
pub const _INT128_DEFINED = "";
pub const __int8 = u8;
pub const __int16 = c_short;
pub const __int32 = c_int;
pub const __int64 = c_longlong;
pub const __ptr32 = "";
pub const __ptr64 = "";
pub const __unaligned = "";
pub const __w64 = "";
pub const __forceinline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// C:\msys64\ucrt64\include\_mingw.h:305:9
pub const __nothrow = "";
pub const _CRT_BEGIN_C_HEADER = "";
pub const _CRT_END_C_HEADER = "";
pub const _INC_VADEFS = "";
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST_DEFINED = "";
pub inline fn _ADDRESSOF(v: anytype) @TypeOf(&v) {
    _ = &v;
    return &v;
}
pub const _crt_va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// C:\msys64\ucrt64\include\vadefs.h:40:9
pub const _crt_va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// C:\msys64\ucrt64\include\vadefs.h:41:9
pub const _crt_va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// C:\msys64\ucrt64\include\vadefs.h:42:9
pub const _crt_va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// C:\msys64\ucrt64\include\vadefs.h:43:9
pub const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token ''");
// C:\msys64\ucrt64\include\_mingw.h:332:9
pub inline fn _CRT_STRINGIZE(_Value: anytype) @TypeOf(__CRT_STRINGIZE(_Value)) {
    _ = &_Value;
    return __CRT_STRINGIZE(_Value);
}
pub const __CRT_WIDE = @compileError("unable to translate macro: undefined identifier `L`");
// C:\msys64\ucrt64\include\_mingw.h:337:9
pub inline fn _CRT_WIDE(_String: anytype) @TypeOf(__CRT_WIDE(_String)) {
    _ = &_String;
    return __CRT_WIDE(_String);
}
pub const _W64 = "";
pub const _CRTIMP_NOIA64 = _CRTIMP;
pub const _CRTIMP2 = _CRTIMP;
pub const _CRTIMP_ALTERNATIVE = _CRTIMP;
pub const _CRT_ALTERNATIVE_IMPORTED = "";
pub const _MRTIMP2 = _CRTIMP;
pub const _DLL = "";
pub const _MT = "";
pub const _MCRTIMP = _CRTIMP;
pub const _CRTIMP_PURE = _CRTIMP;
pub const _PGLOBAL = "";
pub const _AGLOBAL = "";
pub const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
pub const _CRT_DEPRECATE_TEXT = @compileError("unable to translate macro: undefined identifier `deprecated`");
// C:\msys64\ucrt64\include\_mingw.h:396:9
pub inline fn _CRT_INSECURE_DEPRECATE_MEMORY(_Replacement: anytype) void {
    _ = &_Replacement;
    return;
}
pub inline fn _CRT_INSECURE_DEPRECATE_GLOBALS(_Replacement: anytype) void {
    _ = &_Replacement;
    return;
}
pub const _CRT_MANAGED_HEAP_DEPRECATE = "";
pub inline fn _CRT_OBSOLETE(_NewItem: anytype) void {
    _ = &_NewItem;
    return;
}
pub const UNALIGNED = "";
pub const _CRT_ALIGN = @compileError("unable to translate macro: undefined identifier `__aligned__`");
// C:\msys64\ucrt64\include\_mingw.h:434:9
pub const __CRTDECL = @compileError("unable to translate C expr: unexpected token '__cdecl'");
// C:\msys64\ucrt64\include\_mingw.h:441:9
pub const _ARGMAX = @as(c_int, 100);
pub const _TRUNCATE = __helpers.cast(usize, -@as(c_int, 1));
pub inline fn _CRT_UNUSED(x: anytype) anyopaque {
    _ = &x;
    return __helpers.cast(anyopaque, x);
}
pub const __USE_MINGW_ANSI_STDIO = @as(c_int, 0);
pub const _CRT_glob = @compileError("unable to translate macro: undefined identifier `_dowildcard`");
// C:\msys64\ucrt64\include\_mingw.h:498:9
pub const __ANONYMOUS_DEFINED = "";
pub const _ANONYMOUS_UNION = __MINGW_EXTENSION;
pub const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
pub inline fn _UNION_NAME(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _STRUCT_NAME(x: anytype) void {
    _ = &x;
    return;
}
pub const DUMMYUNIONNAME = "";
pub const DUMMYUNIONNAME1 = "";
pub const DUMMYUNIONNAME2 = "";
pub const DUMMYUNIONNAME3 = "";
pub const DUMMYUNIONNAME4 = "";
pub const DUMMYUNIONNAME5 = "";
pub const DUMMYUNIONNAME6 = "";
pub const DUMMYUNIONNAME7 = "";
pub const DUMMYUNIONNAME8 = "";
pub const DUMMYUNIONNAME9 = "";
pub const DUMMYSTRUCTNAME = "";
pub const DUMMYSTRUCTNAME1 = "";
pub const DUMMYSTRUCTNAME2 = "";
pub const DUMMYSTRUCTNAME3 = "";
pub const DUMMYSTRUCTNAME4 = "";
pub const DUMMYSTRUCTNAME5 = "";
pub inline fn __CRT_UUID_DECL(@"type": anytype, l: anytype, w1: anytype, w2: anytype, b1: anytype, b2: anytype, b3: anytype, b4: anytype, b5: anytype, b6: anytype, b7: anytype, b8: anytype) void {
    _ = &@"type";
    _ = &l;
    _ = &w1;
    _ = &w2;
    _ = &b1;
    _ = &b2;
    _ = &b3;
    _ = &b4;
    _ = &b5;
    _ = &b6;
    _ = &b7;
    _ = &b8;
    return;
}
pub const __MINGW_DEBUGBREAK_IMPL = @compileError("unable to translate macro: undefined identifier `__debugbreak`");
// C:\msys64\ucrt64\include\_mingw.h:614:9
pub const __MINGW_FASTFAIL_IMPL = @compileError("unable to translate macro: undefined identifier `__fastfail`");
// C:\msys64\ucrt64\include\_mingw.h:635:9
pub const __MINGW_PREFETCH_IMPL = @compileError("unable to translate macro: undefined identifier `__prefetch`");
// C:\msys64\ucrt64\include\_mingw.h:659:9
pub const __STDC_SECURE_LIB__ = @as(c_long, 200411);
pub const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
pub const _CRT_PACKING = @as(c_int, 8);
pub const _CRTNOALIAS = "";
pub const _CRTRESTRICT = "";
pub const _SIZE_T_DEFINED = "";
pub const _SSIZE_T_DEFINED = "";
pub const _RSIZE_T_DEFINED = "";
pub const _INTPTR_T_DEFINED = "";
pub const __intptr_t_defined = "";
pub const _UINTPTR_T_DEFINED = "";
pub const __uintptr_t_defined = "";
pub const _PTRDIFF_T_DEFINED = "";
pub const _PTRDIFF_T_ = "";
pub const _WCHAR_T_DEFINED = "";
pub const _WCTYPE_T_DEFINED = "";
pub const _WINT_T = "";
pub const _ERRCODE_DEFINED = "";
pub const _TIME32_T_DEFINED = "";
pub const _TIME64_T_DEFINED = "";
pub const _TIME_T_DEFINED = "";
pub const _CRT_SECURE_CPP_NOTHROW = @compileError("unable to translate macro: undefined identifier `throw`");
// C:\msys64\ucrt64\include\corecrt.h:157:9
pub const _CONST_RETURN = "";
pub const _WConst_return = "";
pub const _STATIC_ASSERT = @compileError("unable to translate C expr: unexpected token '_Static_assert'");
// C:\msys64\ucrt64\include\corecrt.h:185:9
pub const _SECIMP = @compileError("unable to translate macro: undefined identifier `dllimport`");
// C:\msys64\ucrt64\include\corecrt.h:210:9
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype, __type4: anytype, __arg4: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    _ = &__type4;
    _ = &__arg4;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0(__ret: anytype, __func: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __dsttype: anytype, __dst: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__dsttype;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST(__ret: anytype, __func: anytype, __vfunc: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__vfunc;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST(__ret: anytype, __func: anytype, __vfunc: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__vfunc;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH(__ret: anytype, __func: anytype, __dsttype: anytype, __src: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__src;
    return;
}
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// C:\msys64\ucrt64\include\corecrt.h:344:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// C:\msys64\ucrt64\include\corecrt.h:346:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// C:\msys64\ucrt64\include\corecrt.h:348:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// C:\msys64\ucrt64\include\corecrt.h:350:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// C:\msys64\ucrt64\include\corecrt.h:352:9
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype, __arg3_type: anytype, __arg3: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    _ = &__arg3_type;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype, __arg3_type: anytype, __arg3: anytype, __arg4_type: anytype, __arg4: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    _ = &__arg3_type;
    _ = &__arg3;
    _ = &__arg4_type;
    _ = &__arg4;
    return;
}
pub const _TAGLC_ID_DEFINED = "";
pub inline fn __crt_typefix(ctype: anytype) void {
    _ = &ctype;
    return;
}
pub const _CRT_USE_WINAPI_FAMILY_DESKTOP_APP = "";
pub const _INC_CORECRT_MALLOC = "";
pub const _INC_CORECRT_WSTDLIB = "";
pub const _CRT_WSYSTEM_DEFINED = "";
pub const _CRT_WPERROR_DEFINED = "";
pub const _INC_LIMITS = "";
pub const PATH_MAX = @as(c_int, 260);
pub const CHAR_BIT = @as(c_int, 8);
pub const SCHAR_MIN = -@as(c_int, 128);
pub const SCHAR_MAX = @as(c_int, 127);
pub const UCHAR_MAX = @as(c_int, 0xff);
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = SCHAR_MAX;
pub const MB_LEN_MAX = @as(c_int, 5);
pub const SHRT_MIN = -__helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const SHRT_MAX = @as(c_int, 32767);
pub const USHRT_MAX = @as(c_uint, 0xffff);
pub const INT_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const UINT_MAX = __helpers.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const LONG_MIN = -@as(c_long, 2147483647) - @as(c_int, 1);
pub const LONG_MAX = @as(c_long, 2147483647);
pub const ULONG_MAX = @as(c_ulong, 0xffffffff);
pub const LLONG_MAX = @as(c_longlong, 9223372036854775807);
pub const LLONG_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const ULLONG_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const _I8_MIN = -@as(c_int, 127) - @as(c_int, 1);
pub const _I8_MAX = @as(c_int, 127);
pub const _UI8_MAX = @as(c_uint, 0xff);
pub const _I16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const _I16_MAX = @as(c_int, 32767);
pub const _UI16_MAX = @as(c_uint, 0xffff);
pub const _I32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const _I32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _UI32_MAX = __helpers.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const LONG_LONG_MAX = @as(c_longlong, 9223372036854775807);
pub const LONG_LONG_MIN = -LONG_LONG_MAX - @as(c_int, 1);
pub const ULONG_LONG_MAX = (@as(c_ulonglong, 2) * LONG_LONG_MAX) + @as(c_ulonglong, 1);
pub const _I64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const _I64_MAX = @as(c_longlong, 9223372036854775807);
pub const _UI64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const SIZE_MAX = _UI64_MAX;
pub const SSIZE_MAX = _I64_MAX;
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const _ONEXIT_T_DEFINED = "";
pub const onexit_t = _onexit_t;
pub const _CRT_DOUBLE_DEC = "";
pub inline fn _PTR_LD(x: anytype) [*c]u8 {
    _ = &x;
    return __helpers.cast([*c]u8, &x.*.ld);
}
pub const RAND_MAX = @as(c_int, 0x7fff);
pub const MB_CUR_MAX = ___mb_cur_max_func();
pub const __mb_cur_max = ___mb_cur_max_func();
pub inline fn __max(a: anytype, b: anytype) @TypeOf(if (__helpers.cast(bool, a > b)) a else b) {
    _ = &a;
    _ = &b;
    return if (__helpers.cast(bool, a > b)) a else b;
}
pub inline fn __min(a: anytype, b: anytype) @TypeOf(if (__helpers.cast(bool, a < b)) a else b) {
    _ = &a;
    _ = &b;
    return if (__helpers.cast(bool, a < b)) a else b;
}
pub const _MAX_PATH = @as(c_int, 260);
pub const _MAX_DRIVE = @as(c_int, 3);
pub const _MAX_DIR = @as(c_int, 256);
pub const _MAX_FNAME = @as(c_int, 256);
pub const _MAX_EXT = @as(c_int, 256);
pub const _OUT_TO_DEFAULT = @as(c_int, 0);
pub const _OUT_TO_STDERR = @as(c_int, 1);
pub const _OUT_TO_MSGBOX = @as(c_int, 2);
pub const _REPORT_ERRMODE = @as(c_int, 3);
pub const _WRITE_ABORT_MSG = @as(c_int, 0x1);
pub const _CALL_REPORTFAULT = @as(c_int, 0x2);
pub const _MAX_ENV = @as(c_int, 32767);
pub const _CRT_ERRNO_DEFINED = "";
pub const errno = _errno().*;
pub const _doserrno = __doserrno().*;
pub const _sys_nerr = __sys_nerr().*;
pub const _sys_errlist = __sys_errlist();
pub const _fmode = __p__fmode().*;
pub const __argc = __p___argc().*;
pub const __argv = __p___argv().*;
pub const __wargv = __p___wargv().*;
pub const _pgmptr = __p__pgmptr().*;
pub const _wpgmptr = __p__wpgmptr().*;
pub const _environ = __p__environ().*;
pub const _wenviron = __p__wenviron().*;
pub const _osplatform = __p__osplatform().*;
pub const _osver = __p__osver().*;
pub const _winver = __p__winver().*;
pub const _winmajor = __p__winmajor().*;
pub const _winminor = __p__winminor().*;
pub inline fn _countof(_Array: anytype) @TypeOf(__helpers.div(__helpers.sizeof(_Array), __helpers.sizeof(_Array[@as(usize, @intCast(@as(c_int, 0)))]))) {
    _ = &_Array;
    return __helpers.div(__helpers.sizeof(_Array), __helpers.sizeof(_Array[@as(usize, @intCast(@as(c_int, 0)))]));
}
pub const _CRT_TERMINATE_DEFINED = "";
pub const _CRT_ABS_DEFINED = "";
pub const _CRT_ATOF_DEFINED = "";
pub const _CRT_ALGO_DEFINED = "";
pub const _CRT_SYSTEM_DEFINED = "";
pub const _CVTBUFSIZE = @as(c_int, 309) + @as(c_int, 40);
pub const _CRT_PERROR_DEFINED = "";
pub const sys_errlist = _sys_errlist;
pub const sys_nerr = _sys_nerr;
pub const environ = _environ;
pub const _CRT_SWAB_DEFINED = "";
pub const _MALLOC_H_ = "";
pub const _HEAP_MAXREQ = __helpers.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFE0, .hex);
pub const _HEAPEMPTY = -@as(c_int, 1);
pub const _HEAPOK = -@as(c_int, 2);
pub const _HEAPBADBEGIN = -@as(c_int, 3);
pub const _HEAPBADNODE = -@as(c_int, 4);
pub const _HEAPEND = -@as(c_int, 5);
pub const _HEAPBADPTR = -@as(c_int, 6);
pub const _FREEENTRY = @as(c_int, 0);
pub const _USEDENTRY = @as(c_int, 1);
pub const _amblksiz = __p__amblksiz().*;
pub const __MM_MALLOC_H = "";
pub const _MAX_WAIT_MALLOC_CRT = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const _alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`");
// C:\msys64\ucrt64\include\malloc.h:77:9
pub const _ALLOCA_S_THRESHOLD = @as(c_int, 1024);
pub const _ALLOCA_S_STACK_MARKER = __helpers.promoteIntLiteral(c_int, 0xCCCC, .hex);
pub const _ALLOCA_S_HEAP_MARKER = __helpers.promoteIntLiteral(c_int, 0xDDDD, .hex);
pub const _ALLOCA_S_MARKER_SIZE = @as(c_int, 16);
pub inline fn _malloca(size: anytype) @TypeOf(if (__helpers.cast(bool, (size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD)) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER)) {
    _ = &size;
    return if (__helpers.cast(bool, (size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD)) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER);
}
pub const _FREEA_INLINE = "";
pub const alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`");
// C:\msys64\ucrt64\include\malloc.h:152:9
pub const _STDINT_H = "";
pub const _INC_STDDEF = "";
pub const _threadid = __threadid();
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -__helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = __helpers.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const UINT64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MIN = INT64_MIN;
pub const INTPTR_MAX = INT64_MAX;
pub const UINTPTR_MAX = UINT64_MAX;
pub const INTMAX_MIN = INT64_MIN;
pub const INTMAX_MAX = INT64_MAX;
pub const UINTMAX_MAX = UINT64_MAX;
pub const PTRDIFF_MIN = INT64_MIN;
pub const PTRDIFF_MAX = INT64_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const WCHAR_MIN = @as(c_uint, 0);
pub const WCHAR_MAX = @as(c_uint, 0xffff);
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @as(c_uint, 0xffff);
pub inline fn INT8_C(val: anytype) @TypeOf((INT_LEAST8_MAX - INT_LEAST8_MAX) + val) {
    _ = &val;
    return (INT_LEAST8_MAX - INT_LEAST8_MAX) + val;
}
pub inline fn INT16_C(val: anytype) @TypeOf((INT_LEAST16_MAX - INT_LEAST16_MAX) + val) {
    _ = &val;
    return (INT_LEAST16_MAX - INT_LEAST16_MAX) + val;
}
pub inline fn INT32_C(val: anytype) @TypeOf((INT_LEAST32_MAX - INT_LEAST32_MAX) + val) {
    _ = &val;
    return (INT_LEAST32_MAX - INT_LEAST32_MAX) + val;
}
pub const INT64_C = __helpers.LL_SUFFIX;
pub inline fn UINT8_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
pub inline fn UINT16_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
pub const UINT32_C = __helpers.U_SUFFIX;
pub const UINT64_C = __helpers.ULL_SUFFIX;
pub const INTMAX_C = __helpers.LL_SUFFIX;
pub const UINTMAX_C = __helpers.ULL_SUFFIX;
pub const _INC_STRING = "";
pub const _INC_CORECRT_MEMORY = "";
pub const _INC_CORECRT_WSTRING = "";
pub const _WSTRING_DEFINED = "";
pub const _WSTRING_S_DEFINED = "";
pub const wcswcs = wcsstr;
pub const _NLSCMPERROR = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _STDARG_H = "";
pub const _ANSI_STDARG_H_ = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// C:\msys64\ucrt64\include\stdarg.h:63:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// C:\msys64\ucrt64\include\stdarg.h:65:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// C:\msys64\ucrt64\include\stdarg.h:66:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// C:\msys64\ucrt64\include\stdarg.h:68:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// C:\msys64\ucrt64\include\stdarg.h:70:9
pub const _VA_LIST_ = "";
pub const _VA_LIST = "";
pub const _VA_LIST_T_H = "";
pub const __va_list__ = "";
pub const _INC_STDARG = "";
pub const _INC_SETJMP = "";
pub const _JBLEN = @as(c_int, 16);
pub const _JMP_BUF_DEFINED = "";
pub inline fn setjmp(BUF: anytype) @TypeOf(_setjmp(BUF, NULL)) {
    _ = &BUF;
    return _setjmp(BUF, NULL);
}
pub const _STDDEF_H = "";
pub const _STDDEF_H_ = "";
pub const _ANSI_STDDEF_H = "";
pub const __STDDEF_H__ = "";
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`");
// C:\msys64\ucrt64\include\stddef.h:410:9
pub const _GCC_MAX_ALIGN_T = "";
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const _INC_STDIO = "";
pub const _INC_CORECRT_WSTDIO = "";
pub const _STDIO_CONFIG_DEFINED = "";
pub const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0008);
pub const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = @as(c_ulonglong, 0x0010);
pub const _CRT_INTERNAL_PRINTF_STANDARD_ROUNDING = @as(c_ulonglong, 0x0020);
pub const _CRT_INTERNAL_SCANF_SECURECRT = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = __local_stdio_printf_options().*;
pub const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = __local_stdio_scanf_options().*;
pub const WEOF = __helpers.cast(wint_t, __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex));
pub const _FILE_DEFINED = "";
pub const _iob = __iob_func();
pub const stdin = __acrt_iob_func(@as(c_int, 0));
pub const stdout = __acrt_iob_func(@as(c_int, 1));
pub const stderr = __acrt_iob_func(@as(c_int, 2));
pub const wpopen = _wpopen;
pub inline fn _putwc_nolock(_c: anytype, _stm: anytype) @TypeOf(_fputwc_nolock(_c, _stm)) {
    _ = &_c;
    _ = &_stm;
    return _fputwc_nolock(_c, _stm);
}
pub inline fn _getwc_nolock(_c: anytype) @TypeOf(_fgetwc_nolock(_c)) {
    _ = &_c;
    return _fgetwc_nolock(_c);
}
pub const BUFSIZ = @as(c_int, 512);
pub const _NFILE = _NSTREAM_;
pub const _NSTREAM_ = @as(c_int, 512);
pub const _IOB_ENTRIES = @as(c_int, 3);
pub const EOF = -@as(c_int, 1);
pub const _P_tmpdir = "\\";
pub const _wP_tmpdir = "\\";
pub const L_tmpnam = @as(c_int, 260);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const SEEK_SET = @as(c_int, 0);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const FILENAME_MAX = @as(c_int, 260);
pub const FOPEN_MAX = @as(c_int, 20);
pub const _SYS_OPEN = @as(c_int, 20);
pub const TMP_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _OFF_T_DEFINED = "";
pub const _OFF_T_ = "";
pub const _OFF64_T_DEFINED = "";
pub const _FILE_OFFSET_BITS_SET_OFFT = "";
pub const _FPOS_T_DEFINED = "";
pub inline fn _FPOSOFF(fp: anytype) c_long {
    _ = &fp;
    return __helpers.cast(c_long, fp);
}
pub const _IOFBF = @as(c_int, 0x0000);
pub const _IOLBF = @as(c_int, 0x0040);
pub const _IONBF = @as(c_int, 0x0004);
pub const __MINGW_PRINTF_FORMAT = @compileError("unable to translate macro: undefined identifier `__gnu_printf__`");
// C:\msys64\ucrt64\include\stdio.h:230:9
pub const __MINGW_SCANF_FORMAT = @compileError("unable to translate macro: undefined identifier `__gnu_scanf__`");
// C:\msys64\ucrt64\include\stdio.h:231:9
pub const popen = _popen;
pub const pclose = _pclose;
pub const _CRT_DIRECTORY_DEFINED = "";
pub inline fn _getchar_nolock() @TypeOf(_getc_nolock(stdin)) {
    return _getc_nolock(stdin);
}
pub inline fn _putchar_nolock(_c: anytype) @TypeOf(_putc_nolock(_c, stdout)) {
    _ = &_c;
    return _putc_nolock(_c, stdout);
}
pub inline fn _getwchar_nolock() @TypeOf(_getwc_nolock(stdin)) {
    return _getwc_nolock(stdin);
}
pub inline fn _putwchar_nolock(_c: anytype) @TypeOf(_putwc_nolock(_c, stdout)) {
    _ = &_c;
    return _putwc_nolock(_c, stdout);
}
pub const P_tmpdir = _P_tmpdir;
pub const SYS_OPEN = _SYS_OPEN;
pub const L_tmpnam_s = L_tmpnam;
pub const TMP_MAX_S = TMP_MAX;
pub const JANET_OUT_OF_MEMORY = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// janet.h:491:9
pub const JANET_HANDLE_NONE = NULL;
pub const JANET_COUNT_TYPES = JANET_POINTER + @as(c_int, 1);
pub const JANET_TFLAG_NIL = @as(c_int, 1) << JANET_NIL;
pub const JANET_TFLAG_BOOLEAN = @as(c_int, 1) << JANET_BOOLEAN;
pub const JANET_TFLAG_FIBER = @as(c_int, 1) << JANET_FIBER;
pub const JANET_TFLAG_NUMBER = @as(c_int, 1) << JANET_NUMBER;
pub const JANET_TFLAG_STRING = @as(c_int, 1) << JANET_STRING;
pub const JANET_TFLAG_SYMBOL = @as(c_int, 1) << JANET_SYMBOL;
pub const JANET_TFLAG_KEYWORD = @as(c_int, 1) << JANET_KEYWORD;
pub const JANET_TFLAG_ARRAY = @as(c_int, 1) << JANET_ARRAY;
pub const JANET_TFLAG_TUPLE = @as(c_int, 1) << JANET_TUPLE;
pub const JANET_TFLAG_TABLE = @as(c_int, 1) << JANET_TABLE;
pub const JANET_TFLAG_STRUCT = @as(c_int, 1) << JANET_STRUCT;
pub const JANET_TFLAG_BUFFER = @as(c_int, 1) << JANET_BUFFER;
pub const JANET_TFLAG_FUNCTION = @as(c_int, 1) << JANET_FUNCTION;
pub const JANET_TFLAG_CFUNCTION = @as(c_int, 1) << JANET_CFUNCTION;
pub const JANET_TFLAG_ABSTRACT = @as(c_int, 1) << JANET_ABSTRACT;
pub const JANET_TFLAG_POINTER = @as(c_int, 1) << JANET_POINTER;
pub const JANET_TFLAG_BYTES = ((JANET_TFLAG_STRING | JANET_TFLAG_SYMBOL) | JANET_TFLAG_BUFFER) | JANET_TFLAG_KEYWORD;
pub const JANET_TFLAG_INDEXED = JANET_TFLAG_ARRAY | JANET_TFLAG_TUPLE;
pub const JANET_TFLAG_DICTIONARY = JANET_TFLAG_TABLE | JANET_TFLAG_STRUCT;
pub const JANET_TFLAG_LENGTHABLE = (JANET_TFLAG_BYTES | JANET_TFLAG_INDEXED) | JANET_TFLAG_DICTIONARY;
pub const JANET_TFLAG_CALLABLE = ((JANET_TFLAG_FUNCTION | JANET_TFLAG_CFUNCTION) | JANET_TFLAG_LENGTHABLE) | JANET_TFLAG_ABSTRACT;
pub const JANET_STREAM_CLOSED = @as(c_int, 0x1);
pub const JANET_STREAM_SOCKET = @as(c_int, 0x2);
pub const JANET_STREAM_UNREGISTERED = @as(c_int, 0x4);
pub const JANET_STREAM_READABLE = @as(c_int, 0x200);
pub const JANET_STREAM_WRITABLE = @as(c_int, 0x400);
pub const JANET_STREAM_ACCEPTABLE = @as(c_int, 0x800);
pub const JANET_STREAM_UDPSERVER = @as(c_int, 0x1000);
pub const JANET_STREAM_NOT_CLOSEABLE = @as(c_int, 0x2000);
pub const JANET_STREAM_TOCLOSE = __helpers.promoteIntLiteral(c_int, 0x10000, .hex);
pub const JANET_STREAM_NODUPS = __helpers.promoteIntLiteral(c_int, 0x20000, .hex);
pub const _MATH_H_ = "";
pub const _DOMAIN = @as(c_int, 1);
pub const _SING = @as(c_int, 2);
pub const _OVERFLOW = @as(c_int, 3);
pub const _UNDERFLOW = @as(c_int, 4);
pub const _TLOSS = @as(c_int, 5);
pub const _PLOSS = @as(c_int, 6);
pub const DOMAIN = _DOMAIN;
pub const SING = _SING;
pub const OVERFLOW = _OVERFLOW;
pub const UNDERFLOW = _UNDERFLOW;
pub const TLOSS = _TLOSS;
pub const PLOSS = _PLOSS;
pub const M_E = @as(f64, 2.7182818284590452354);
pub const M_LOG2E = @as(f64, 1.4426950408889634074);
pub const M_LOG10E = @as(f64, 0.43429448190325182765);
pub const M_LN2 = @as(f64, 0.69314718055994530942);
pub const M_LN10 = @as(f64, 2.30258509299404568402);
pub const M_PI = @as(f64, 3.14159265358979323846);
pub const M_PI_2 = @as(f64, 1.57079632679489661923);
pub const M_PI_4 = @as(f64, 0.78539816339744830962);
pub const M_1_PI = @as(f64, 0.31830988618379067154);
pub const M_2_PI = @as(f64, 0.63661977236758134308);
pub const M_2_SQRTPI = @as(f64, 1.12837916709551257390);
pub const M_SQRT2 = @as(f64, 1.41421356237309504880);
pub const M_SQRT1_2 = @as(f64, 0.70710678118654752440);
pub const __MINGW_FPCLASS_DEFINED = @as(c_int, 1);
pub const _FPCLASS_SNAN = @as(c_int, 0x0001);
pub const _FPCLASS_QNAN = @as(c_int, 0x0002);
pub const _FPCLASS_NINF = @as(c_int, 0x0004);
pub const _FPCLASS_NN = @as(c_int, 0x0008);
pub const _FPCLASS_ND = @as(c_int, 0x0010);
pub const _FPCLASS_NZ = @as(c_int, 0x0020);
pub const _FPCLASS_PZ = @as(c_int, 0x0040);
pub const _FPCLASS_PD = @as(c_int, 0x0080);
pub const _FPCLASS_PN = @as(c_int, 0x0100);
pub const _FPCLASS_PINF = @as(c_int, 0x0200);
pub const __mingw_types_compatible_p = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`");
// C:\msys64\ucrt64\include\math.h:91:9
pub const __mingw_choose_expr = @compileError("unable to translate macro: undefined identifier `__builtin_choose_expr`");
// C:\msys64\ucrt64\include\math.h:99:9
pub const __MINGW_SOFTMATH = "";
pub const _HUGE = __MINGW_IMP_SYMBOL(_HUGE).*;
pub const HUGE_VAL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// C:\msys64\ucrt64\include\math.h:143:9
pub const MATH_ERRNO = @as(c_int, 1);
pub const MATH_ERREXCEPT = @as(c_int, 2);
pub const math_errhandling = MATH_ERRNO | MATH_ERREXCEPT;
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const _COMPLEX_DEFINED = "";
pub const _SIGN_DEFINED = "";
pub const FP_SNAN = _FPCLASS_SNAN;
pub const FP_QNAN = _FPCLASS_QNAN;
pub const FP_NINF = _FPCLASS_NINF;
pub const FP_PINF = _FPCLASS_PINF;
pub const FP_NDENORM = _FPCLASS_ND;
pub const FP_PDENORM = _FPCLASS_PD;
pub const FP_NZERO = _FPCLASS_NZ;
pub const FP_PZERO = _FPCLASS_PZ;
pub const FP_NNORM = _FPCLASS_NN;
pub const FP_PNORM = _FPCLASS_PN;
pub const HUGE_VALF = __builtin.huge_valf();
pub const HUGE_VALL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// C:\msys64\ucrt64\include\math.h:341:9
pub const INFINITY = __builtin.inff();
pub const NAN = __builtin.nanf("");
pub const FP_NAN = @as(c_int, 0x0100);
pub const FP_NORMAL = @as(c_int, 0x0400);
pub const FP_INFINITE = FP_NAN | FP_NORMAL;
pub const FP_ZERO = @as(c_int, 0x4000);
pub const FP_SUBNORMAL = FP_NORMAL | FP_ZERO;
pub inline fn __dfp_expansion(__call: anytype, __fin: anytype, x: anytype) @TypeOf(__fin) {
    _ = &__call;
    _ = &__fin;
    _ = &x;
    return __fin;
}
pub const fpclassify = @compileError("unable to translate macro: undefined identifier `__builtin_trap`");
// C:\msys64\ucrt64\include\math.h:483:9
pub inline fn isfinite(x: anytype) @TypeOf((fpclassify(x) & FP_NAN) == @as(c_int, 0)) {
    _ = &x;
    return (fpclassify(x) & FP_NAN) == @as(c_int, 0);
}
pub inline fn isinf(x: anytype) @TypeOf(fpclassify(x) == FP_INFINITE) {
    _ = &x;
    return fpclassify(x) == FP_INFINITE;
}
pub const isnan = @compileError("unable to translate macro: undefined identifier `__builtin_trap`");
// C:\msys64\ucrt64\include\math.h:577:9
pub inline fn isnormal(x: anytype) @TypeOf(fpclassify(x) == FP_NORMAL) {
    _ = &x;
    return fpclassify(x) == FP_NORMAL;
}
pub const signbit = @compileError("unable to translate macro: undefined identifier `__builtin_trap`");
// C:\msys64\ucrt64\include\math.h:637:9
pub const FP_ILOGB0 = __helpers.cast(c_int, __helpers.promoteIntLiteral(c_int, 0x80000000, .hex));
pub const FP_ILOGBNAN = __helpers.cast(c_int, __helpers.promoteIntLiteral(c_int, 0x7fffffff, .hex));
pub inline fn _nan() @TypeOf(nan("")) {
    return nan("");
}
pub inline fn _nanf() @TypeOf(nanf("")) {
    return nanf("");
}
pub inline fn _nanl() @TypeOf(nanl("")) {
    return nanl("");
}
pub const isgreater = @compileError("unable to translate macro: undefined identifier `__builtin_isgreater`");
// C:\msys64\ucrt64\include\math.h:1011:9
pub const isgreaterequal = @compileError("unable to translate macro: undefined identifier `__builtin_isgreaterequal`");
// C:\msys64\ucrt64\include\math.h:1012:9
pub const isless = @compileError("unable to translate macro: undefined identifier `__builtin_isless`");
// C:\msys64\ucrt64\include\math.h:1013:9
pub const islessequal = @compileError("unable to translate macro: undefined identifier `__builtin_islessequal`");
// C:\msys64\ucrt64\include\math.h:1014:9
pub const islessgreater = @compileError("unable to translate macro: undefined identifier `__builtin_islessgreater`");
// C:\msys64\ucrt64\include\math.h:1015:9
pub const isunordered = @compileError("unable to translate macro: undefined identifier `__builtin_isunordered`");
// C:\msys64\ucrt64\include\math.h:1016:9
pub const _copysignl = copysignl;
pub const _hypotl = hypotl;
pub const matherr = _matherr;
pub const HUGE = _HUGE;
pub inline fn janet_u64(x: anytype) @TypeOf(x.u64) {
    _ = &x;
    return x.u64;
}
pub const JANET_NANBOX_TAGBITS = @as(c_ulonglong, 0xFFFF800000000000);
pub const JANET_NANBOX_PAYLOADBITS = @as(c_ulonglong, 0x00007FFFFFFFFFFF);
pub inline fn janet_nanbox_lowtag(@"type": anytype) @TypeOf(__helpers.cast(u64, @"type") | __helpers.promoteIntLiteral(c_int, 0x1FFF0, .hex)) {
    _ = &@"type";
    return __helpers.cast(u64, @"type") | __helpers.promoteIntLiteral(c_int, 0x1FFF0, .hex);
}
pub inline fn janet_nanbox_tag(@"type": anytype) @TypeOf(janet_nanbox_lowtag(@"type") << @as(c_int, 47)) {
    _ = &@"type";
    return janet_nanbox_lowtag(@"type") << @as(c_int, 47);
}
pub inline fn janet_nanbox_checkauxtype(x: anytype, @"type": anytype) @TypeOf((x.u64 & JANET_NANBOX_TAGBITS) == janet_nanbox_tag(@"type")) {
    _ = &x;
    _ = &@"type";
    return (x.u64 & JANET_NANBOX_TAGBITS) == janet_nanbox_tag(@"type");
}
pub inline fn janet_nanbox_isnumber(x: anytype) @TypeOf(!(isnan(x.number) != 0) or (((x.u64 >> @as(c_int, 47)) & @as(c_int, 0xF)) == JANET_NUMBER)) {
    _ = &x;
    return !(isnan(x.number) != 0) or (((x.u64 >> @as(c_int, 47)) & @as(c_int, 0xF)) == JANET_NUMBER);
}
pub inline fn janet_nanbox_from_payload(t: anytype, p: anytype) @TypeOf(janet_nanbox_from_bits(janet_nanbox_tag(t) | p)) {
    _ = &t;
    _ = &p;
    return janet_nanbox_from_bits(janet_nanbox_tag(t) | p);
}
pub inline fn janet_nanbox_wrap_(p: anytype, t: anytype) @TypeOf(janet_nanbox_from_pointer(p, janet_nanbox_tag(t))) {
    _ = &p;
    _ = &t;
    return janet_nanbox_from_pointer(p, janet_nanbox_tag(t));
}
pub inline fn janet_nanbox_wrap_c(p: anytype, t: anytype) @TypeOf(janet_nanbox_from_cpointer(p, janet_nanbox_tag(t))) {
    _ = &p;
    _ = &t;
    return janet_nanbox_from_cpointer(p, janet_nanbox_tag(t));
}
pub inline fn janet_checkint8range(x: anytype) @TypeOf(((x >= INT8_MIN) and (x <= INT8_MAX)) and (x == __helpers.cast(i8, x))) {
    _ = &x;
    return ((x >= INT8_MIN) and (x <= INT8_MAX)) and (x == __helpers.cast(i8, x));
}
pub inline fn janet_checkuint8range(x: anytype) @TypeOf(((x >= @as(c_int, 0)) and (x <= UINT8_MAX)) and (x == __helpers.cast(u8, x))) {
    _ = &x;
    return ((x >= @as(c_int, 0)) and (x <= UINT8_MAX)) and (x == __helpers.cast(u8, x));
}
pub inline fn janet_checkint16range(x: anytype) @TypeOf(((x >= INT16_MIN) and (x <= INT16_MAX)) and (x == __helpers.cast(i16, x))) {
    _ = &x;
    return ((x >= INT16_MIN) and (x <= INT16_MAX)) and (x == __helpers.cast(i16, x));
}
pub inline fn janet_checkuint16range(x: anytype) @TypeOf(((x >= @as(c_int, 0)) and (x <= UINT16_MAX)) and (x == __helpers.cast(u16, x))) {
    _ = &x;
    return ((x >= @as(c_int, 0)) and (x <= UINT16_MAX)) and (x == __helpers.cast(u16, x));
}
pub inline fn janet_checkintrange(x: anytype) @TypeOf(((x >= INT32_MIN) and (x <= INT32_MAX)) and (x == __helpers.cast(i32, x))) {
    _ = &x;
    return ((x >= INT32_MIN) and (x <= INT32_MAX)) and (x == __helpers.cast(i32, x));
}
pub inline fn janet_checkuintrange(x: anytype) @TypeOf(((x >= @as(c_int, 0)) and (x <= UINT32_MAX)) and (x == __helpers.cast(u32, x))) {
    _ = &x;
    return ((x >= @as(c_int, 0)) and (x <= UINT32_MAX)) and (x == __helpers.cast(u32, x));
}
pub inline fn janet_checkint64range(x: anytype) @TypeOf(((x >= JANET_INTMIN_DOUBLE) and (x <= JANET_INTMAX_DOUBLE)) and (x == __helpers.cast(i64, x))) {
    _ = &x;
    return ((x >= JANET_INTMIN_DOUBLE) and (x <= JANET_INTMAX_DOUBLE)) and (x == __helpers.cast(i64, x));
}
pub inline fn janet_checkuint64range(x: anytype) @TypeOf(((x >= @as(c_int, 0)) and (x <= JANET_INTMAX_DOUBLE)) and (x == __helpers.cast(u64, x))) {
    _ = &x;
    return ((x >= @as(c_int, 0)) and (x <= JANET_INTMAX_DOUBLE)) and (x == __helpers.cast(u64, x));
}
pub const JANET_STACKFRAME_TAILCALL = @as(c_int, 1);
pub const JANET_STACKFRAME_ENTRANCE = @as(c_int, 2);
pub const JANET_FRAME_SIZE = @as(c_int, 4);
pub const JANET_FUNCDEF_FLAG_VARARG = __helpers.promoteIntLiteral(c_int, 0x10000, .hex);
pub const JANET_FUNCDEF_FLAG_NEEDSENV = __helpers.promoteIntLiteral(c_int, 0x20000, .hex);
pub const JANET_FUNCDEF_FLAG_HASSYMBOLMAP = __helpers.promoteIntLiteral(c_int, 0x40000, .hex);
pub const JANET_FUNCDEF_FLAG_HASNAME = __helpers.promoteIntLiteral(c_int, 0x80000, .hex);
pub const JANET_FUNCDEF_FLAG_HASSOURCE = __helpers.promoteIntLiteral(c_int, 0x100000, .hex);
pub const JANET_FUNCDEF_FLAG_HASDEFS = __helpers.promoteIntLiteral(c_int, 0x200000, .hex);
pub const JANET_FUNCDEF_FLAG_HASENVS = __helpers.promoteIntLiteral(c_int, 0x400000, .hex);
pub const JANET_FUNCDEF_FLAG_HASSOURCEMAP = __helpers.promoteIntLiteral(c_int, 0x800000, .hex);
pub const JANET_FUNCDEF_FLAG_STRUCTARG = __helpers.promoteIntLiteral(c_int, 0x1000000, .hex);
pub const JANET_FUNCDEF_FLAG_HASCLOBITSET = __helpers.promoteIntLiteral(c_int, 0x2000000, .hex);
pub const JANET_FUNCDEF_FLAG_NAMEDARGS = __helpers.promoteIntLiteral(c_int, 0x4000000, .hex);
pub const JANET_FUNCDEF_FLAG_TAG = __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex);
pub const JANET_FUNCFLAG_TRACE = @as(c_int, 1) << @as(c_int, 16);
pub const JANET_ATEND_NAME = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_GC;
};
pub const JANET_ATEND_GC = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_GCMARK;
};
pub const JANET_ATEND_GCMARK = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_GET;
};
pub const JANET_ATEND_GET = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_PUT;
};
pub const JANET_ATEND_PUT = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_MARSHAL;
};
pub const JANET_ATEND_MARSHAL = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_UNMARSHAL;
};
pub const JANET_ATEND_UNMARSHAL = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_TOSTRING;
};
pub const JANET_ATEND_TOSTRING = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_COMPARE;
};
pub const JANET_ATEND_COMPARE = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_HASH;
};
pub const JANET_ATEND_HASH = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_NEXT;
};
pub const JANET_ATEND_NEXT = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_CALL;
};
pub const JANET_ATEND_CALL = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_LENGTH;
};
pub const JANET_ATEND_LENGTH = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_BYTES;
};
pub const JANET_ATEND_BYTES = blk: {
    _ = &NULL;
    break :blk JANET_ATEND_GCPERTHREAD;
};
pub const JANET_ATEND_GCPERTHREAD = "";
pub const JANET_EV_TCTAG_NIL = @as(c_int, 0);
pub const JANET_EV_TCTAG_INTEGER = @as(c_int, 1);
pub const JANET_EV_TCTAG_STRING = @as(c_int, 2);
pub const JANET_EV_TCTAG_STRINGF = @as(c_int, 3);
pub const JANET_EV_TCTAG_KEYWORD = @as(c_int, 4);
pub const JANET_EV_TCTAG_ERR_STRING = @as(c_int, 5);
pub const JANET_EV_TCTAG_ERR_STRINGF = @as(c_int, 6);
pub const JANET_EV_TCTAG_ERR_KEYWORD = @as(c_int, 7);
pub const JANET_EV_TCTAG_BOOLEAN = @as(c_int, 8);
pub const JANET_ASSEMBLE_FLAG_OPTIMIZE = @as(c_int, 1);
pub const JANET_DO_ERROR_RUNTIME = @as(c_int, 0x01);
pub const JANET_DO_ERROR_COMPILE = @as(c_int, 0x02);
pub const JANET_DO_ERROR_PARSE = @as(c_int, 0x04);
pub const JANET_BUFFER_FLAG_NO_REALLOC = __helpers.promoteIntLiteral(c_int, 0x10000, .hex);
pub const JANET_TUPLE_FLAG_BRACKETCTOR = __helpers.promoteIntLiteral(c_int, 0x10000, .hex);
pub const janet_tuple_from_head = @compileError("unable to translate macro: undefined identifier `data`");
// janet.h:1873:9
pub inline fn janet_tuple_length(t: anytype) @TypeOf(janet_tuple_head(t).*.length) {
    _ = &t;
    return janet_tuple_head(t).*.length;
}
pub inline fn janet_tuple_hash(t: anytype) @TypeOf(janet_tuple_head(t).*.hash) {
    _ = &t;
    return janet_tuple_head(t).*.hash;
}
pub inline fn janet_tuple_sm_line(t: anytype) @TypeOf(janet_tuple_head(t).*.sm_line) {
    _ = &t;
    return janet_tuple_head(t).*.sm_line;
}
pub inline fn janet_tuple_sm_column(t: anytype) @TypeOf(janet_tuple_head(t).*.sm_column) {
    _ = &t;
    return janet_tuple_head(t).*.sm_column;
}
pub inline fn janet_tuple_flag(t: anytype) @TypeOf(janet_tuple_head(t).*.gc.flags) {
    _ = &t;
    return janet_tuple_head(t).*.gc.flags;
}
pub inline fn janet_string_length(s: anytype) @TypeOf(janet_string_head(s).*.length) {
    _ = &s;
    return janet_string_head(s).*.length;
}
pub inline fn janet_string_hash(s: anytype) @TypeOf(janet_string_head(s).*.hash) {
    _ = &s;
    return janet_string_head(s).*.hash;
}
pub inline fn janet_cstringv(cstr: anytype) @TypeOf(janet_wrap_string(janet_cstring(cstr))) {
    _ = &cstr;
    return janet_wrap_string(janet_cstring(cstr));
}
pub inline fn janet_stringv(str: anytype, len: anytype) @TypeOf(janet_wrap_string(janet_string(str, len))) {
    _ = &str;
    _ = &len;
    return janet_wrap_string(janet_string(str, len));
}
pub inline fn janet_symbolv(str: anytype, len: anytype) @TypeOf(janet_wrap_symbol(janet_symbol(str, len))) {
    _ = &str;
    _ = &len;
    return janet_wrap_symbol(janet_symbol(str, len));
}
pub inline fn janet_csymbolv(cstr: anytype) @TypeOf(janet_wrap_symbol(janet_csymbol(cstr))) {
    _ = &cstr;
    return janet_wrap_symbol(janet_csymbol(cstr));
}
pub const janet_keyword = janet_symbol;
pub const janet_ckeyword = janet_csymbol;
pub inline fn janet_keywordv(str: anytype, len: anytype) @TypeOf(janet_wrap_keyword(janet_keyword(str, len))) {
    _ = &str;
    _ = &len;
    return janet_wrap_keyword(janet_keyword(str, len));
}
pub inline fn janet_ckeywordv(cstr: anytype) @TypeOf(janet_wrap_keyword(janet_ckeyword(cstr))) {
    _ = &cstr;
    return janet_wrap_keyword(janet_ckeyword(cstr));
}
pub const janet_struct_from_head = @compileError("unable to translate macro: undefined identifier `gcobject`");
// janet.h:1919:9
pub inline fn janet_struct_length(t: anytype) @TypeOf(janet_struct_head(t).*.length) {
    _ = &t;
    return janet_struct_head(t).*.length;
}
pub inline fn janet_struct_capacity(t: anytype) @TypeOf(janet_struct_head(t).*.capacity) {
    _ = &t;
    return janet_struct_head(t).*.capacity;
}
pub inline fn janet_struct_hash(t: anytype) @TypeOf(janet_struct_head(t).*.hash) {
    _ = &t;
    return janet_struct_head(t).*.hash;
}
pub inline fn janet_struct_proto(t: anytype) @TypeOf(janet_struct_head(t).*.proto) {
    _ = &t;
    return janet_struct_head(t).*.proto;
}
pub const janet_abstract_from_head = @compileError("unable to translate macro: undefined identifier `data`");
// janet.h:1970:9
pub inline fn janet_abstract_type(u: anytype) @TypeOf(janet_abstract_head(u).*.type) {
    _ = &u;
    return janet_abstract_head(u).*.type;
}
pub inline fn janet_abstract_size(u: anytype) @TypeOf(janet_abstract_head(u).*.size) {
    _ = &u;
    return janet_abstract_head(u).*.size;
}
pub const JANET_MARSHAL_UNSAFE = __helpers.promoteIntLiteral(c_int, 0x20000, .hex);
pub const JANET_MARSHAL_NO_CYCLES = __helpers.promoteIntLiteral(c_int, 0x40000, .hex);
pub const JANET_PRETTY_COLOR = @as(c_int, 1);
pub const JANET_PRETTY_ONELINE = @as(c_int, 2);
pub const JANET_PRETTY_NOTRUNC = @as(c_int, 4);
pub inline fn janet_try(state: anytype) JanetSignal {
    _ = &state;
    return blk_1: {
        _ = janet_try_init(state);
        break :blk_1 __helpers.cast(JanetSignal, setjmp(state.*.buf));
    };
}
pub inline fn janet_flag_at(F: anytype, I: anytype) @TypeOf(F & (@as(c_ulonglong, 1) << I)) {
    _ = &F;
    _ = &I;
    return F & (@as(c_ulonglong, 1) << I);
}
pub const JANET_SANDBOX_SANDBOX = @as(c_int, 1);
pub const JANET_SANDBOX_SUBPROCESS = @as(c_int, 2);
pub const JANET_SANDBOX_NET_CONNECT = @as(c_int, 4);
pub const JANET_SANDBOX_NET_LISTEN = @as(c_int, 8);
pub const JANET_SANDBOX_FFI_DEFINE = @as(c_int, 16);
pub const JANET_SANDBOX_FS_WRITE = @as(c_int, 32);
pub const JANET_SANDBOX_FS_READ = @as(c_int, 64);
pub const JANET_SANDBOX_HRTIME = @as(c_int, 128);
pub const JANET_SANDBOX_ENV = @as(c_int, 256);
pub const JANET_SANDBOX_DYNAMIC_MODULES = @as(c_int, 512);
pub const JANET_SANDBOX_FS_TEMP = @as(c_int, 1024);
pub const JANET_SANDBOX_FFI_USE = @as(c_int, 2048);
pub const JANET_SANDBOX_FFI_JIT = @as(c_int, 4096);
pub const JANET_SANDBOX_SIGNAL = @as(c_int, 8192);
pub const JANET_SANDBOX_CHROOT = @as(c_int, 16384);
pub const JANET_SANDBOX_FFI = (JANET_SANDBOX_FFI_DEFINE | JANET_SANDBOX_FFI_USE) | JANET_SANDBOX_FFI_JIT;
pub const JANET_SANDBOX_FS = (JANET_SANDBOX_FS_WRITE | JANET_SANDBOX_FS_READ) | JANET_SANDBOX_FS_TEMP;
pub const JANET_SANDBOX_NET = JANET_SANDBOX_NET_CONNECT | JANET_SANDBOX_NET_LISTEN;
pub const JANET_SANDBOX_COMPILE = __helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const JANET_SANDBOX_ASM = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const JANET_SANDBOX_THREADS = __helpers.promoteIntLiteral(c_int, 131072, .decimal);
pub const JANET_SANDBOX_UNMARSHAL = __helpers.promoteIntLiteral(c_int, 262144, .decimal);
pub const JANET_SANDBOX_EXIT = __helpers.promoteIntLiteral(c_int, 524288, .decimal);
pub const JANET_SANDBOX_LOCALE = __helpers.promoteIntLiteral(c_int, 1048576, .decimal);
pub const JANET_SANDBOX_ALL = UINT32_MAX;
pub const JANET_CFUNCTION_ALIGN = "";
pub const JANET_CFUN = @compileError("unable to translate macro: undefined identifier `argc`");
// janet.h:2179:9
pub const JANET_REG_END = @compileError("unable to translate C expr: unexpected token '{'");
// janet.h:2182:9
pub const JANET_REG_ = @compileError("unable to translate C expr: unexpected token '{'");
// janet.h:2185:9
pub const JANET_FN_ = @compileError("unable to translate macro: undefined identifier `argc`");
// janet.h:2186:9
pub inline fn JANET_DEF_(ENV: anytype, JNAME: anytype, VAL: anytype, DOC: anytype) @TypeOf(janet_def(ENV, JNAME, VAL, NULL)) {
    _ = &ENV;
    _ = &JNAME;
    _ = &VAL;
    _ = &DOC;
    return janet_def(ENV, JNAME, VAL, NULL);
}
pub const JANET_REG_S = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// janet.h:2192:9
pub const JANET_FN_S = @compileError("unable to translate macro: undefined identifier `_sourceline_`");
// janet.h:2193:9
pub const JANET_DEF_S = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// janet.h:2196:9
pub const JANET_REG_D = @compileError("unable to translate macro: undefined identifier `_docstring_`");
// janet.h:2200:9
pub const JANET_FN_D = @compileError("unable to translate macro: undefined identifier `_docstring_`");
// janet.h:2201:9
pub inline fn JANET_DEF_D(ENV: anytype, JNAME: anytype, VAL: anytype, DOC: anytype) @TypeOf(janet_def(ENV, JNAME, VAL, DOC)) {
    _ = &ENV;
    _ = &JNAME;
    _ = &VAL;
    _ = &DOC;
    return janet_def(ENV, JNAME, VAL, DOC);
}
pub const JANET_REG_SD = @compileError("unable to translate macro: undefined identifier `_docstring_`");
// janet.h:2208:9
pub const JANET_FN_SD = @compileError("unable to translate macro: undefined identifier `_sourceline_`");
// janet.h:2209:9
pub const JANET_DEF_SD = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// janet.h:2213:9
pub const JANET_REG = JANET_REG_SD;
pub const JANET_FN = JANET_FN_SD;
pub const JANET_DEF = JANET_DEF_SD;
pub const JANET_MODULE_PREFIX = "";
pub const JANET_MODULE_ENTRY = @compileError("unable to translate macro: undefined identifier `_janet_mod_config`");
// janet.h:2251:9
pub const janet_printf = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// janet.h:2266:9
pub const janet_eprintf = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// janet.h:2267:9
pub const JANET_FILE_WRITE = @as(c_int, 1);
pub const JANET_FILE_READ = @as(c_int, 2);
pub const JANET_FILE_APPEND = @as(c_int, 4);
pub const JANET_FILE_UPDATE = @as(c_int, 8);
pub const JANET_FILE_NOT_CLOSEABLE = @as(c_int, 16);
pub const JANET_FILE_CLOSED = @as(c_int, 32);
pub const JANET_FILE_BINARY = @as(c_int, 64);
pub const JANET_FILE_SERIALIZABLE = @as(c_int, 128);
pub const JANET_FILE_NONIL = @as(c_int, 512);
pub const threadlocaleinfostruct = struct_threadlocaleinfostruct;
pub const threadmbcinfostruct = struct_threadmbcinfostruct;
pub const __lc_time_data = struct___lc_time_data;
pub const localeinfo_struct = struct_localeinfo_struct;
pub const tagLC_ID = struct_tagLC_ID;
pub const _div_t = struct__div_t;
pub const _ldiv_t = struct__ldiv_t;
pub const _heapinfo = struct__heapinfo;
pub const _SETJMP_FLOAT128 = struct__SETJMP_FLOAT128;
pub const _iobuf = struct__iobuf;
pub const _exception = struct__exception;
pub const _complex = struct__complex;
pub const JanetParserStatus = enum_JanetParserStatus;
pub const JanetOpArgType = enum_JanetOpArgType;
pub const JanetInstructionType = enum_JanetInstructionType;
pub const JanetOpCode = enum_JanetOpCode;
pub const JanetAssembleStatus = enum_JanetAssembleStatus;
pub const JanetCompileStatus = enum_JanetCompileStatus;
