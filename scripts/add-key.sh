{\rtf1\ansi\ansicpg1252\cocoartf1347\cocoasubrtf570
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red26\green26\blue26;\red255\green255\blue255;\red151\green0\blue126;
\red0\green0\blue153;\red60\green139\blue36;\red232\green41\blue40;}
\margl1440\margr1440\vieww18200\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl426

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/sh\
\
# Create a custom keychain\
security create-keychain -p travis ios-build.keychain\
\
# Make the custom keychain \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 default\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 , so xcodebuild will use it \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 for\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  signing\
security \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 default\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 -keychain -s ios-build.keychain\
\
# Unlock the keychain\
security unlock-keychain -p travis ios-build.keychain\
\
# Set keychain timeout to \cf5 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 1\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  hour \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 for\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  long builds\
# see http:\cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 //www.egeek.me/2013/02/23/jenkins-and-xcode-user-interaction-is-not-allowed/\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 \
security \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 set\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 -keychain-settings -t \cf5 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 3600\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  -l ~/Library/Keychains/ios-build.keychain\
\
# Add certificates to keychain and allow codesign to access them\
security \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 import\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  ./scripts/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign\
security \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 import\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign\
security \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 import\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign\
\
\
# Put the provisioning profile \cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 in\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  place\
mkdir -p ~/Library/MobileDevice/Provisioning\\ Profiles\
cp \cf7 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec7 "./scripts/profile/$PROFILE_NAME.mobileprovision"\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  ~/Library/MobileDevice/Provisioning\\ Profiles/}