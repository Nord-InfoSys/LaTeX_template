#!/bin/bash

if [ $(uname -s) == "Darwin" ]
then # macOS
	find "$1" -name '*.tex'|perl -pe 's/\.tex$//g'|sort|xargs -I'{}' echo "\\input{{}}"
else # Linux and others
	find "$1" -name '*.tex'|perl -pe 's/\.tex$//g'|sort|xargs -ti echo "\\input{{}}"
fi
