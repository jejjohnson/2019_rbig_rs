#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --exclude=nodo17
#SBATCH --workdir=/home/emmanuel/projects/2020_rbig_rs/
#SBATCH --job-name=amip-l-c-era5-tr
#SBATCH --output=/home/emmanuel/projects/2020_rbig_rs/src/experiments/climate/logs/amip/local/compare/amip_l_i_era5_tr_%a.log
#SBATCH --array=0,1,2,3,4,5,6,7

module load Anaconda3
source activate 2019_rbig_ad
# get python path
export PYTHONPATH=/home/emmanuel/projects/2020_rbig_rs/


# Individual
python -u src/experiments/climate/amip_local.py --save v1 --subsample 50_000 --exp compare --base 0 --cmip $SLURM_ARRAY_TASK_ID --trials 20