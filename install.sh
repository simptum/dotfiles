#!/usr/bin/env bash
#
# install.sh - symlink the dotfiles in dots to $HOME
#
# Usage:
#   cd <repo> && ./install [-v|--verbose]
#   DEBUG=1 ./install -v     # dry run: prints commands
# 
# ----------------------------------------------------------------------
# Each entry in dots/ maps to a hidden path in $HOME
#   dots/<name>         -> ~/.<name>
#   dots/config/<name>  -> ~/.config/<name>
#   dots/ssh/<name>     -> ~/.ssh/<name>
# Directories under dots/config (nvim) are linked as a whole.
# ~/.config and ~/.ssh themselves stay as real directories
#
# Each entry is identified as one of the following targets:
#   clean - already a symlink to the matching file in this repo; skipped
#   dirty - missing, broken link, linked elswhere, or a regular
#           file/dir; it gets (re)linked
# Dirty targets that exist are first moved to <repo>/backup/<path>
#
# ----------------------------------------------------------------------
# Todo:
# - Handle nested files in dots/config/<dir> that need to be symlinked
#   eg: dots/config/k9s/config.yaml
#     - This is from apps that write their own state and runtime into 
#       that dir which becomes untracked in the repo
#
# - Change find command in check_dots() to systematically exclude the 
#   base dirname of dirs in dots/
#   eg: dots/ssh, dots/config, dots/<dir>
#     - I don't want to update the command for every new directory
#       placed in dots/
#
# - Detect if script is being ran with --desktop, for GUI based configs
#   eg: terminiator, hyprland, waybar ...
#
# - Run the bin/<script>.sh from here


clean_dots=()
dirty_dots=()
backup_dots=()

# Get and record repo location on disk
SCRIPT_DIR="$PWD"
if [[ ! -e "$SCRIPT_DIR"/bin/bootstrap.sh ]]; then
    cat <<- "EOF" >&2
	Please `cd` into the dotfiles repository before running this script.
	EOF
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        #--desktop) 
            #echo do-something
            #shift
            #exit
            #;;
        #--minimal) 
            #echo do-something
            #shift
            #exit
            #;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            echo "Unknown flag: $1" >&2
            exit 1
            ;;
    esac
done

# set by exporting DEBUG=1 in shell
d() {
    local prefix="would:"
    local arg

    if [[ $DEBUG ]]; then
        printf '%s' "$prefix"
        for arg in "$@"; do
            if [[ $arg  =~ [[:space:]] ]];then
                printf ' "%s"' "$arg"
            else
                printf ' %s' "$arg"
            fi
        done
        printf '\n'
    else
        "$@"
    fi
}

v() {
    if [[ $VERBOSE ]]; then
        "$@"
    else
        :
    fi
}

prep_dirs() {
    d mkdir -p backup/config
    d mkdir -p backup/ssh
    d mkdir -p "$HOME"/.config
    d mkdir -p -m 700 "$HOME"/.ssh
}

check_dots() {
    local sanitized_dot
    local dot
    local target
    local expected_path

    # Process .* and .config/*, but not .config/ from dots
    while IFS= read -r -d '' dot; do
        # remove leading dots directory
        sanitized_dot=${dot#dots/}
        target="$HOME/.$sanitized_dot"
        expected_path="$(realpath "$SCRIPT_DIR"/"$dot")"

        # Handle different file states
        # Check if symlink
        if [[ -L $target ]]; then
            # Check if symlink has the correct path
            if [[ $(realpath -m "$target") == "$expected_path" ]]; then
                v echo "$target is correctly set."
                clean_dots+=(."$sanitized_dot")
            # Check if symlink has a broken link
            elif [[ ! -e $target ]]; then
                v echo "$target has a broken link."
                dirty_dots+=(."$sanitized_dot")
                backup_dots+=(."$sanitized_dot")
            # Check if symlink has an unexpected link
            else
                v echo "$target has an unexpected symlink."
                dirty_dots+=(."$sanitized_dot")
                backup_dots+=(."$sanitized_dot")
            fi
        # Check if the file exists
        elif [[ ! -e $target ]]; then
            v echo "$HOME/.$sanitized_dot does not exist"
            dirty_dots+=(."$sanitized_dot")
        else
            v echo "Found unmanaged file: $target"
            dirty_dots+=(."$sanitized_dot")
            backup_dots+=(."$sanitized_dot")
        fi

    done < <(find dots dots/config dots/ssh -mindepth 1 -maxdepth 1 \
        -not -path "*/config" -not -path "*/ssh" -print0)

    v echo -e "\nThe following files are dirty:"
    v printf "%s\n" "${dirty_dots[@]}"
    v echo
    v echo "The following files are clean:"
    v printf "%s\n" "${clean_dots[@]}"
    v echo
}


perform_backup() {
    local sanitized_dot
    local dot

    for dot in "${backup_dots[@]}"; do
        # remove leading . from (file|dir)
        sanitized_dot=${dot#.}
        
        # Backup the existing dotfiles
        v echo "Moving $dot to backup/"
        if ! d mv "$HOME"/"$dot" backup/"$sanitized_dot"; then
            echo "Failed to move $dot to backup/" >&2
            exit 1
        fi
    done 
}

link_dots() {
    local sanitized_dot
    local from_dot
    local dot

    for dot in "${dirty_dots[@]}"; do
        # remove leading . from (file|dir)
        sanitized_dot=${dot#.}
        from_dot="$SCRIPT_DIR/dots/$sanitized_dot"

        v echo "Linking $from_dot to $HOME/$dot" 
        if ! d ln -sf "$from_dot" "$HOME/$dot"; then
            echo "Failed to link $from_dot" >&2
        fi
    done
}

prep_dirs
check_dots
perform_backup
link_dots
