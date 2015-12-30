# Windows Server 2012 R2 Packer Template

The repository contains the bare minimum to use packer to create a Windows Server 2012 R2 VMware image.  The objective of this template is not to be everything to everyone, but to be used to build other Windows Server 2012 R2 base images, including ones for production, testing and development. Each has their own needs, so this template will do no more.

## Requirements

* Packer
* OS X 10.11.2
* VMware Fusion 8
* HTTP server (storage.local)
* Windows Server 2012 R2 ISO accessible via HTTP server

The storage.local server is an Apache server that listens to port 80 regardless of the `host` header. It contains all the ISO images required by packer. This was done to save internet bandwidth and speed up the process for other developers in the same organization.  
