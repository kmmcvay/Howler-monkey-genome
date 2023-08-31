#!/bin/bash
#SBATCH --mem=1GB
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

cd /work/kmm105/mapping/step7scripts

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

BAMS=/work/kmm105/mapping/caraya/*dedupRG.bam
for BAM in $BAMS
do 
        ID="$(echo ${BAM} | grep -oP '.*(?=_dedupRG.bam)' | awk -F'[/]' '{print $6}')"
        echo "calling variants for $ID"
        FILE="$ID"_runStep7.sh
        OUT="$ID"-g.vcf.gz
        echo "working on $OUT"
        echo "#!/bin/bash" >> $FILE
        echo "#SBATCH --mem=32GB" >> $FILE
        echo "#SBATCH --mail-type=END" >> $FILE
        echo "#SBATCH --mail-type=FAIL" >> $FILE
        echo "#SBATCH -p scavenger" >> $FILE
        echo "cd /work/kmm105/mapping/caraya" >> $FILE
        echo "gatk --java-options "-Xmx32G" HaplotypeCaller \\" >> $FILE
        echo "-R /work/kmm105/mapping/reference/A_caraya_F.xuxa_HM.cleaned.fa.gz -I $BAM -O $OUT -ERC GVCF" >> $FILE
        sbatch $FILE
done
