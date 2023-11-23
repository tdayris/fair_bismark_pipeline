rule bismark_mapping:
    input:
        fq_1="tmp/fastp/trimmed/{sample}.1.fastq",
        fq_2="tmp/fastp/trimmed/{sample}.2.fastq",
        genome="reference/{species}.{build}.{release}.{datatype}.fasta",
        bismark_indexes_dir="reference/{species}.{build}.{release}.{datatype}/Bisulfite_Genome",
        genomic_freq="reference/{species}.{build}.{release}.{datatype}/genomic_nucleotide_frequencies.txt",
        unpack(get_bismark_mapping_pair_ended_input),
    output:
        bam=temp("tmp/bismark/alignment_{library}/{species}.{build}.{release}.{datatype}/{sample}.bam"),
        report=temp("tmp/bismark/stats_{library}/{species}.{build}.{release}.{datatype}/{sample}_{library}_report.txt"),
        nucleotide_stats=temp("tmp/bismark/stats_{library}/{species}.{build}.{release}.{datatype}/{sample}.nucleotide_stats.txt"),
    log:
        "logs/bismark/alignment/{species}.{build}.{release}.{datatype}/{sample}_{library}.log"
    benchmark:
        "benchmark/bismark/alignment/{species}.{build}.{release}.{datatype}/{sample}_{library}.tsv"
    params:
        extra=config.get("params", {}).get("bismark", {}).get("alignment", '--nucleotide_coverage'),
        basename='{sample}'
    wrapper:
        f"{snakemake_wrappers_version}/bio/bismark/bismark"


rule bismark_deduplicate:
    input:
        "tmp/bismark/alignment_{library}/{species}.{build}.{release}.{datatype}/{sample}.bam"
    output:
        bam="results/Mapping/{species}.{build}.{release}.{datatype}/{sample}.bam",
        report=temp("tmp/bismark/stats_{library}/{species}.{build}.{release}.{datatype}/{sample}_{library}.deduplication_report.txt"),
    log:
        "logs/bismark/deduplicate/{species}.{build}.{release}.{datatype}/{sample}_{library}.log"
    benchmark:
        "benchmark/bismark/deduplicate/{species}.{build}.{release}.{datatype}/{sample}_{library}.tsv"
    params:
        extra=config.get("params", {}).get("bismark", {}).get("deduplication", ""),
    wrapper:
        f"{snakemake_wrappers_version}/bio/bismark/deduplicate_bismark"