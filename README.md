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

### doctest

TODO: write description

### HSpec

TODO: write description
