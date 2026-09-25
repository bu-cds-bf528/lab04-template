workflow {

    // Case 7: flatMap()
    //
    // TODO: Predict how many lines .view() will print below. Then run
    // this file and check.
    //
    
    ch_a = channel.of(
        record(id: 'sample_a', reps: ['a_rep1.fq.gz', 'a_rep2.fq.gz']),
        record(id: 'sample_b', reps: []),
        record(id: 'sample_c', reps: ['c_rep1.fq.gz'])
    )
    ch_b = ch_a.flatMap { r -> r.reps.collect { fq -> record(id: r.id, fastq: fq) } }
    ch_b.view { v -> "[case 7] $v" }

    // TODO: Add one line that calls .count() on ch_b and .view()s it.



}
