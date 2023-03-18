# haskell_x_docker_x_vscode

Build a Haskell development environment with Docker x VSCode.

## Supplemental Environmental Description

- Installed VSCode extensions.  

  https://marketplace.visualstudio.com/items?itemName=haskell.haskell

- Docker images use the LATEST tag.  

  https://hub.docker.com/_/haskell

- Install the doctest package.  

  https://hackage.haskell.org/package/doctest

- GHCup is required for VSCode extensions, so install it.  

  https://www.haskell.org/ghcup/install/

- Installed haskell language server (hls), which seems to be required for VSCode extensions.  

  https://haskell-language-server.readthedocs.io/en/latest/installation.html#visual-studio-code  

  As of 2023/03/18, version 1.9.1.0 was required.  

  ```bash
  ghcup install hls 1.9.1.0
  ```

## Project Creation

There are two types: stack and cabal. cabal was used.[^1]

[^1]: When I use underscores in the project name, project creation passes, but `cabal test` and `cabal run` fail.

```bash
mkdir -p "Directory path for the project"
cd "Directory path for the project"
cabal update
cabal init
```

The selections for cabal init were as follows.

```bash
What does the package build:
   1) Library
 * 2) Executable
   3) Library and Executable
   4) Test suite
Your choice? [default: Executable] 3
Do you wish to overwrite existing files (backups will be created) (y/n)? [default: n] y
Please choose version of the Cabal specification to use:
   1) 1.24  (legacy)
   2) 2.0   (+ support for Backpack, internal sub-libs, '^>=' operator)
   3) 2.2   (+ support for 'common', 'elif', redundant commas, SPDX)
   4) 2.4   (+ support for '**' globbing)
 * 5) 3.0   (+ set notation for ==, common stanzas in ifs, more redundant commas, better pkgconfig-depends)
   6) 3.4   (+ sublibraries in 'mixins', optional 'default-language')
Your choice? [default: 3.0] 
Package name? [default: helloworld] 
Package version? [default: 0.1.0.0] 
Please choose a license:
   1) BSD-2-Clause
   2) BSD-3-Clause
   3) Apache-2.0
   4) MIT
   5) MPL-2.0
   6) ISC
   7) GPL-2.0-only
   8) GPL-3.0-only
   9) LGPL-2.1-only
  10) LGPL-3.0-only
  11) AGPL-3.0-only
  12) GPL-2.0-or-later
  13) GPL-3.0-or-later
  14) LGPL-2.1-or-later
  15) LGPL-3.0-or-later
  16) AGPL-3.0-or-later
  17) Other (specify)
Your choice? 4
Author name? [default: xxxx] 
Maintainer email? [default: xxxx] 
Project homepage URL? [optional] 
Project synopsis? [optional] 
Project category:
   1) Codec
   2) Concurrency
   3) Control
   4) Data
   5) Database
   6) Development
   7) Distribution
   8) Game
   9) Graphics
  10) Language
  11) Math
  12) Network
  13) Sound
  14) System
  15) Testing
  16) Text
  17) Web
  18) Other (specify)
Your choice? [default: (none)] 
Library source directory:
 * 1) src
   2) lib
   3) src-lib
   4) Other (specify)
Your choice? [default: src] 
Choose a language for your library:
 * 1) Haskell2010
   2) Haskell98
   3) GHC2021 (requires at least GHC 9.2)
   4) Other (specify)
Your choice? [default: Haskell2010] 
What is the main module of the executable:
 * 1) Main.hs
   2) Main.lhs
   3) Other (specify)
Your choice? [default: Main.hs] 
Application directory:
 * 1) app
   2) exe
   3) src-exe
   4) Other (specify)
Your choice? [default: app] 
Choose a language for your executable:
 * 1) Haskell2010
   2) Haskell98
   3) GHC2021 (requires at least GHC 9.2)
   4) Other (specify)
Your choice? [default: Haskell2010] 
Should I generate a test suite for the library? [default: y] 
What is the main module of the test suite?:
 * 1) Main.hs
   2) Main.lhs
   3) Other (specify)
Your choice? [default: Main.hs] 
Test directory? [default: test] 
Choose a language for your test suite:
 * 1) Haskell2010
   2) Haskell98
   3) GHC2021 (requires at least GHC 9.2)
   4) Other (specify)
Your choice? [default: Haskell2010] 
Add informative comments to each field in the cabal file. (y/n)? [default: y] 
[Log] Using cabal specification: 3.0
[Log] Creating fresh file LICENSE...
[Log] Creating fresh file CHANGELOG.md...
[Log] Creating fresh directory ./src...
[Log] Creating fresh file src/MyLib.hs...
[Log] Creating fresh directory ./app...
[Log] Creating fresh file app/Main.hs...
[Log] Creating fresh directory ./test...
[Log] Creating fresh file test/Main.hs...
[Log] Creating fresh file helloworld.cabal...
[Warning] No synopsis given. You should edit the .cabal file and add one.
[Info] You may want to edit the .cabal file and add a Description field.
```

