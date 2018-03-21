#!/bin/bash
printf "Bitte geben Sie ja oder nein ein (j/N): "
read antwort

# leere Eingabe? wird mit "<NICHTS>" ersetzt:
if [ -z $antwort ] ; then antwort="<NICHTS>" ; fi

if [[ $antwort = j || $antwort = J ]] ; then
	echo "Sie haben \"ja\" geantwortet."
	exit 0
else
	if [[ "$antwort" = "n" || "$antwort" = "N" ]] ; then
		echo "Das war wohl ein \"nein\"..."
	else
		echo "${antwort}? Sie können wohl nicht lesen!"

	fi
	exit 1
fi
