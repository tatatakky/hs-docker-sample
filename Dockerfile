FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y build-essential \
                       git \
                       wget \
                       dpkg \
                       sudo \
                       vim

# setup ghc and cabal
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:hvr/ghc && \
    apt-get update && \
    apt-get install -y cabal-install \
                       ghc
# install hspec
RUN cabal update && cabal install hspec

COPY . /haskell
WORKDIR /haskell
RUN ghc -o exec src/Main.hs
CMD ["./exec"]
