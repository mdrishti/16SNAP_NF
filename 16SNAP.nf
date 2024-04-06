nextflow.enable.dsl=2

inputFile = "data/bc*/bc*fastq" 

resultsPath = "data/results"




process nanopore {
	publishDir "$resultsPath/$datasetID", mode: 'move', overwrite: true	

	input:
       	tuple val(datasetID), file(datasetFile)

	output:
       	tuple val(datasetID), file("${datasetID}.qcat.fq"), file("${datasetID}.yacrd.fq"), file("${datasetID}.nanofilt.fq"), file("${datasetID}_rel-abundance.tsv")

	script:
	"""
	qcat --detect-middle --trim -f ${datasetFile} -o ${datasetID}.qcat.fq
	
	minimap2 -t 16 -x ava-ont ${datasetID}.qcat.fq ${datasetID}.qcat.fq > ${datasetID}.mapping.paf
	yacrd -i ${datasetID}.mapping.paf -o ${datasetID}.yacrd split -i ${datasetID}.qcat.fq -o ${datasetID}.yacrd.fq

	NanoFilt -q 9 -l 1200 --maxlength 1600 ${datasetID}.yacrd.fq > ${datasetID}.nanofilt.fq

	emu abundance ${datasetID}.nanofilt.fq --db /opt/emu/emu_database --output-basename ${datasetID} --output-dir ./
	"""
}

workflow {
	datasets = Channel
		.fromPath(inputFile)
		.map { file -> tuple(file.baseName, file) }
	nanopore(datasets)
}

