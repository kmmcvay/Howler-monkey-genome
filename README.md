# Howler-monkey-genome
Mapping to reference and variant calling for 4 species of howler monkeys - caraya, belzebul, guariba, and seniculus

Mapping = steps 1-6

Variant calling = steps 7-10

Samtools statistics used to assess mapping quality

Sample lists contain sampleIDs associated with each species

Additional supplementary files include scripts for creating scaffold lists and indexing

Versions: gatk 4.4.0.0, Java 17.0.7, BWA 0.7.17

______________________________________________________________________________________________________________________

## Step 1: UBAM

Pairing raw short reads specifying R1 and R2 - unaligned BAM output

Programs included: gatk FastqToSam

## Step 2: Mark Adapters

Marking Illumina adapters for Illumina-generated short reads

Programs included: gatk MarkIlluminaAdapters

## Step 3: BWA-MEM

Mapping unaligned BAM to reference, converting paired read BAM to FASTQ for input into BWAMEM and then merging across runs

Programs included: gatk SamToFastq, BWA mem, gatk MergeBamAlignment

## Step4: Merge BAMs

Merging BAMs from the 4 lanes to create on output BAM file per individual

Programs included: gatk MergeSamFiles

## Step5: Mark Duplicates

Multistep script for sorting BAM output (requirement for next steps), marking duplicate reads, and building a BAM index file

Programs included: gatk SortSam, gatk MarkDuplicates, gatk BuildBamIndex

## Step 6: Rename RG

Renaming read group and other header options in BAM to specify one individual per file and re-index BAM output (requirement for Haplotype Caller)

Programs included: gatk AddorReplaceReadGroups, gatk BuildBamIndex

## Step 7: Haplotype Caller

Initial variant calling per individual (long run step: 5-9 days)

Programs included: gatk HaplotypeCaller

## Step 8: Genomics Database Creation

Input all individuals per species/reference to create database of variants for input into joint genotype calling (longest run step: 7-18+ days depending on number of samples)

Programs included: gatk GenomicsDBImport

## Step 9: Genotype Calling

Joint calls variants for all individuals creating a multi-sample VCF (long run step: 3-5 days)

Programs included: gatk GenotypeGVCFs

## Step 10: Hard Filtering

Multistep script for selecting SNPs, filtering SNPs based on standard thresholds, and creating an output VCF that excludes filtered SNPs

Programs included: gatk SelectVariants, gatk VariantFiltration

