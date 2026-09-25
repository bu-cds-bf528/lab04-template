#!usr/bin/env nextflow

include {CONCAT} from './modules/concat'

workflow {

    // Stand-in, not a real workflow step: fromPath() here fakes the channel
    // a process would produce if it emitted each of these files separately.
    file_ch = channel.fromPath("samples/*")
    
    // TODO: Use collect() to ensure that the CONCAT process operates only
    // once on all the files, rather than once per file. Save this to a new
    // variable

   
    // Call the CONCAT process on the newly transformed channel. 
   


}
