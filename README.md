# upx-wasm-test

## Update & Support
- No Update
- No Support

## 빌드 방법 (Linux)
1. ./gitclone.sh
2. ./upx/src/main.cpp 파일에서 upx_main 함수 수정 (오버플로 체크등 UPX에 있는 검증기능 사용불가)
```c
int upx_main(int argc, char *argv[]) {
    int i;
    static char default_argv0[] = "upx";
    assert(argc >= 1); // sanity check
    if (!argv[0] || !argv[0][0])
        argv[0] = default_argv0;
    argv0 = argv[0];

    //upx_compiler_sanity_check();//emscripten 빌드 포함 불가
    //int dt_res = upx_doctest_check(argc, argv);//emscripten 빌드 포함 불가
    //if (dt_res != 0) {
    //    if (dt_res == 2)
    //        fprintf(stderr, "%s: doctest requested program exit; Stop.\n", argv0);
    //    else
    //        fprintf(stderr, "%s: internal error: doctest failed\n", argv0);
    //    e_exit(EXIT_INIT);
    //}
```
3. CMakeLists.txt 에서 Release의 -fstack-protector 주석처리(emscripten 빌드 포함 불가)
```cmake
target_compile_options(${t} PRIVATE $<$<CONFIG:Release>:-fstack-protector>)
->
#target_compile_options(${t} PRIVATE $<$<CONFIG:Release>:-fstack-protector>)
```
4. em++ 매개변수 수정
`-O2 -sWASM=1 -sEXPORTED_RUNTIME_METHODS='[\"callMain\", \"FS\"]' -sALLOW_MEMORY_GROWTH=1 -sNO_DISABLE_EXCEPTION_CATCHING`
5. 빌드(SKIP emcmake cmake . : emcmake는 건너뜀)
`emmake make`

## 빌드 결과물
`upx.wasm`, `upx.js`
