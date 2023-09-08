#!/bin/bash
#SBATCH --mem=20GB
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

cd /work/kmm105/mapping/reference

REFs=*.fa.gz
for REF in $REFs
do
        gatk CreateSequenceDictionary -R ${REF}
        /opt/apps/rhel7/bwa-0.7.17/bwa index ${REF}
        /opt/apps/rhel7/samtools/bin/samtools faidx ${REF}
done
