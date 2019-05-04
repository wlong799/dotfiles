## Useful functions for use in Bash

# Change directory and list contents
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

vman() {
  vim -c "SuperMan $*"
    if [ "$?" != "0" ]; then
      echo "No manual entry for $*"
    fi
}
