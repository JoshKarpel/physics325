#!/usr/bin/env bash

cd "${0%/*}"

function compile {
    pdflatex -shell-escape -interaction=nonstopmode "$1".tex > /dev/null
    pdflatex -shell-escape -interaction=nonstopmode "$1".tex > /dev/null # run twice to get refs right
}

compile AcoustoOpticModulators
compile Diffraction
compile DiffractionGratings
compile FabryPerotInterferometers
compile FiberOptics
compile MichelsonInterferometers
compile ThickLenses
compile ThinLenses

