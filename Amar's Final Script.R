library(Biostrings)
library(DECIPHER)

allcontigs <- c()
for(i in 1:6){
  contigs <- readDNAStringSet(paste0('~/Downloads/amar/t', i, '_out/t', i, 'final.contigs.fa'))
  allcontigs <- c(allcontigs, contigs)
}
# This loop outputs a list, so we flatten the list
allcontigs <- do.call(c, allcontigs)
# There are some small fragments of genomes in the assmebly; we are only going to align the
#biggest parts (aka the ones that are bigger than 5 kbp; the genome itself is around 18 kbp).
toalign <- allcontigs[which(nchar(allcontigs) > 5000)]
names(toalign) <- 1:length(toalign)

a <- AlignSeqs(toalign)
BrowseSeqs(a, htmlFile = 'final_project.html')
tree <- Treeline(a, method = 'ML', showPlot = T)