{\rtf1\ansi\ansicpg1252\cocoartf1347\cocoasubrtf570
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red121\green49\blue30;\red255\green255\blue255;\red26\green26\blue26;
\red33\green152\blue210;\red232\green41\blue40;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl426

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/sh\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
security delete-keychain ios-build\cf5 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 .keychain\cf4 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
rm -f \cf6 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec6 "~/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"}