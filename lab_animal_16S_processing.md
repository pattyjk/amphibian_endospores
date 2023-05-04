## Endospore project, lab animal 16S data processing


```
#load QIIME 2022.8
source activate qiime2-2022.2

#load raw FASTQ reads into QIIME
qiime tools import --type EMPSingleEndSequences --input-path ./raw_data --output-path lab_spore_seqs.qza

#demultiplex reads
qiime demux emp-single \
  --i-seqs lab_spore_seqs.qza \
  --m-barcodes-file endospore_map.txt \
  --m-barcodes-column BarcodeSequence \
  --o-per-sample-sequences lab_spore_demux.qza \
  --o-error-correction-details lab_spore_demux-details.qza \
  --p-no-golay-error-correction
  
#quality filer
qiime quality-filter q-score \
 --i-demux lab_spore_demux.qza \
 --o-filtered-sequences lab_spore_demux-filtered.qza \
 --o-filter-stats lab_spore_demux-filter-stats.qza
 
  #call ASVs with deblur
  qiime deblur denoise-16S \
  --i-demultiplexed-seqs lab_spore_demux-filtered.qza \
  --p-trim-length 120 \
  --o-representative-sequences lab_spore_rep-seqs-deblur.qza \
  --o-table lab_spore_table-deblur.qza \
  --p-sample-stats \
  --o-stats lab_spore_deblur-stats.qza
 
 #make phylogenetic tree with fasttree
 qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences lab_spore_rep-seqs-deblur.qza \
  --output-dir phylogeny-align-to-tree-mafft-fasttree
  
  #export tree as NWK format
  qiime tools export --input-path tree.qza --output-path tree
 
#pull trained taxonomy dataset (SILVA 138. Has only 515F/806R region)
wget https://data.qiime2.org/2022.8/common/silva-138-99-515-806-nb-classifier.qza
 
#assign taxonomy to  SILVA with sklearn
qiime feature-classifier classify-sklearn   --i-classifier silva-138-99-515-806-nb-classifier.qza   --i-reads  lab_spore_rep-seqs-deblur.qza   --o-classification lab_spore_taxonomy.qza


qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy.qzv
 
# convert ASV table to biom/text
 
 ```
