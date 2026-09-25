// Exercise: combine() -- parameter cross-product (N x M)
//
// Use case: k-mer spectrum analysis for genome-size/optimal-k estimation.
// Each assembly gets counted at several k sizes -- combine() builds the
// cross product of assemblies x k-values.
//

process KMER_COUNT {
    input:
    tuple val(sample), val(k)

    output:
    tuple val(sample), val(k), stdout

    script:
    """
    echo "counted ${sample} at k=${k}"
    """
}

workflow {
    assemblies_ch = channel.fromList(['staph_aureus', 'pseudomonas_aeruginosa'])
    k_values_ch   = channel.fromList([15, 21, 25, 31])

    // combine(): cross product of every assembly with every k value.
    // 2 assemblies x 4 k-values -> 8 separate emissions.
    // TODO: Use combine to generate the appropriate channel from the assemblies_ch and
    // k_values_ch. Call this new channel, kmer_jobs_ch
    


    // Don't alter these
    kmer_jobs_ch.view { v -> "[combine: NxM] $v" }
    kmer_jobs_ch.count().view { n -> "[combine: count] $n" }  // 8

    kmer_counts_ch = KMER_COUNT(kmer_jobs_ch)
    kmer_counts_ch.view { r -> "[KMER_COUNT output] $r" }
}
