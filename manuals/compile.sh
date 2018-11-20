#!/usr/bin/env bash

cd "${0%/*}"

function compile {
    echo "compiling $1..."
    pdflatex -shell-escape -interaction=batchmode "$1".tex
    pdflatex -shell-escape -interaction=batchmode "$1".tex # run twice to get refs right
    echo "compiled $1"
}

if [[ $1 == "--all" ]]; then
    compile AcoustoOpticModulators
    compile Diffraction
    compile DiffractionGratings
    compile FabryPerotInterferometers
    compile FiberOptics
    compile MichelsonInterferometers
    compile ThickLenses
    compile ThinLenses
else
    compile $1
fi
