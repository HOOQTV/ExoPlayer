#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin

echo "===================================== REMOVE Generated JARs =========================================="
rm -rf ./sources/*.aar

echo "===================================== BEGIN REMOVE PREVIOUS BUILD =========================================="
rm -rf ../library/core/buildout/outputs/aar/library-core-debug.aar
rm -rf ../library/core/buildout/buildout/outputs/aar/library-core-release.aar

rm -rf ../library/dash/buildout/outputs/aar/library-dash-debug.aar
rm -rf ../library/dash/buildout/buildout/outputs/aar/library-dash-release.aar

rm -rf ../library/hls/buildout/outputs/aar/library-hls-debug.aar
rm -rf ../library/hls/buildout/buildout/outputs/aar/library-hls-release.aar

rm -rf ../library/smoothstreaming/buildout/outputs/aar/library-smoothstreaming-debug.aar
rm -rf ../library/smoothstreaming/buildout/buildout/outputs/aar/library-smoothstreaming-release.aar


echo "===================================== BEGIN BUILD CORE =========================================="
cd ..
./gradlew :library-core:clean :library-core:assemble
cp -rf library/core/buildout/outputs/aar/library-core-debug.aar ./tools/sources/library-core-debug.aar
cp -rf library/core/buildout/outputs/aar/library-core-release.aar ./tools/sources/library-core-release.aar


echo "===================================== BEGIN BUILD DASH =========================================="
./gradlew :library-dash:clean :library-dash:assemble
cp -rf library/dash/buildout/outputs/aar/library-dash-debug.aar ./tools/sources/library-dash-debug.aar
cp -rf library/dash/buildout/outputs/aar/library-dash-release.aar ./tools/sources/library-dash-release.aar


echo "===================================== BEGIN BUILD HLS =========================================="
./gradlew :library-hls:clean :library-hls:assemble
cp -rf library/hls/buildout/outputs/aar/library-hls-debug.aar ./tools/sources/library-hls-debug.aar
cp -rf library/hls/buildout/outputs/aar/library-hls-release.aar ./tools/sources/library-hls-release.aar

echo "===================================== BEGIN BUILD SMOOTHSTREAMING =========================================="
./gradlew :library-smoothstreaming:clean :library-smoothstreaming:assemble
cp -rf library/smoothstreaming/buildout/outputs/aar/library-smoothstreaming-debug.aar ./tools/sources/library-smoothstreaming-debug.aar
cp -rf library/smoothstreaming/buildout/outputs/aar/library-smoothstreaming-release.aar ./tools/sources/library-smoothstreaming-release.aar

cd ./tools

./jarextractor.sh