setTestOpts(only_compiler_types(['ghc']))

test('GenCanDoRep0',    normal, compile, [''])
test('GenCanDoRep1',    normal, compile, [''])
test('GenDerivOutput',  normal, compile, ['-dsuppress-uniques'])

test('GenShouldFail0',  normal, compile_fail, [''])
test('GenCannotDoRep0', normal, compile_fail, [''])
test('GenCannotDoRep1', normal, compile_fail, [''])
test('GenCannotDoRep2', normal, compile_fail, [''])
test('T5884',           normal, compile, [''])
test('GenNewtype',      normal, compile_and_run, [''])

test('GenCanDoRep1_0',    normal, compile, [''])
test('GenDerivOutput1_0',  normal, compile, ['-dsuppress-uniques'])
test('GenDerivOutput1_1',  normal, compile, ['-dsuppress-uniques'])

test('GenShouldFail1_0',  normal, compile_fail, [''])
test('GenCannotDoRep1_0', normal, compile_fail, [''])
test('GenCannotDoRep1_1', normal, compile_fail, [''])
test('GenCannotDoRep1_2', normal, compile_fail, [''])
test('GenCannotDoRep1_3', normal, compile_fail, [''])
test('GenCannotDoRep1_4', normal, compile_fail, [''])
test('GenCannotDoRep1_5', normal, compile_fail, [''])
test('GenCannotDoRep1_6', normal, compile_fail, [''])
test('GenCannotDoRep1_7', normal, compile_fail, [''])
test('GenCannotDoRep1_8', normal, compile_fail, [''])

test('T7878', extra_clean(['T7878A.o'     ,'T7878A.hi'
                          ,'T7878A.o-boot','T7878A.hi-boot'
                          ,'T7878B.o'     ,'T7878B.hi']), 
              multimod_compile, ['T7878', '-v0'])