## Build and Run

The source code is to output "Hello, Haskell!" to standard output when the project is created with `cabal init`.
You can build and run the project with `cabal run`.

```bash
root@f3d42513a02c:/workspace/projects/helloworld# cabal run
Resolving dependencies...
Build profile: -w ghc-9.4.4 -O1
In order, the following will be built (use -v for more details):
 - helloworld-0.1.0.0 (lib) (first run)
 - helloworld-0.1.0.0 (exe:helloworld) (first run)
Configuring library for helloworld-0.1.0.0..
Preprocessing library for helloworld-0.1.0.0..
Building library for helloworld-0.1.0.0..
[1 of 1] Compiling MyLib            ( src/MyLib.hs, /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/build/MyLib.o, /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/build/MyLib.dyn_o )
Configuring executable 'helloworld' for helloworld-0.1.0.0..
Preprocessing executable 'helloworld' for helloworld-0.1.0.0..
Building executable 'helloworld' for helloworld-0.1.0.0..
[1 of 1] Compiling Main             ( app/Main.hs, /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/x/helloworld/build/helloworld/helloworld-tmp/Main.o )
[2 of 2] Linking /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/x/helloworld/build/helloworld/helloworld
Hello, Haskell!
someFunc
root@f3d42513a02c:/workspace/projects/helloworld# 
```

## Test

Run tests with `cabal test`.

### doctest

1. Add the doctest configuration to the cabal file.  

   ```cabal
   test-suite doctest
       type:                 exitcode-stdio-1.0
       default-language:     Haskell2010
       hs-source-dirs:       test/doctest
       ghc-options:          -Wall
       main-is:              doctest.hs
       build-depends:        base
                           , doctest
   ```

1. Create the source specified in the `main-is` of the cabal file.  

   ```haskell
   module Main where

   import Test.DocTest

   main :: IO ()
   main = doctest ["src/MyLib.hs", "app/Main.hs"]
   ```

1. Write a doctest. The following source is an example of `app/Main.hs`.  
    1. before  

       ```haskell
       main :: IO ()
       main = do
         putStrLn "Hello, Haskell!"
         MyLib.someFunc
       ```

    1. after  

       ```haskell
       -- |
       -- Entry point
       -- >>> main
       -- Hello, Haskell!
       -- someFunc
       main :: IO ()
       main = do
         putStrLn "Hello, Haskell!"
         MyLib.someFunc
       ```

1. Run tests with `cabal test`.  

   ```txt
   root@8c6481710a1b:/workspace/projects/helloworld# cabal test; echo $?
   Build profile: -w ghc-9.4.4 -O1
   In order, the following will be built (use -v for more details):
    - helloworld-0.1.0.0 (test:doctest) (first run)
    - helloworld-0.1.0.0 (test:helloworld-test) (first run)
   Preprocessing test suite 'doctest' for helloworld-0.1.0.0..
   Preprocessing test suite 'helloworld-test' for helloworld-0.1.0.0..
   Building test suite 'helloworld-test' for helloworld-0.1.0.0..
   Building test suite 'doctest' for helloworld-0.1.0.0..
   Running 1 test suites...
   Test suite helloworld-test: RUNNING...
   Test suite helloworld-test: PASS
   Test suite logged to:
   /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/helloworld-test/test/helloworld-0.1.0.0-helloworld-test.log
   1 of 1 test suites (1 of 1 test cases) passed.
   Running 1 test suites...
   Test suite doctest: RUNNING...
   Test suite doctest: PASS
   Test suite logged to:
   /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/doctest/test/helloworld-0.1.0.0-doctest.log
   1 of 1 test suites (1 of 1 test cases) passed.
   0
   root@8c6481710a1b:/workspace/projects/helloworld# 
   ```

