docker build . -t mattermost-factory:latest

docker run -v $(pwd)/generate.sh:/generate.sh -v $(pwd)/../../mattermost-mobile:/mattermost-mobile -v $(pwd)/gradle.properties:/home/gradle/.gradle/gradle.properties -v $(pwd)/prod_keystore:/prod_keystore -e BUILD_FOR_RELEASE=true -e APP_NAME="slack.moi.ovh" -it mattermost-factory:latest /generate.sh
