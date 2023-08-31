#!/bin/bash
#SBATCH --mem=12GB
#SBATCH -p scavenger
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

cd /work/kmm105/mapping/caraya

export PATH="/hpc/group/goldberg/kmm105/utils/gatk-4.4.0.0/:$PATH"
export JAVA_HOME=/hpc/group/goldberg/kmm105/utils/jdk-17.0.7
export PATH=$JAVA_HOME/bin:$PATH

gatk --java-options "-Xmx8G" MergeSamFiles I=57_S44_L001_AteGeo_piped.bam I=57_S44_L002_AteGeo_piped.bam I=57_S44_L003_AteGeo_piped.bam I=57_S44_L004_AteGeo_piped.bam O=57_S44_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=58_S45_L001_AteGeo_piped.bam I=58_S45_L002_AteGeo_piped.bam I=58_S45_L003_AteGeo_piped.bam I=58_S45_L004_AteGeo_piped.bam O=58_S45_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=59_S46_L001_AteGeo_piped.bam I=59_S46_L002_AteGeo_piped.bam I=59_S46_L003_AteGeo_piped.bam I=59_S46_L004_AteGeo_piped.bam O=59_S46_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=78_S62_L001_AteGeo_piped.bam I=78_S62_L002_AteGeo_piped.bam I=78_S62_L003_AteGeo_piped.bam I=78_S62_L004_AteGeo_piped.bam O=78_S62_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=84_S63_L001_AteGeo_piped.bam I=84_S63_L002_AteGeo_piped.bam I=84_S63_L003_AteGeo_piped.bam I=84_S63_L004_AteGeo_piped.bam O=84_S63_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=85_S64_L001_AteGeo_piped.bam I=85_S64_L002_AteGeo_piped.bam I=85_S64_L003_AteGeo_piped.bam I=85_S64_L004_AteGeo_piped.bam O=85_S64_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=86_S65_L001_AteGeo_piped.bam I=86_S65_L002_AteGeo_piped.bam I=86_S65_L003_AteGeo_piped.bam I=86_S65_L004_AteGeo_piped.bam O=86_S65_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=87_S66_L001_AteGeo_piped.bam I=87_S66_L002_AteGeo_piped.bam I=87_S66_L003_AteGeo_piped.bam I=87_S66_L004_AteGeo_piped.bam O=87_S66_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=88_S67_L001_AteGeo_piped.bam I=88_S67_L002_AteGeo_piped.bam I=88_S67_L003_AteGeo_piped.bam I=88_S67_L004_AteGeo_piped.bam O=88_S67_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=89_S68_L001_AteGeo_piped.bam I=89_S68_L002_AteGeo_piped.bam I=89_S68_L003_AteGeo_piped.bam I=89_S68_L004_AteGeo_piped.bam O=89_S68_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=112_S87_L001_AteGeo_piped.bam I=112_S87_L002_AteGeo_piped.bam I=112_S87_L003_AteGeo_piped.bam I=112_S87_L004_AteGeo_piped.bam O=112_S87_merged.bam
gatk --java-options "-Xmx8G" MergeSamFiles I=113_S88_L001_AteGeo_piped.bam I=113_S88_L002_AteGeo_piped.bam I=113_S88_L003_AteGeo_piped.bam I=113_S88_L004_AteGeo_piped.bam O=113_S88_merged.bam

