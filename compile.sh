#!/usr/bin/env bash

PROGRAM=$1

gfortran "$PROGRAM.f90" -o "$PROGRAM.out"