The output when there is a NG in the test is as follows.

```txt
root@8c6481710a1b:/workspace/projects/helloworld# cabal test; echo $?
Build profile: -w ghc-9.4.4 -O1
In order, the following will be built (use -v for more details):
 - helloworld-0.1.0.0 (test:doctest) (first run)
 - helloworld-0.1.0.0 (test:helloworld-test) (first run)
Preprocessing test suite 'helloworld-test' for helloworld-0.1.0.0..
Preprocessing test suite 'doctest' for helloworld-0.1.0.0..
Building test suite 'helloworld-test' for helloworld-0.1.0.0..
Building test suite 'doctest' for helloworld-0.1.0.0..
Running 1 test suites...
Test suite helloworld-test: RUNNING...
Test suite helloworld-test: PASS
Test suite logged to:
/workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/helloworld-test/test/helloworld-0.1.0.0-helloworld-test.log
1 of 1 test suites (1 of 1 test cases) passed.
Running 1 test suites...
Test suite doctest: RUNNING...
app/Main.hs:7: failure in expression `main'
expected: Hello, Haskell
          someFunc
 but got: Hello, Haskell!
                        ^
          someFunc

Examples: 2  Tried: 2  Errors: 0  Failures: 1

Test suite doctest: FAIL
Test suite logged to:
/workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/doctest/test/helloworld-0.1.0.0-doctest.log
0 of 1 test suites (0 of 1 test cases) passed.
Error: cabal: Tests failed for test:doctest from helloworld-0.1.0.0.

