for file in $(awk '{ print $1 }' /media/biostud/data/Amulya/checkm_output/checkm_all_sample_tsv/converted_to_hq_bins/*.hq_bins.tsv); do 
	for final_name in $(find /media/biostud/data/Amulya/metabat2 -name $file.fa); do
	cp $final_name /media/biostud/data/Amulya/metabat2/high_quality_bins_all_samples; done
done
