#! /bin/bash
# script to copy github Personal Access Token to clipboard
# requires xclip to be installed
# Mathijs Afman

cat $HOME/.do-not-move/github/githubPAT.txt | xclip -selection c
