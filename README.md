# Packer Templates

Packer is a tool for creating machine and container images for multiple platforms from a single source configuration.

The configuration file used to define what image we want built and how is called a template in Packer terminology. Packer templates are JSON files that configure the various components of Packer in order to create one or more machine images. You can create and modify templates by hand, you can write scripts to dynamically create or modify templates. Templates take commands such as `packer build`, and will run the builds within it, producing machine images. 

This branch doesn't produce any Vagrant boxes. Instead, it's intended as a starting point. 

The goal of this repo is to successfully create a Windows 2012-R2-Datacenter Template using Packer on a Mac.

## Prerequistes

- [Install Packer][install]
- [Put Packer in your Path][path]

## Get Started

1. Switch to the 

1. **Create a branch** In order to create a new vagrant box, you'll first need to create a `branch checkout -b os/version/arch` with the OS, Version and Architecture.

		checkout -b centos/7/amd64
		
2. There is a build directory `build/build.sh`, containing a build script `build.sh`. Open and uncomment the following section:

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

3. To run your build.sh script on a Mac, 

		./build.sh

4. You may see a result similar to this:

		build.sh: line 58: Validate: command not found
		Error initializing core: 1 error(s) occurred:

		* at least one builder must be defined
		Validation failed!

[install]: https://www.packer.io/intro/getting-started/setup.html
[path]: https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux


