#!/bin/bash
#SBATCH --mem=32GB
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

cd /work/kmm105/mapping/caraya

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

gatk --java-options "-Xmx24g" SelectVariants \
        -R /work/kmm105/mapping/reference/A_caraya_F.xuxa_HM.cleaned.fa.gz \
        -V A_caraya.vcf.gz \
        --select-type-to-include SNP \
        -O A_caraya_snps.vcf.gz

gatk --java-options "-Xmx24g" VariantFiltration \
        -R /work/kmm105/mapping/reference/A_caraya_F.xuxa_HM.cleaned.fa.gz \
        -V A_caraya_snps.vcf.gz \
        -O A_caraya_filteredSNPS.vcf.gz \
        --filter-expression "QD < 2.0 || FS > 60.0 || SOR > 3.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
        --filter-name "hardfilter"

gatk --java-options "-Xmx24g" SelectVariants \
        -V A_caraya_filteredSNPS.vcf.gz \
        --exclude-filtered \
        -O A_caraya_hardfiltered.vcf.gz
