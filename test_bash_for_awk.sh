#making tsv files

mkdir /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_hq_bins
cd /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_hq_bins
for tsv_name in /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/*.tsv; do
awk '{ if ($13+0>=90.00 && $14+0 <5.00) print $1,$13,$14}' $tsv_name > $(basename $tsv_name).hq_bins.tsv
done


#reading the number of bins 

for tsv_name in /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_hq_bins/*.tsv; do 
echo "Sample $(basename $tsv_name) has $(awk 'END {print NR}' $tsv_name) high quality bins"; 
done


#making tsv files for medium quality bins
mkdir /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_medium_bins
cd /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_medium_bins
for tsv_name in /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/*.tsv; do
awk '{ if ($13+0 >= 50.00 && $13+0 < 90.00 && $14+0 < 10) print $1,$13,$14 }' $tsv_name > $(basename $tsv_name).medium_bins.tsv
done


#reading the number of bins 

for tsv_name in /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_medium_bins/*.tsv; do echo "Sample $(basename $tsv_name) has $(awk 'END {print NR}' $tsv_name) medium quality bins"; done


#now reading the newly made tsv files to find each of the folders and copy the respective bins into new folder 

for file in $(awk '{ print $1 }' /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_hq_bins/*.hq_bins.tsv); do 
	for final_name in $(find /media/biostud/data/Amulya/metabat2 -name $file.fa); do
	cp $final_name /media/biostud/data/Amulya/metabat2/high_quality_bins_all_samples; done
done

