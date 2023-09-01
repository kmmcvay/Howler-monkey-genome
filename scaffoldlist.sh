#!/bin/bash
#SBATCH --mem=2GB
#SBATCH -p scavenger
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL


/opt/apps/rhel7/bcftools-1.4/bin/bcftools query -f '%CHROM\n' /work/kmm105/mapping/caraya/88_S67-g.vcf.gz | uniq > scaffoldlist_caraya.list

/opt/apps/rhel7/bcftools-1.4/bin/bcftools query -f '%CHROM\n' /work/kmm105/mapping/guariba/12_S12-g.vcf.gz | uniq > scaffoldlist_guariba.list

/opt/apps/rhel7/bcftools-1.4/bin/bcftools query -f '%CHROM\n' /work/kmm105/mapping/seniculus/105_S80-g.vcf.gz | uniq > scaffoldlist_seniculus.list

/opt/apps/rhel7/bcftools-1.4/bin/bcftools query -f '%CHROM\n' /work/kmm105/mapping/belzebuldiscolor/61_S48-g.vcf.gz | uniq > scaffoldlist_belzebuldiscolor.list
