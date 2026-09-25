workflow {

    // Case 3: map()
    //
    // TODO: Predict how many lines .view() will print below. Then run
    // this file and check.
    //
    
    ch_a = channel.of('sample_a', 'sample_b', 'sample_c', 'sample_d')
    
    // Applies a function to each element in the channel, in this case,
    // converting each element into a record
    ch_b = ch_a.map { name -> record(id: name, fastq: "${name}.fastq.gz") }

    // TODO: Add one line that calls .count() on ch_b and .view()s it.
    ch_b.view { v -> "[case 3] $v" }
    

}
