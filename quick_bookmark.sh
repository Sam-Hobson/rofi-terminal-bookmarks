#!/usr/bin/env bash

term=kitty

# CHANGE TO CONTAIN PATH TO bookmarks FILE.
bookmarks="..."

$term $(tail -n 1 $bookmarks) &
