#!/bin/bash
#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

which docker > /dev/null || {
	echo "install docker first, exiting"
	exit 1
}

siteDir=$(realpath ./$(dirname "${BASH_SOURCE[0]}")/..)

imgProvider=jekyll
imgProvider=pbertoni
imgTag=${imgProvider}/jekyll

docker pull ${imgTag} || {
	pushd ${siteDir}/etc > /dev/null
	make || {
		echo "can't build image, exiting"
		exit 2
	}
	popd > /dev/null
}

set -x
docker run -it --rm -p 4000:4000 -w /work -v ${siteDir}:/work ${imgTag} bash etc/jekyll-booter.sh
{ set +x; } 2> /dev/null
