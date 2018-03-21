#!/bin/bash
printf "Bitte geben Sie ja oder nein ein (j/n): "
read antwort
case $antwort in
	[jJ] | ja)
		echo "Sie haben \"ja\" geantwortet."
		;;
	[nN] | nein)
		echo "Das war wohl ein \"nein\"..."
		;;
	*)
		echo "Sie können wohl nicht lesen?"
esac
