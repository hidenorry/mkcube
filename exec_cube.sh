#!/bin/sh
#PBS -l nodes=equa02:ppn=16
#PBS -j oe
#PBS -l nice=5

inp_home=$PBS_O_WORKDIR

cd $inp_home
./cube.sh

