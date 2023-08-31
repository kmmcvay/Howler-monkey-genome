#!/bin/bash
#SBATCH --mem=32GB
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

cd /work/kmm105/mapping/caraya

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

gatk --java-options "-Xmx24g" GenotypeGVCFs \
        -R /work/kmm105/mapping/reference/A_caraya_F.xuxa_HM.cleaned.fa.gz \
        -V gendb://caraya_genomicsDB \
        -O A_caraya.vcf.gz \
        --tmp-dir /work/kmm105/mapping/caraya/tmp
