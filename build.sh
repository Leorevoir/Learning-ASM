#!/bin/bash

function _error()
{
    echo -e "[\e[31mERROR\e[0m]\t$1"
    exit 84
}

function _display()
{
    echo -e "[\e[32m$1\e[0m]\t$2"
}

function _compile()
{
    gcc tests/test$1.c $2 -o test$1 > /dev/null 2>&1 || _error "gcc failed"
    ./test$1 > /dev/null || _error "test$1 failed"
    _display "TEST" "$1 passed!"
}


function build_test()
{
    _display "BUILD" "Building $1..."
    nasm -f elf64 $1.asm -o $1.o || _error "nasm failed"
}

build_test _strlen
build_test _write
build_test _print

_compile _strlen _strlen.o
_compile _write _write.o
_compile _print "_strlen.o _write.o _print.o"

rm *.o && rm test_*