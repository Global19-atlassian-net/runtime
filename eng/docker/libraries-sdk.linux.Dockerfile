# Copies library artifacts into target dotnet sdk image
ARG SDK_BASE_IMAGE=mcr.microsoft.com/dotnet/core/sdk:3.0.100-buster
FROM $SDK_BASE_IMAGE as target

ARG TESTHOST_LOCATION=./artifacts/bin/testhost
ARG TFM=netcoreapp5.0
ARG OS=Linux
ARG ARCH=x64
ARG CONFIGURATION=Release

ARG COREFX_SHARED_FRAMEWORK_NAME=Microsoft.NETCore.App
ARG SOURCE_COREFX_VERSION=5.0.0
ARG TARGET_SHARED_FRAMEWORK=/usr/share/dotnet/shared
ARG TARGET_COREFX_VERSION=3.0.0

COPY $TESTHOST_LOCATION/$TFM-$OS-$CONFIGURATION-$ARCH/shared/$COREFX_SHARED_FRAMEWORK_NAME/$SOURCE_COREFX_VERSION/* \
    $TARGET_SHARED_FRAMEWORK/$COREFX_SHARED_FRAMEWORK_NAME/$TARGET_COREFX_VERSION/
