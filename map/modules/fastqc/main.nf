#!/usr/bin/env nextflow

nextflow.enable.types = true

record FastqRecord {
    name: String
    fastq: Path
}

record FastqcRecord {
    html: Path
    zip: Path
}

process FASTQC {

    conda 'envs/fastqc_env.yml'

    input:
    sample: FastqRecord

    output:
    record(zip: file("*.zip"), html: file("*.html"))

    script:
    """
    fastqc $sample.fastq
    """
}