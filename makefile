error = cp ./src/app/errors/ ./bin/lib/app/ -Ru
temp = cp ./src/app/templates/ ./bin/lib/app/ -Ru

build:
	haxe build.hxml
	$(error)
	$(temp)
debug:
	haxe builddebug.hxml
	$(error)
	$(temp)
clean:
	rm ./bin/* -Rf