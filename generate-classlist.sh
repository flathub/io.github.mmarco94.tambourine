#!/usr/bin/env bash

set -ex

rm -rf classlist-generation
mkdir classlist-generation

# Downloading tambourine
TAMBURINE_ARCHIVE=$(grep -oP 'https://github\.com/MMarco94/tambourine-music-player/releases/download/.*/tambourine-amd64\.tar\.gz' io.github.mmarco94.tambourine.yml)
echo $TAMBURINE_ARCHIVE
curl -L "$TAMBURINE_ARCHIVE" -o "classlist-generation/tambourine.tar.gz"
tar -xzf "classlist-generation/tambourine.tar.gz" -C "classlist-generation"

# Adding required JVM options
echo "java-options=-Xshare:off" >> classlist-generation/tambourine/lib/app/tambourine.cfg
echo "java-options=-XX:DumpLoadedClassList=tambourine.classlist" >> classlist-generation/tambourine/lib/app/tambourine.cfg
echo "Play a song, then close the window"
classlist-generation/tambourine/bin/tambourine
