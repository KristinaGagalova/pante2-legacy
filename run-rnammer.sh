#!/usr/bin/bash

NXF_ANSI_LOG=false nextflow run KristinaGagalova/pante2-legacy -r main \
  -profile singularity,nimbus,c16r64 \
  -resume \
  --rnammer \
  --genomes "test/*.fasta" \
  --outdir "test/results" \
  --dfam_h5 "/path/to/dfam_db/dfam38_full.0.h5.gz" \
  -with-singularity "containers/singularity/pante2-rnammer-legacy.sif"

#------- additional arguments
# repbase database - example below:
# --repbase /path/to/RepBaseRepeatMaskerEdition-20181026.tar.gz
# --rm_meta /path/to/RepeatMaskerMetaData-20181026.tar.gz

# specific database to be used (the species must be present in the h5 repeatmasker db)
# --species "Ascomycota" <- it's present in the partition 0 of the h5 db
# Plase check the info here: https://www.dfam.org/releases/Dfam_3.8/families/FamDB/README.txt
