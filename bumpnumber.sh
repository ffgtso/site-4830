#!/bin/sh

expr $(cat "$1") + 1 > "$1"
