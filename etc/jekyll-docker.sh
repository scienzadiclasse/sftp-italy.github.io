#!/bin/bash
#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

which docker > /dev/null || {
	echo "install docker first, exiting"
	exit 1
}

thisDir=$(dirname "${BASH_SOURCE[0]}")
siteDir=$(realpath ./${thisDir}/..)

imgProvider=jekyll
imgProvider=pbertoni
imgTag=${imgProvider}/jekyll

docker pull ${imgTag} || {
	pushd ${thisDir} > /dev/null
	make || {
		echo "can't build image, exiting"
		exit 2
	}
	popd > /dev/null
}

{
	echo "siteDir=${siteDir}"
	echo "imgTag=${imgTag}"
} > "${thisDir}/.env"

set -x
# docker run -it --rm -p 4000:4000 -w /work -v ${siteDir}:/work ${imgTag} bash etc/jekyll-booter.sh
{ set +x; } 2> /dev/null

pushd ${thisDir} > /dev/null
docker compose up
popd > /dev/null
