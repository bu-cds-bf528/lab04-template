#!/usr/bin/env nextflow

nextflow.enable.types = true

process CONCAT {

    conda "envs/pandas_env.yml"

    input:
    all_files: List<Path>

    output:
    Path = file("concat_df.csv")

    script:
    """
    concat_df.py -i ${all_files.join(' ')} -o concat_df.csv
    """


}