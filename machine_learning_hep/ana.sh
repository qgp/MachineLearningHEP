#!/bin/bash

#SBATCH --output=slurm-%J.out
#SBATCH --error=slurm-%J.out

function die
{
    echo $1
    exit
}

JOBIDX="-0"
[ -n "${SLURM_ARRAY_TASK_ID}" ] && JOBIDX="-${SLURM_ARRAY_TASK_ID}"
export JOBIDX

unset DISPLAY
export MLPBACKEND=pdf
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_D0pp.yml -a MBvspt_ntrkl &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_D0pp.yml -a MBvspt_v0m &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_D0pp.yml -a MBvspt_perc &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_D0pp.yml -a SPDvspt &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_D0pp.yml -a V0mvspt &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_D0pp.yml -a V0mvspt_perc_v0m &

srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_LcpK0spp.yml -a MBvspt_ntrkl &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_LcpK0spp.yml -a MBvspt_v0m &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_LcpK0spp.yml -a MBvspt_perc &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_LcpK0spp.yml -a SPDvspt &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_LcpK0spp.yml -a V0mvspt &
srun python do_entire_analysis.py -r default_ana.yml -d data/database_ml_parameters_LcpK0spp.yml -a V0mvspt_perc_v0m &

wait
