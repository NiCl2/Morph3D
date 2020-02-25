#!/bin/bash
#SBATCH --mem-per-cpu=4G
#SBATCH --array=0
#SBATCH --partition=c_compute_neuro1
#SBATCH --account=scw1349
#SBATCH --output=OUT/%A_%a-%J.o
#SBATCH --error=ERR/%A_%a-%J.e

echo "**** Job starts ****"
date

module load matlab

data_list=( input/* )

matlab -nosplash -nodesktop -nodisplay -r "morph3D('input/${data_list[$SLURM_ARRAY_TASK_ID]}');"

echo "**** Job ends ****"
date
