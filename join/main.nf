// Exercise: join() -- matched pairing by key (N,N -> N)
//
// Use case: each sample was sequenced from a different bacterial strain, so
// reads and reference genomes live in two separate channels keyed by sample
// id. join() matches emissions from two channels on a shared key, rather
// than crossing every combination the way combine() does.

process ALIGN {
    input:
    val rec

    output:
    stdout

    script:
    """
    echo "aligned ${rec.reads} for ${rec.id} against ${rec.reference}"
    """
}

workflow {
    reads_ch = channel.of(
        record(id: 'sample_a', reads: 'sample_a_R1.fq.gz'),
        record(id: 'sample_b', reads: 'sample_b_R1.fq.gz'),
        record(id: 'sample_c', reads: 'sample_c_R1.fq.gz'),
    )

    // Deliberately out of order vs. reads_ch -- join() matches on r.id,
    // not on emission position.
    reference_ch = channel.of(
        record(id: 'sample_b', reference: 'pseudomonas_aeruginosa.fasta'),
        record(id: 'sample_a', reference: 'staph_aureus.fasta'),
        record(id: 'sample_c', reference: 'ecoli.fasta'),
    )

    // TODO: Use join() to pair each sample's reads with its matching reference
    // by id, so ALIGN receives exactly one reference per sample -- not the
    // 3x3 cross product combine() would give.
    //
    // join() itself only knows how to match (key, value) tuples, so key each
    // record by r.id before joining, then repackage the joined result back
    // into a single record.

    // Call the new channel align_input_ch




    // Don't alter this
    align_input_ch.view { v -> "[join] $v" }
    align_input_ch.count().view { n -> "[join: count] $n" } 


    // Call the process on your joined channel
    
}
