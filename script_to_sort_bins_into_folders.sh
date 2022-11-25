#script to read the tsv of checkm output and select the best quality bins

#using awk
#adding +0 forces awk to read the column values as a number without changing them

for tsv_name in /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/*.tsv; do
echo "Processing sample $(basename $tsv_name) for high quality bins"
awk '{ if ($13+0>=90.00 && $14+0 <5.00) print $1,$13,$14}' $tsv_name
done

awk '{ if ($13+0 >= 50.00 && $13+0 < 90.00 && $14+0 <= 10) print $1,$13,$14 }' /media/biostud/data/Amulya/checkm_output/metaspades_3a.tsv #this only prints the medium quality bins



#i can use find command also



for tsv_name in /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/*.tsv; do
> echo "these are the high quality bins in sample $(basename $tsv_name) with completeness > 90 and contamination < 5"
> awk '{ if ($13+0>90.00 && $14+0 <5.00) print $1,$13,$14 }' $tsv_name #this only prints the high quality bins
> #adding +0 forces awk to read the column values as a number without changing them
> done

