#!/bin/bash

for h in {blind,hadd,hff,hmax}; do
    echo astar: $h
    ./src/pyperplan.py -H $h -s astar domain.pddl problem.pddl | grep expanded
done
echo bfs
./src/pyperplan.py -s bfs domain.pddl problem.pddl | grep expanded
echo ids
./src/pyperplan.py -s ids domain.pddl problem.pddl | grep expanded
