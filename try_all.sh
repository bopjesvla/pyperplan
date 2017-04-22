#!/bin/bash

for h in {lmcut,blind,landmark,hadd,hff,hmax,hsa}; do
    for s in {astar,wastar,gbf,bfs,ehs,ids}; do
        echo $h
        echo $s
        ./src/pyperplan.py -H $h -s $s domain.pddl problem.pddl | grep expanded
    done
done

