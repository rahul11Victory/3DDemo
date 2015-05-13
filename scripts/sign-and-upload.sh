{\rtf1\ansi\ansicpg1252\cocoartf1347\cocoasubrtf570
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red121\green49\blue30;\red255\green255\blue255;\red26\green26\blue26;
\red151\green0\blue126;\red232\green41\blue40;\red0\green0\blue153;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl426

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/sh\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
\pard\pardeftab720\sl426
\cf5 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 if\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  [[ \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$TRAVIS_PULL_REQUEST"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  != \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "false"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  ]]; then\
  echo \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "This is a pull request. No deployment will be done."\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
  exit \cf7 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec7 0\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
fi\
\cf5 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 if\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  [[ \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$TRAVIS_BRANCH"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  != \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "master"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  ]]; then\
  echo \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "Testing on a branch other than master. No deployment will be done."\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
  exit \cf7 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec7 0\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
fi\
\
PROVISIONING_PROFILE=\cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
OUTPUTDIR=\cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$PWD/build/Release-iphoneos"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
\
xcrun -log -sdk iphoneos PackageApplication \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$OUTPUTDIR/$APP_NAME.app"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  -o \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$OUTPUTDIR/$APP_NAME.ipa"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  -sign \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$DEVELOPER_NAME"\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4  -embed \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "$PROVISIONING_PROFILE"}