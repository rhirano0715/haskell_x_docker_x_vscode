FROM haskell:latest

WORKDIR /root

RUN apt-get update && \
    apt-get -y install git && \
    apt-get clean

RUN cabal clean && \
    cabal update

RUN cabal install doctest

# When I set "BOOTSTRAP_HASKELL_INSTALL_HLS=1", "haskell language server 1.9.0.0" was installed.
# VS extension haskell requires 1.9.1.0, so install it separately.
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org \
    | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
    BOOTSTRAP_HASKELL_GHC_VERSION=9.4.4 \
    BOOTSTRAP_HASKELL_CABAL_VERSION=3.8.1.0 \
    BOOTSTRAP_HASKELL_ADJUST_BASHRC=P \
    sh

ENV PATH=${PATH}:/root/.ghcup/bin
RUN ghcup install hls 1.9.1.0

WORKDIR /workspace

