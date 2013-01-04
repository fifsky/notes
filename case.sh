#/bin/bash

case $1 in
	"hello")
		echo "this is $1"
	;;
	"")
		echo "must input"
	;;
	*)
		echo "default input"
	;;
esac

