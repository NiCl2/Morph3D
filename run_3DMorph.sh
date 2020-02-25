#!/bin/bash
#SBATCH --mem-per-cpu=4G
#SBATCH --time=0-24:00
#SBATCH --array=0-100
#SBATCH --partition=c_compute_neuro1_long
#SBATCH --job-name=Morph3D
#SBATCH --account=scw1354
#SBATCH --mail-type=END
#SBATCH --mail-user=cliftonne@cardiff.ac.uk
#SBATCH --output=OUT/%A_%a-%J.o
#SBATCH --error=ERR/%A_%a-%J.e

module load matlab

data_list=( /scratch/c.c0808508/morph3D/input/* )

matlab -nosplash -nodesktop -nodisplay -r "morph3D('input/${data_list[$SLURM_ARRAY_TASK_ID]}');"
