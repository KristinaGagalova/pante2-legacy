#!/bin/bash --login

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --partition=long
#SBATCH --time=1-00:00:00
#SBATCH --account=pawsey1142
#SBATCH --mail-type=ALL
#SBATCH --export=NONE

module load nextflow/22.10.0
module load singularity/4.1.0-slurm

# IMPORTANT: singularity cache dir needs to be specified in order to download image when running pante2 default
export NXF_SINGULARITY_CACHEDIR="./work"

NXF_ANSI_LOG=false nextflow run KristinaGagalova/pante2-legacy -r patch-july \
  -profile pawsey_setonix,singularity \
  -resume \
  --genomes "/path/to/*fna" \
  --outdir "results" \
  --pfam /scratch/pawsey1142/kgagalova/HGT/hgt/repeats/src/pfam.stk \
  --repbase /path/to/RepBaseRepeatMaskerEdition-20181026.tar.gz \
  --rm_meta /path/to/RepeatMaskerMetaData-20181026.tar.gz \
  --species "Ascomycota" \
  --rfam_gomapping_url 'https://ftp.ebi.ac.uk/pub/databases/Rfam/CURRENT/rfam2go/rfam2go' \
  --dfam_h5 "/path/to/dfam38_full.0.h5.gz"
