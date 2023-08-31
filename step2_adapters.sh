#!/bin/bash
#SBATCH --mem=1GB
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

cd /work/kmm105/mapping/step2scripts

BAMs=/work/kmm105/mapping/ubam/*.bam
for BAM in $BAMs
do
        name="$(echo ${BAM} | grep -oP '.*(?=_unaligned_read_pairs.bam)' | awk -F'[/]' '{print $6}')"
        echo "working on $name"
        MET="$name"_mark_adapters_metrics.txt
        OUT="$name"_markadapters.bam
        FILE="$name"_runStep2.sh
        echo "#!/bin/bash" >> $FILE
        echo "#SBATCH --mem=5GB" >> $FILE
        echo "#SBATCH -p scavenger" >> $FILE
        echo "cd /work/kmm105/mapping/mark_adapters" >> $FILE
        echo "gatk --java-options "-Xmx4G" MarkIlluminaAdapters \\" >> $FILE
        echo "INPUT=$BAM \\" >> $FILE
        echo "OUTPUT=$OUT \\" >> $FILE
        echo "METRICS=$MET \\" >> $FILE
        echo "TMP_DIR=`pwd`/tmp" >> $FILE
        sbatch $FILE
done
