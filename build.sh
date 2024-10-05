#!/bin/bash
##
## EPITECH PROJECT, 2024
## asm
## File description:
## build
##

VERBOSE=false

function _error()
{
    echo -e "[\e[31mERROR\e[0m]\t$1"
    exit 84
}

function _display()
{
    echo -e "[\e[32m$1\e[0m]\t$2"
}

function _compile() {
    local output="/dev/null"

    [ "$VERBOSE" = true ] && output="/dev/stdout"
    gcc -no-pie tests/test$1.c $2 -o test$1 > "$output" 2>&1 || _error "gcc failed"
    ./test$1 > "$output" || _error "test$1 failed"
    _display "TEST" "$1 passed!"
}

function build_object()
{
    _display "BUILD" "Building $1..."
    nasm -f elf64 $1.asm -o $1.o || _error "nasm failed"
}

for args in "$@"
do
    case $args in
        -v|--verbose)
            VERBOSE=true
            ;;
        -h|--help)
            cat << EOF
Usage:
        $0 builds all the tests
        $0 [-v|--verbose] for verbose compilation output
        $0 [-h|--help] displays this help message
EOF
            exit 0
            ;;
        *)
            _error "Invalid argument: $args\Try $0 --help for more informations"
            ;;
    esac
done

build_object _strlen
build_object _write
build_object _print
build_object _strcmp
build_object _strcat
build_object _strcpy
build_object _atoi
build_object _swap
build_object _evil_str

_compile _strlen _strlen.o
_compile _write _write.o
_compile _print "_strlen.o _write.o _print.o"
_compile _strcmp _strcmp.o
_compile _strcat "_strcat.o _strlen.o"
_compile _strcpy _strcpy.o
_compile _atoi _atoi.o
_compile _swap _swap.o
_compile _evil_str "_evil_str.o _swap.o _strlen.o"

rm *.o && rm test_*
