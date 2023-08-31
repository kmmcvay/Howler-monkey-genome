#!/bin/bash
#SBATCH --mem=32GB
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

cd /work/kmm105/mapping/caraya

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

gatk --java-options "-DGATK_STACKTRACE_ON_USER_EXCEPTION=true -Xmx24g -Xms24g" GenomicsDBImport \
        -V 112_S87-g.vcf.gz \
        -V 113_S88-g.vcf.gz \
        -V 57_S44-g.vcf.gz \
        -V 58_S45-g.vcf.gz \
        -V 59_S46-g.vcf.gz \
        -V 78_S62-g.vcf.gz \
        -V 84_S63-g.vcf.gz \
        -V 85_S64-g.vcf.gz \
        -V 86_S65-g.vcf.gz \
        -V 87_S66-g.vcf.gz \
        -V 88_S67-g.vcf.gz \
        -V 89_S68-g.vcf.gz \
        --genomicsdb-workspace-path caraya_genomicsDB \
        -L /work/kmm105/mapping/scaffoldlist_caraya.list \
        --merge-contigs-into-num-partitions 25 \
        --tmp-dir /work/kmm105/mapping/caraya/tmp
