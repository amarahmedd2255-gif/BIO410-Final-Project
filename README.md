# BIO410-Final-Project
## Background
The data consists of 6 samples from the organism Zaire Ebolavirus. This organism is a filovirus, also known as an RNA virus that causes severe and fatal hemorrhagic fevers in humans, along with extremely high mortality rates. This filovirus.... ?
# Purpose 
The purpose of this project was to create a phylogenetic tree from 6 samples of Zaire Ebolavirus in order to determine the evolutionary relationships between the samples 
# Methods 
## Sequencing Reads (NGS) 
In the project, the raw data that we obtained came from next-generation sequencing (NGS) through FASTQ files for each of the six samples. Each one of the samples had two sequencing read files which was why in the terminal we would do sim_t1_1.fq as well as sim_t1_2.fq, which further represtend paired-end reads, and assembled each of the six into contigs.
## Assembly using MEGAHIT: 
Each of the six samples were assembled using MEGAHIT by typing in the code command: megahit -1 sim_t1_1.fq -2 sim_t1_2.fq -o t1_out. This process was repeated for samples t1 through t6 in order to assemble the contigs. Furthermore when going into R Studio, these reads were found in each of their designated folders (ex. t1_out) and the main files that were used in each of the folders was the final.contigs.fa file. The MEGAHIT website that was used was the following: 
## Alignment Using DECIPHER in R Studio 
After the assembly, the final.contigs.fa files of each of the six were uploaded/read into R Studio through using the Biostrings package and the DECIPHER pacakge: allcontigs <- c() for(i in 1:6){contigs <- readDNAStringSet(paste0('~/[/c/Downloadsd/t', i, '_out/final.contigs.fa'))  allcontigs <- c(allcontigs, contigs) }.  The required libraries were loaded into R using the code library(DECIPHER) and library (BioStrings). The contigs were then assembled from each output folder and further aligned with the AlignSeqs function. Only the contigs that were larger than 5,000 bp were selected for the alignment. 
## Phylogenetic Tree Using ML Method in DECIPHER 
After the alignment, a phylogenetic tree was generated in R using the code DECIPHER's Treeline() function. We set the maximumum likelihood using "ML" and we also set the showPlot to True. The tree was then created using the aligned contig sequences using the toalign object and viewed using the BrowseSeqs function. The data corresponds to each of the final.contigs.fa files for the six files. 
