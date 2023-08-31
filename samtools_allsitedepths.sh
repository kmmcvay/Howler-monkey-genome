#!/bin/bash
#SBATCH --mem=1GB
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger

cd /work/kmm105/mapping/statscripts 

FILES=/work/kmm105/mapping/caraya/*_merged.bam
for FILE in $FILES
do 
        ID="$(echo ${FILE} | grep -oP '.*(?=_merged.bam)' | awk -F'[/]' '{print $6}')"
        OUT="$ID".depth
        SH="$ID"_rundepth.sh
        echo "#!/bin/bash" >> $SH
        echo "#SBATCH --mem=1GB" >> $SH
        echo "#SBATCH -p scavenger" >> $SH
        echo "cd /work/kmm105/mapping/mapstat_caraya" >> $SH
        printf "%s\t%s\t" "$FILE" "$ID"
        #the depth -a flag gives all positions, including those with depth=0
        echo "/opt/apps/rhel7/samtools/bin/samtools depth -a ${FILE} > ${OUT}" >> $SH
        sbatch $SH
done

FILES=/work/kmm105/mapping/guariba/*_merged.bam
for FILE in $FILES
do 
        ID="$(echo ${FILE} | grep -oP '.*(?=_merged.bam)' | awk -F'[/]' '{print $6}')"
        OUT="$ID".depth
        SH="$ID"_rundepth.sh
        echo "#!/bin/bash" >> $SH
        echo "#SBATCH --mem=1GB" >> $SH
        echo "#SBATCH -p scavenger" >> $SH
        echo "cd /work/kmm105/mapping/mapstat_guariba" >> $SH
        printf "%s\t%s\t" "$FILE" "$ID"
        #the depth -a flag gives all positions, including those with depth=0
        echo "/opt/apps/rhel7/samtools/bin/samtools depth -a ${FILE} > ${OUT}" >> $SH
        sbatch $SH
done

FILES=/work/kmm105/mapping/seniculus/*_merged.bam
for FILE in $FILES
do 
        ID="$(echo ${FILE} | grep -oP '.*(?=_merged.bam)' | awk -F'[/]' '{print $6}')"
        OUT="$ID".depth
        SH="$ID"_rundepth.sh
        echo "#!/bin/bash" >> $SH
        echo "#SBATCH --mem=1GB" >> $SH
        echo "#SBATCH -p scavenger" >> $SH
        echo "cd /work/kmm105/mapping/mapstat_seniculus" >> $SH
        printf "%s\t%s\t" "$FILE" "$ID"
        #the depth -a flag gives all positions, including those with depth=0
        echo "/opt/apps/rhel7/samtools/bin/samtools depth -a ${FILE} > ${OUT}" >> $SH
        sbatch $SH
