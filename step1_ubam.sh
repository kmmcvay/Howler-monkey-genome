#!/bin/bash
#SBATCH --mem=1GB
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

cd /work/kmm105/mapping/step1scripts

R1S=/datacommons/goldberg/lab_datasets/howlers/raw-short-read-howler-data-April2021/completed_downloads/fastq/*_R1_001.fastq.gz
for R1 in $R1S
do
        name="$(echo ${R1} | grep -oP '.*(?=_R1_001.fastq.gz)'| awk -F'[/]' '{print $9}')"
        echo "working on $name"
        R2=/datacommons/goldberg/lab_datasets/howlers/raw-short-read-howler-data-April2021/completed_downloads/fastq/"$name"_R2_001.fastq.gz
        FILE="$name"_runStep1.sh
        echo "#!/bin/bash" >> $FILE
        echo "#SBATCH --mem=3GB" >> $FILE
        echo "#SBATCH -p scavenger" >> $FILE
        echo "cd /work/kmm105/mapping/ubam" >> $FILE
        echo "gatk --java-options "-Xmx2g" FastqToSam \\" >> $FILE
        echo "F1=${R1} \\" >> $FILE
        echo "F2=${R2} \\" >> $FILE
        echo "O="${name}"_unaligned_read_pairs.bam \\" >> $FILE
        echo "RG=${name} \\" >> $FILE
        echo "SM=${name} \\" >> $FILE
        echo "TMP_DIR=`pwd`/tmp" >> $FILE
        sbatch $FILE
done
