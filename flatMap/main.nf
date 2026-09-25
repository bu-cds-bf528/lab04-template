#!usr/bin/env nextflow

params.samplesheet = "${projectDir}/samplesheet.csv"

include {FASTQC} from './modules/fastqc'

workflow {


    // TODO: Use map to transform each element produced by .splitCsv to a record
    // matching the requirement for FASTQC

    // Use channel.fromPath, params.samplesheet, .splitCsv and map() 

    // This channel should contain records that have the name, r1, and r2 fields from
    // each row in the samplesheet. This will look very similar to the map() exercise


    
    // TODO: Use flatMap to transform fastqc_input_ch so that it contains 4 separate
    // elements (1 for each FASTQ file)


    // TODO: Call the FASTQC process on your newly created channel

  
    

}
