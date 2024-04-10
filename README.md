16SNAP is a pipeline for analyzing low-comlexity microbiota composition. It utilizs 4 softwares:
a) qcat for trimming adapters [1]
b) yacrd for identifying and removing chimeras [2]
c) nanofilt for filtering reads below Phred score 9 [3]
d) emu for classifying long reads to secies/strain level taxa [4]

**Pre-requisites**
1. Install nextflow by following the instructions on this [website](https://nextflow.io/docs/latest/install.html)
2. Install apptainer/singularity by following the insructions on their [website](https://apptainer.org/docs/user/latest/quick_start.html#installation)

**Instructions to run the pipeline**
1. [Download](https://zenodo.org/doi/10.5281/zenodo.10936159) the singularity image containing the Ubuntu 22.04 LTS distro and the 4 softwares (qcat, zacrd, nanofilt, emu).
2. Clone this repository. Place input fastq files in 'data' folder. Place the singularity image in the same folder as your repository.
3. Change the variables 'inputFile' and 'resultsPath' in 16SNAP.nf to the actual path. At the moment, these variables contain the path to an example file and results. 
4. Run the pipeline 
   `nextflow run 16SNAP.nf -c nanoporeNF.config -with-singularity sing_final.sif`

Kindly cite the following article, if you use this pipeline: 

Disha Tandon, Yuan Dong, Siegfried Hapfelmeier. Pipeline for species-resolved full-length 16S rRNA amplicon nanopore sequencing analysis of low-complexity bacterial microbiota. https://doi.org/10.1101/2023.12.05.570138

1. qcat. (2022).
2. Marijon, P., Chikhi, R. & Varré, J.-S. yacrd and fpa: upstream tools for long-read genome assembly. Bioinformatics 36, 3894-386 (2020).
3. De Coster, W., D'Hert, S., Schultz, D. T., Cruts, M. & Van Broeckhoven, C. NanoPack: visualizing and processing long-read sequencing data. Bioinformatics 34, 2666-2669 (2018).
4. Curry, K. D. et al. Emu: species-level microbial community profiling of full-length 16S rRNA Oxford Nanopore sequencing data. Nat Methods 1-9 (2022).





