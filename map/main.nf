// Exercise: map() -- per-sample transform (1:1)
//
// Use case: normalize a samplesheet into inputs for per-sample FastQC.
// map() is cardinality-preserving, 

params.samplesheet = "${projectDir}/samplesheet.csv"

include { FASTQC } from './modules/fastqc'

workflow {
    // fromPath() + splitCsv() reads the samplesheet as one emission per row
    // each row is created as a linked hashmap, not a record

    // TODO: Use map to transform each element produced by .splitCsv to a record
    // matching the requirement for FASTQC

    // Use channel.fromPath, params.samplesheet, .splitCsv and map()

    

    // TODO: Run Fastqc on the channel you created
    // and save it to a new variable

    

    


}
