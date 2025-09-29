echo -n "Ok to upgrade Buster to Bullseye (y/n)? "
while read -r -n 1 -s answer; do
  if [[ ${answer} = [yYnN] ]]; then
    echo "${answer}"
    if [[ ${answer} = [yY] ]]; then
      break
    else
      errexit "Aborted"
    fi
  fi
done
