#!/usr/bin/env sh

make_git_personal() {
    path="."
    if [ "$#" -ne "0" ]; then
        path="$1"
    fi

    git -C "$path" rev-parse
    if [ "$?" -ne "0" ]; then
        echo "Error: invalid git path"
        return 1
    fi
    git -C $path config commit.gpgsign off
    git -C $path config user.name "Reza Alizadeh Majd"
    git -C $path config user.email "r.a.majd@gmail.com"
    echo "DONE"
    return 0
}
