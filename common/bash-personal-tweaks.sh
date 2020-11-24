#!/usr/bin/env sh

make_git_personal() {
    repo_path="."
    if [ "$#" -ne "0" ]; then
        repo_path=="$1"
    fi
    git -C "$repo_path" rev-parse
    if [ "$?" -ne "0" ]; then
        echo "Error: invalid git path"
        return 1
    fi
    git -C $repo_path config commit.gpgsign off
    git -C $repo_path config user.name "Reza Alizadeh Majd"
    git -C $repo_path config user.email "r.a.majd@gmail.com"
    echo "DONE"
    return 0
}
