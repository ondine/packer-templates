# Packer Templates

Packer is a tool for creating machine and container images for multiple platforms from a single source configuration.

The configuration file used to define what image we want built and how is called a template in Packer terminology. Packer templates are JSON files that configure the various components of Packer in order to create one or more machine images. You can create and modify templates by hand, you can write scripts to dynamically create or modify templates. Templates take commands such as `packer build`, and will run the builds within it, producing machine images. 

This branch doesn't produce any Vagrant boxes. Instead, it's intended as a starting point. 

The goal of this exercise on this branch is to first successfully run a CentOS 7 64-bit Packer Template using Packer on a Mac.

## Prerequistes

- [Install Packer][install]
- [Put Packer in your Path][path]

## Get Started

1. Switch to the 

1. **Create a branch** In order to create a new vagrant box, you'll first need to create a `branch checkout -b os/version/arch` with the OS, Version and Architecture.

		git checkout -b NEED REAL COMMAND HERE
		
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

		$ ./build.sh
		Template validated successfully.
		vmware-iso output will be in this color.

		==> vmware-iso: Downloading or copying ISO
    	vmware-iso: Downloading or copying: http://192.168.1.4/depot/centos/7/CentOS-7-x86_64-Minimal-1511.iso
    	vmware-iso: Error downloading: Get http://192.168.1.4/depot/centos/7/CentOS-7-x86_64-Minimal-1511.iso: dial tcp 192.168.1.4:80: getsockopt: operation timed out
		==> vmware-iso: ISO download failed.
		Build 'vmware-iso' errored: ISO download failed.

		==> Some builds didn't complete successfully and had errors:
		--> vmware-iso: ISO download failed.

		==> Builds finished but no artifacts were created.
		Build failed!

###	 Troubleshooting

If you see a result similar to this, you may be on the **master** branch. This branch does not have any information defined in the `src/template.json` file. Switch to a desired branch and try again.
		
		build.sh: line 58: Validate: command not found
		Error initializing core: 1 error(s) occurred:

		* at least one builder must be defined
		Validation failed!

[install]: https://www.packer.io/intro/getting-started/setup.html
[path]: https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux


