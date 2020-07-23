#!/bin/sh -l

echo "Downloading VEX SDK"
# Get VEX SDK and put it in ~/sdk
curl -L https://content.vexrobotics.com/vexcode/v5code/VEXcodeProV5_2_0_0_Preview1.dmg -o _vexcode_.dmg
7z x _vexcode_.dmg || :
7z x Payload~ ./VEXcode\ Pro\ V5.app/Contents/Resources/sdk -osdk_temp || :
mkdir ~/sdk
mv sdk_temp/VEXcode\ Pro\ V5.app/Contents/Resources/sdk/* ~/sdk
rm -fR _vex*_ _vex*_.dmg sdk_temp/ Payload~

echo "Building Project"
# Now make the makefile in the set path
if [ "$1" = "."]
then
    make
else
    make --directory=$1
fi