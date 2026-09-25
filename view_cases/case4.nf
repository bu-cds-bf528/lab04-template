workflow {

    // Case 4: flatMap()
    //
    // TODO: Predict how many lines .view() will print below. Then run
    // this file and check.
    //
    
    // Makes a channel containing two records
    ch_a = channel.of(
        record(id: 'sample_a', reps: ['a_rep1.fq.gz', 'a_rep2.fq.gz', 'a_rep3.fq.gz']),
        record(id: 'sample_b', reps: ['b_rep1.fq.gz', 'b_rep2.fq.gz'])
    )

    //ch_a.flatMap { r -> r.reps.collect { fq -> record(id: r.id, fastq: fq) } }
    // Each r coming in is one sample that has multiple files (r.reps). We want each of those files to become its own separate item in the output channel.

    // Read it in two steps:

    // 1. r.reps.collect { fq -> record(...) } — turn the list of filenames into a list of records. One record per filename (the .fq.gz files).
    // 2. flatMap { ... } — take that list and unpack it, so each record in the list becomes its own separate item in the channel, instead of one sample producing one bundled list.

    // If you used map instead of flatMap, you'd get a channel where each item is a list of records (one list per sample). flatMap unpacks those lists so you get a flat channel of individual records instead.
    ch_b = ch_a.flatMap { r -> r.reps.collect { fq -> record(id: r.id, fastq: fq) } }
    ch_b.view { v -> "[case 4] $v" }

    // TODO: Add one line that calls .count() on ch_b and .view()s it.
    

}
