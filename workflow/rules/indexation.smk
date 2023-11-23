rule bismark_genome_preparation:
    input:
        "reference/{species}.{build}.{release}.{datatype}.fasta"
    output:
        directory("reference/{species}.{build}.{release}.{datatype}/Bisulfite_Genome")
    log:
        "logs/bismark/genome_preparation/{species}.{build}.{release}.{datatype}.log"
    benchmark:
        "benchmark/bismark/genome_preparation/{species}.{build}.{release}.{datatype}.tsv"
    params:
        config.get("params", {}).get("bismark", {}).get("genome_preparation", ""),
    wrapper:
        f"{snakemake_wrappers_version}/bio/bismark/bismark_genome_preparation"


rule bismark_genomic_nucleotide_frequencies:
    input:
        genome_fa="reference/{species}.{build}.{release}.{datatype}.fasta"
    output:
        "reference/{species}.{build}.{release}.{datatype}/genomic_nucleotide_frequencies.txt"
    cache: True
    log:
        "logs/bismark/genome_preparation/{species}.{build}.{release}.{datatype}.log"
    benchmark:
        "benchmark/bismark/genome_preparation/{species}.{build}.{release}.{datatype}.tsv"
    wrapper:
        f"{snakemake_wrappers_version}//bio/bismark/bam2nuc"