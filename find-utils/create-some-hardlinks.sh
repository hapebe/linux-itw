#!/bin/bash
installed=$(dpkg -l | grep hardlink)
if [[ -z $installed ]]; then
	echo "Please install the hardlink package first."
	exit 1
fi

TXT1="This is a unique text."
TXT2="This is a different text."

echo $TXT1 > file1
echo $TXT2 > file2
echo $TXT2 > file2a

mkdir links
cd links

ln -s ../file1 soft
cp ../file1 hard1a
cp ../file1 hard1b
cp ../file2 hard2

cd ..
hardlink -t .
