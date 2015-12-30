#!/bin/bash
#
# -----------------------------------------------------------------------------
#
# A simple script to a base image
#
# -----------------------------------------------------------------------------
#
# The MIT License (MIT)
#
# Copyright (c) 2015 Werner Strydom
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# -----------------------------------------------------------------------------


pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

# --- Body --------------------------------------------------------------------

CHECKPOINT_DISABLE=1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DIR/../src"

#
# Remove output folders
#
if [ -d ../dist ]; then
	rm -Rf ../dist
fi
mkdir -p ../dist

#
# Validate Template
#
if ! packer validate template.json; then
	echo "Validation failed!"
	exit 1;
fi

#
# Build Template
#
if ! packer build template.json; then
	echo "Build failed!"
	exit 1;
fi

popd