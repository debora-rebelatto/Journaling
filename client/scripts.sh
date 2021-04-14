#!/bin/bash

GREEN=`tput setaf 2`
reset=`tput sgr0`

PS3='Please enter your choice: '
options=(
  "Build Release Apk"
  "Generate MOBX"
  "One time generation Json Serialization"
  "Generate Continuously Json Serialization"
  "Quit"
)

select opt in "${options[@]}"
do
  case $opt in
    "Build Release Apk")
      echo "${GREEN} More info: https://flutter.dev/docs/deployment/android ${reset}"
      echo "${GREEN} Release Apk can be found at ~/build/app/outputs/flutter-apk ${reset}"
      flutter build apk
      echo "Done!"
      break
      ;;
    "Generate MOBX")
      echo "${GREEN}More info: https://pub.dev/packages/mobx ${reset}"
      flutter packages pub run build_runner build
      echo "Done!"
      break
      ;;
    "One time generation Json Serialization")
      echo "${GREEN}More info: https://flutter.dev/docs/development/data-and-backend/json#one-time-code-generation ${reset}"
      flutter pub run build_runner build --delete-conflicting-outputs
      echo "Done!"
      break
      ;;
    "Continuously Json Serialization")
      echo "${GREEN}More info: https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously ${reset}"
      flutter pub run build_runner watch --delete-conflicting-outputs
      ;;
    "Quit")
      break
      ;;
    *) echo "invalid option $REPLY";;
  esac
done