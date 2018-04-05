#!/bin/bash
A=Hallo
reset A
echo "reset A: $A"

A=Hallo
A = 0
echo "A = 0: $A"

A=Hallo
unset A
echo "unset A: $A"

A=Hallo
let A =
echo "let A =: $A"

A=Hallo
export A
echo "export A: $A"
