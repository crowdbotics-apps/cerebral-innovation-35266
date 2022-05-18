# slackbotics iOS Swift Guide

A starter XCode workspace with a CocoaPod Podfile - listing the default and user selected pods is hosted here.
This starter workspace has the following
1. A single view controller and a storyboard
2. Storyboard and Code for Left Navigation Menu with basic menu options
3. Left Navigation VC with sample menu options.  Please change this.
4. A PodFile with 2 default pods -   pod 'IQKeyboardManagerSwift', pod 'SideMenu'
    Other pods added via setup will also be here
5. The developer must do a Pod Install.  Pod code is not committed to GitHub.  Feel free to change this behaviour.

# fastlane integration is included
FastLane script file written in Ruby with multiple lanes are included to automate various aspects of time consuming manual labor :
1. Check the file 'Fastfile' under the 'fastlane' folder. This script contains the lanes for various actions.
2. Check the file 'Appfile' under the 'fastlane' folder. This file contains the developer AppleId & App Identifier
3. Provisioning lane will automatically create iOS apps on both the Apple Developer Portal and iTunes Connect. This script will ensure that the app has a valid certificate and its private key on the Apple developer portal and also installs them on the local machine. Also will ensure that a valid provisioning profile is installed locally, that matches the installed certificate. Also this will create app in iTunes connect with basic information.
4. Screenshot lane will automatically generate screenshots of various device sizes. Generally clients prefer UX team to create custom screenshots, so this feature wont be used much. However a basic script is included in the code. Check the file 'Snapfile' under the 'fastlane' folder.
5. Beta lane will be used to automatically increment the build number of the app, compile the app into binaries, create .ipa file for delivery, upload to Testflight
6. Deliver lane is used to upload screenshots, metadata and the IPA file to iTunes Connect.  Developer can directly submit to App store for review too.

Refer the documentation to customzie these scripts to suit your team
https://docs.fastlane.tools/


fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Sit back & Relax!
1. Update the AppFile with your Apple ID and set environment variables to store your password
2. Modify the FastFile script in the 'build_app' lane and ensure they releate to your project
3. Go to Terminal and type 'fastlane just_testflight'
4. Fastlane compiles your code, uploads build to TestFlight !

# Available Actions
### beta
```
fastlane beta
```

### provision
```
fastlane provision
```

### upload
```
fastlane upload
```

### do_everything
```
fastlane do_everything
```

### just_testflight
```
fastlane just_testflight
```



