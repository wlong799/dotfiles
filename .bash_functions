## Useful functions for use in Bash
## Found on https://wiki.archlinux.org/index.php/Bash/Functions

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
