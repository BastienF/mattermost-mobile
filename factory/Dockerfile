FROM gradle:5.0.0-jdk8

USER root

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=28 \
    ANDROID_BUILD_TOOLS_VERSION=27.0.3

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mkdir -p /root/.android/ \
    && touch /root/.android/repositories.cfg

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

# Install Build Essentials

RUN apt-get update && apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# Install Watchman
RUN apt-get install -y autoconf automake build-essential python-dev libtool libssl-dev pkg-config
RUN git clone https://github.com/facebook/watchman.git
RUN cd watchman \
    && git checkout v4.9.0 \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install

# Install react-native-cli tools
RUN npm -g install react-native-cli

RUN apt-get install -y ruby
RUN apt-get install -y ruby`ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]'`-dev
RUN apt-get install -y libz-dev
RUN gem install bundler
