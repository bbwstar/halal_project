#!/bin/bash

# Colours
GR='\033[1;32m'     # Green
YELLOW='\033[1;33m' # Yellow
RED='\033[0;31m'    # Red
NC='\033[0m'        # No Color

RS_MSG="\n\n${GR}RUNNER SCRIPT:${NC}"


printf "${RS_MSG} Installing NPM Packages...\n"
npm install

printf "${RS_MSG} Running Production Build...\n"
npm run prod

printf "${RS_MSG} Clean up Server build directory...\n"
rm -rf ../server/build

printf "${RS_MSG} Copying new build directory to Server...\n"
cp -r build ../server/

cd ../server

printf "${RS_MSG} Starting Server...\n"
npm run watch
