
#!/bin/bash
BASEDIR=$(pwd)
randomString=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 8)
bundleId="com.crowdbotics."${randomString}
appId="app_name: 'CrowdBoticsStarter"${randomString}"'"
newSKU="sku: 'cb123${randomString}'"

git clone https://github.com/crowdbotics/ios-scaffold.git
chmod -R 755 ./ios-scaffold
sed -i -e "s/com.crowdbotics.starter/${bundleId}/g" ${BASEDIR}"/ios-scaffold/swift/crowdbotics/crowdbotics.xcodeproj/project.pbxproj"
sed -i -e "s/com.crowdbotics.starter/${bundleId}/g" ${BASEDIR}"/ios-scaffold/swift/crowdbotics/fastlane/Appfile"
sed -i -e "s/app_name: 'CrowdBoticsStarter'/${appId}/g" ${BASEDIR}"/ios-scaffold/swift/crowdbotics/fastlane/Fastfile"
sed -i -e "s/sku: 'cb123'/${newSKU}/g" ${BASEDIR}"/ios-scaffold/swift/crowdbotics/fastlane/Fastfile"
rm -rf ios-scaffold/.git
