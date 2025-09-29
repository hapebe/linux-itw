#!/bin/bash
variable="  \t   Hello, World!   \r "

echo ... using two chained RegEx-es:
trimmed_variable=$(printf "$variable" | sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*$//g')
printf "$trimmed_variable\n"
printf "$trimmed_variable" | od -t x1
printf "\n"

echo ... using built-in string manipulation, variation 1:
trimmed_variable="${variable#"${variable%%[![:space:]]*}"}"
trimmed_variable="${trimmed_variable%"${trimmed_variable##*[![:space:]]}"}"
printf "${trimmed_variable:-"The string is empty."}\n"
printf "${trimmed_variable:-"The string is empty."}" | od -t x1
printf "\n"

echo ... using built-in string manipulation, variation 2:
s="${variable}"
size_before=${#s}
size_after=0
while [ ${size_before} -ne ${size_after} ]; do
	size_before=${#s}
	s="${s#[$'\r\n\t ']}"
	s="${s%[$'\r\n\t ']}"
	size_after=${#s}
	printf "size_before=${size_before}; size_after=${size_after}\n"
done
trimmed_variable="${s}"
printf "${trimmed_variable:-"The string is empty."}\n"
printf "${trimmed_variable:-"The string is empty."}" | od -t x1
printf "\n"

printf "\n"
printf " -> both built-in methods fail on Fedora 42 Bash?\n"
