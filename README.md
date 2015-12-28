# Packer Templates

This branch doesn't produce any Vagrant boxes. Instead, its inteded as a starting point. In order to create a new vagrant box, you'll need to create a branch.

	checkout -b os/version/arch

The next step is to modify the build script `build/build.sh` and uncomment the following section:

``` bash
#
# Validate Template
#
if ! packer validate src/template.json; then
	echo "Validation failed!"
	exit 1;
fi

#
# Build Template
#
if ! packer build src/template.json; then
	echo "Build failed!"
	exit 1;
fi
```
You can now modify `src/template.json` to your hearts content.


