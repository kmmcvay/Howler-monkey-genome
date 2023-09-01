#!/bin/bash
#SBATCH --mem=10GB
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

cd /work/kmm105/mapping/caraya

BAMs=/work/kmm105/mapping/caraya/*dedup.bam
for BAM in $BAMs
do
        gatk BuildBamIndex -I $BAM
done
