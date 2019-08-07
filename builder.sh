#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin

mkdir ./generated

echo "===================================== REMOVE Generated JARs =========================================="
rm -rf ./generated/*.jar

echo "===================================== BEGIN REMOVE PREVIOUS BUILD =========================================="
rm -rf ./library/core/buildout/intermediates/full_jar/debug/createFullJarDebug/full.jar
rm -rf ./library/core/buildout/intermediates/full_jar/release/createFullJarRelease/full.jar

rm -rf ./library/dash/buildout/intermediates/full_jar/debug/createFullJarDebug/full.jar
rm -rf ./library/dash/buildout/intermediates/full_jar/release/createFullJarRelease/full.jar

rm -rf ./library/hls/buildout/intermediates/full_jar/debug/createFullJarDebug/full.jar
rm -rf ./library/hls/buildout/intermediates/full_jar/release/createFullJarRelease/full.jar

rm -rf ./library/smoothstreaming/buildout/intermediates/full_jar/debug/createFullJarDebug/full.jar
rm -rf ./library/smoothstreaming/buildout/intermediates/full_jar/release/createFullJarRelease/full.jar


echo "===================================== BEGIN BUILD CORE =========================================="
./gradlew :library-core:clean :library-core:test :library-core:createFullJarDebug
cp -rf library/core/buildout/intermediates/intermediate-jars/debug/classes.jar ./generated/library-core-debug.jar

./gradlew :library-core:clean :library-core:test :library-core:createFullJarRelease
cp -rf library/core/buildout/intermediates/intermediate-jars/release/classes.jar ./generated/library-core-release.jar


echo "===================================== BEGIN BUILD DASH =========================================="
./gradlew :library-dash:clean :library-dash:test :library-dash:createFullJarDebug
cp -rf library/dash/buildout/intermediates/intermediate-jars/debug/classes.jar ./generated/library-dash-debug.jar

./gradlew :library-dash:clean :library-dash:test :library-dash:createFullJarDebug
cp -rf library/dash/buildout/intermediates/intermediate-jars/release/classes.jar ./generated/library-dash-release.jar


echo "===================================== BEGIN BUILD HLS =========================================="
./gradlew :library-hls:clean :library-hls:test :library-hls:createFullJarDebug
cp -rf library/hls/buildout/intermediates/intermediate-jars/debug/classes.jar ./generated/library-hls-debug.jar

./gradlew :library-hls:clean :library-hls:test :library-hls:createFullJarDebug
cp -rf library/hls/buildout/intermediates/intermediate-jars/release/classes.jar ./generated/library-hls-release.jar


echo "===================================== BEGIN BUILD SMOOTHSTREAMING =========================================="
./gradlew :library-smoothstreaming:clean :library-smoothstreaming:test :library-smoothstreaming:createFullJarDebug
cp -rf library/smoothstreaming/buildout/intermediates/intermediate-jars/debug/classes.jar ./generated/library-smoothstreaming-debug.jar

./gradlew :library-smoothstreaming:clean :library-smoothstreaming:test :library-smoothstreaming:createFullJarDebug
cp -rf library/smoothstreaming/buildout/intermediates/intermediate-jars/release/classes.jar ./generated/library-smoothstreaming-release.jar
