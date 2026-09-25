workflow {

    // Case 8: flatMap(), then map() -- two operators chained
    //
    // TODO: Predict how many lines .view() will print below. Then run
    // this file and check.
    //
    
    ch_a = channel.of(
        record(id: 'sample_a', reps: ['sample_a_rep1.fq.gz', 'sample_a_rep2.fq.gz']),
        record(id: 'sample_b', reps: ['sample_b_rep1.fq.gz']),
        record(id: 'sample_c', reps: ['sample_c_rep1.fq.gz', 'sample_c_rep2.fq.gz', 'sample_c_rep3.fq.gz'])
    )

    ch_b = ch_a.flatMap { r -> r.reps.collect { fq -> record(id: r.id, fastq: fq) } }
    ch_c = ch_b.map { r -> record(id: r.id, fastq: r.fastq, is_gzipped: r.fastq.endsWith('.gz')) }
    ch_c.view { v -> "[case 8] $v" }

    // TODO: Add one line that calls .count() on ch_c and .view()s it.

}
