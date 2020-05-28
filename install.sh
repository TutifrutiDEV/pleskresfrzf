#!/bin/bash

FILE="/pleskresfrzf/pleskcontent/"
if [ -d "$FILE" ]; then
      rm -rf pleskresfrzf/pleskcontent/
fi
git clone https://github.com/TutifrutiDEV/pleskresfrzf.git

cd pleskresfrzf

chmod u+x ./setup.sh && ./setup.sh
