#!/bin/bash


# Constants variables
REPO=${PWD};

if [ "${PWD##*/}" != "scripts" ]
then
    cd "scripts";
else
    REPO='${PWD}/..'
fi

SCRIPTS=${PWD};


### Local variables
help=false
podname=''
podversion=''
extbkp=''


# Source utilities
source "${SCRIPTS}/helpers.sh"


### Parse arguments
while getopts ":n:v:h" opt; do
    case "${opt}" in
        n)  podname=$OPTARG;;
        b)  podversion=$OPTARG;;
        h)  help=true;;
    esac
done


### Check arguments
if [ "$help" != false ]
then
    etrace "./Scripts/install.sh -n \"MyPodName\" -v \"1.0.0\""
    exit 0
fi

if [ -z "${podname}" ]
then
    ewarn "Please set a pod name with \"-n\" argument"
    exit 1
fi

if [ -z "${podversion}" ]
then
    podversion='1.0.0'
    ewarn "Not pod version specified, the default version is $podversion. For set version use \"-v\" argument"
fi

cd $REPO;
if [ -f "$REPO/$podname.podspec" ]
then
    ewarn "Pod $podname is already install"
    exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]]
then
    extbkp='.bkp'
fi


### Source function
edebug "Installing $podname v$podversion"

###### Podspec
filePodspec="$podname.podspec"
edebug "Prepare podspec file $filePodspec"

mv BasePod.podspec "$filePodspec"
sudo sed -i $extbkp "s/BasePodVersion/$podversion/g" "$REPO/$filePodspec"
sudo sed -i $extbkp "s/BasePod/$podname/g" "$REPO/$filePodspec"

###### Sources
fileSource="Sources/$podname.swift"
edebug "Prepare source file $fileSource"

mv Sources/BasePod.swift "$fileSource"
sudo sed -i $extbkp "s/BasePod/$podname/g" "$REPO/$fileSource"

###### README.md
edebug "Prepare README.md file"

mv README.md "INSTRUCTIONS.md"
mv BasePodREADME.md "README.md"
sudo sed -i $extbkp "s/BasePod/$podname/g" "$REPO/README.md"

###### Demo Podfile
edebug "Prepare demo podfile"

sudo sed -i $extbkp "s/BasePod/$podname/g" "$REPO/Demo/Podfile"

###### Clean backups
edebug "Clean directory"

if [ -f "$REPO/$filePodspec$extbkp" ]
then 
    rm -f "$REPO/$filePodspec$extbkp"
fi

if [ -f "$REPO/$fileSource$extbkp" ]
then 
    rm -f "$REPO/$fileSource$extbkp"
fi

if [ -f "$REPO/README.md$extbkp" ]
then 
    rm -f "$REPO/README.md$extbkp"
fi

if [ -f "$REPO/Demo/Podfile$extbkp" ]
then 
    rm -f "$REPO/Demo/Podfile$extbkp"
fi

###### Install dependencies
edebug "Install dependencies"
cd "$REPO/Demo"
pod install
cd ..

edebug "Install OK"
