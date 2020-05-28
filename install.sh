#!/bin/bash

FILE=/pleskresfrzf
if [ -d "$FILE" ]; then
      rm -rf pleskresfrzf
fi
git clone https://github.com/TutifrutiDEV/pleskresfrzf.git

cd pleskresfrzf

chmod u+x ./setup.sh && ./setup.sh
