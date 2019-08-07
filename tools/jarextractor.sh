SRC=./sources

rm -rf ./outputs
mkdir -p ./outputs

for file in "$SRC"/*.aar
do
	rm -rf ./temp
	mkdir -p ./temp

	FILENAME=$(basename "$file" ".aar")
	/usr/bin/unzip ${SRC}/${FILENAME}.aar -d ./temp

	cp ./temp/classes.jar ./outputs/${FILENAME}.jar
done

