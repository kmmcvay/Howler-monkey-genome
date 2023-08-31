#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -p scavenger
cd /work/kmm105/mapping

# After running samtools_flagstat.sh and samtools_allsitedepths.sh,
# run this script to collect percent mapping and average depths from all bam files.

OUT2=Summarize_percentmapping_caraya.txt
while read ID;
do
        STAT=/work/kmm105/mapping/mapstat_caraya/"$ID".flagstat
        printf "%s\t%s\t" "$STAT" "$ID"
        echo -n $ID >> $OUT2
        awk -F "[(|%]" 'NR == 5 {print ",",$2}' $STAT >> $OUT2
done < A-caraya-sample-list.txt

OUT=Summarize_avgdepths_caraya.txt
while read ID;
do
        FILE=/work/kmm105/mapping/mapstat_caraya/"$ID".depth
        printf "%s\t%s\t" "$FILE" "$ID"
        echo -n $ID >> $OUT
        #the depth -a flag gives all positions, including those with depth=0
        cat $FILE | awk '{sum+=$3} END { print ",",sum/NR}' >> $OUT
done < A-caraya-sample-list.txt
