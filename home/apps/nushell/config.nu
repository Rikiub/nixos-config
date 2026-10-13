$env.config = {
	show_banner: false
	rm: {
		always_trash: true  
	}
}

load-env {
	EDITOR: "fresh"
	PAGER: "bat --paging=always"
	MANPAGER: "bat -l man -p"
}

# List the filenames as grid layout.
def lsg [...args] {
	let args = if $args == [] {["."]} else {$args}
	ls ...$args | sort-by type name | grid --icons --color
}

# Run yazi and change pwd on exit.
def --env yazicd [...commands: string] {
	let tempfile = mktemp -t yazi-cwd.XXXXXX
	yazi ...$commands --cwd-file=($tempfile)
	let dir: string = open $tempfile
	
	if $dir != pwd { cd $dir }

	rm -f $tempfile
}
