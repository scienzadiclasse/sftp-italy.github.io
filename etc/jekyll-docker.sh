#!/bin/bash
#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

which docker || {
	echo "install docker first"
	exit 1
}

imgProvider=jekyll
imgProvider=pbertoni
imgTag=${imgProvider}/jekyll
docker pull ${imgTag}

siteDir=$(realpath ./$(dirname "${BASH_SOURCE[0]}")/..)

set -x
docker run -it --rm -p 4000:4000 -w /work -v ${siteDir}:/work ${imgTag} bash etc/jekyll-booter.sh
{ set +x; } 2> /dev/null
