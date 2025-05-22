#!/bin/bash
#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

function jb_scss_checker() {
	local rv=0
	pushd fontawesome/scss || return 2
	for fn in ./*; do
		# sass --trace --check ${fn} || {
		sass ${fn} || {
			echo "SCSS Syntax Error on ${fn}"
			rv=1
		}
	done
	popd || return 2
	return ${rv}
}


function jb_install() {
	rm -f Gemfile.lock

	gem install bundler -v 2.5.22

	bundle install
}


function jb_boot() {
	bundle exec jekyll serve --host 0.0.0.0 --force_polling --trace
}



set -x

# fails on pbertoni/jekyll !!!
# jb_scss_checker || exit 1

# moved in Dockerfile ! No, it needs a mounted website
jb_install

jb_boot || exit 2
set +x