1
root@8c6481710a1b:/workspace/projects/helloworld# 
```

### HSpec

1. Add HSpec configuration to the cabal file.  

   ```cabal
   test-suite spec
       type:                 exitcode-stdio-1.0
       default-language:     Haskell2010
       hs-source-dirs:       test/hspec
       ghc-options:          -Wall
       main-is:              Spec.hs
       build-depends:        base
                           , hspec >= 1.3
                           , QuickCheck
                           , helloworld
       other-modules:        MyLibSpec
       build-tool-depends:
           , hspec-discover:hspec-discover
   ```

1. Create `test/hspec/Spec.hs` specified as `main-is` in the cabal file.  

   ```haskell
   {-# OPTIONS_GHC -F -pgmF hspec-discover #-}
   ```

1. Write test code in `test/hspec/MyLibSpec.hs`. For testing, I targeted a function that takes two Int arguments and returns the result of adding them together.  

   ```haskell
   module MyLibSpec (spec) where

   import Test.Hspec
   import MyLib

   spec :: Spec
   spec = do
       describe "`addInt` takes two arguments of Int and returns the result of adding them." $ do
           it "When give addInt 1 and 2 then return 3" $
               MyLib.addInt 1 2 `shouldBe` 3
   ```

1. Add the function to be tested in `src/MyLib.hs`.  

   ```haskell
   module MyLib (someFunc, addInt) where

   (省略)

   addInt :: Int -> Int -> Int
   addInt x y = x + y
   ```

1. Run tests with `cabal test`.  

   ```txt
   root@5499af50db5b:/workspace/projects/helloworld# cabal test; echo $?;
   Build profile: -w ghc-9.4.4 -O1
   In order, the following will be built (use -v for more details):
    - helloworld-0.1.0.0 (test:doctest) (first run)
    - helloworld-0.1.0.0 (test:helloworld-test) (first run)
    - helloworld-0.1.0.0 (test:spec) (first run)
   Preprocessing test suite 'spec' for helloworld-0.1.0.0..
   Preprocessing test suite 'doctest' for helloworld-0.1.0.0..
   Preprocessing test suite 'helloworld-test' for helloworld-0.1.0.0..
   Building test suite 'helloworld-test' for helloworld-0.1.0.0..
   Building test suite 'doctest' for helloworld-0.1.0.0..
   Building test suite 'spec' for helloworld-0.1.0.0..
   Running 1 test suites...
   Test suite helloworld-test: RUNNING...
   Test suite helloworld-test: PASS
   Test suite logged to:
   /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/helloworld-test/test/helloworld-0.1.0.0-helloworld-test.log
   1 of 1 test suites (1 of 1 test cases) passed.
   Running 1 test suites...
   Test suite doctest: RUNNING...
   Running 1 test suites...
   Test suite spec: RUNNING...
   Test suite spec: PASS
   Test suite logged to:
   /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/spec/test/helloworld-0.1.0.0-spec.log
   1 of 1 test suites (1 of 1 test cases) passed.
   Test suite doctest: PASS
   Test suite logged to:
   /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/doctest/test/helloworld-0.1.0.0-doctest.log
   1 of 1 test suites (1 of 1 test cases) passed.
   0
   root@5499af50db5b:/workspace/projects/helloworld# 
   ```

The output when there is a NG in the test is as follows.

```txt
root@5499af50db5b:/workspace/projects/helloworld# cabal test; echo $?;
Build profile: -w ghc-9.4.4 -O1
In order, the following will be built (use -v for more details):
 - helloworld-0.1.0.0 (test:doctest) (first run)
 - helloworld-0.1.0.0 (test:helloworld-test) (first run)
 - helloworld-0.1.0.0 (test:spec) (file test/hspec/MyLibSpec.hs changed)
Preprocessing test suite 'doctest' for helloworld-0.1.0.0..
Preprocessing test suite 'helloworld-test' for helloworld-0.1.0.0..
Preprocessing test suite 'spec' for helloworld-0.1.0.0..
Building test suite 'doctest' for helloworld-0.1.0.0..
Building test suite 'helloworld-test' for helloworld-0.1.0.0..
Building test suite 'spec' for helloworld-0.1.0.0..
[1 of 2] Compiling MyLibSpec        ( test/hspec/MyLibSpec.hs, /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/spec/build/spec/spec-tmp/MyLibSpec.o ) [Source file changed]
Running 1 test suites...
Test suite helloworld-test: RUNNING...
[2 of 2] Compiling Main             ( test/hspec/Spec.hs, /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/spec/build/spec/spec-tmp/Main.o ) [MyLibSpec changed]
Test suite helloworld-test: PASS
Test suite logged to:
/workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/helloworld-test/test/helloworld-0.1.0.0-helloworld-test.log
1 of 1 test suites (1 of 1 test cases) passed.
Running 1 test suites...
Test suite doctest: RUNNING...
[3 of 3] Linking /workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/spec/build/spec/spec [Objects changed]
Test suite doctest: PASS
Test suite logged to:
/workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/doctest/test/helloworld-0.1.0.0-doctest.log
1 of 1 test suites (1 of 1 test cases) passed.
Running 1 test suites...
Test suite spec: RUNNING...

MyLib
  `addInt` takes two arguments of Int and returns the result of adding them.
    When give addInt 1 and 2 then return 3 [✘]

Failures:

  test/hspec/MyLibSpec.hs:10:30: 
  1) MyLib, `addInt` takes two arguments of Int and returns the result of adding them., When give addInt 1 and 2 then return 3
       expected: 2
        but got: 3

  To rerun use: --match "/MyLib/`addInt` takes two arguments of Int and returns the result of adding them./When give addInt 1 and 2 then return 3/"

Randomized with seed 1699898266

Finished in 0.0184 seconds
1 example, 1 failure

Test suite spec: FAIL
Test suite logged to:
/workspace/projects/helloworld/dist-newstyle/build/x86_64-linux/ghc-9.4.4/helloworld-0.1.0.0/t/spec/test/helloworld-0.1.0.0-spec.log
0 of 1 test suites (0 of 1 test cases) passed.
Error: cabal: Tests failed for test:spec from helloworld-0.1.0.0.

1
root@5499af50db5b:/workspace/projects/helloworld# 
```
