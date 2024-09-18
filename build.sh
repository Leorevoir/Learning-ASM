#!/bin/bash
##
## EPITECH PROJECT, 2024
## asm
## File description:
## build
##

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
    gcc -no-pie tests/test$1.c $2 -o test$1 > /dev/null 2>&1 || _error "gcc failed"
    ./test$1 > /dev/null || _error "test$1 failed"
    _display "TEST" "$1 passed!"
}


function build_object()
{
    _display "BUILD" "Building $1..."
    nasm -f elf64 $1.asm -o $1.o || _error "nasm failed"
}

build_object _strlen
build_object _write
build_object _print
build_object _strcmp
build_object _strcat
build_object _strcpy
build_object _atoi

_compile _strlen _strlen.o
_compile _write _write.o
_compile _print "_strlen.o _write.o _print.o"
_compile _strcmp _strcmp.o
_compile _strcat "_strcat.o _strlen.o"
_compile _strcpy _strcpy.o
_compile _atoi _atoi.o

rm *.o && rm test_*
