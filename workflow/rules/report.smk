rule bismark_report:
    input:
        alignment_report="tmp/bismark/stats_{library}/{species}.{build}.{release}.{datatype}/{sample}_{library}_report.txt",
        nucleotide_report="tmp/bismark/stats_{library}/{species}.{build}.{release}.{datatype}/{sample}.nucleotide_stats.txt",
        dedup_report="tmp/bismark/stats_{library}/{species}.{build}.{release}.{datatype}/{sample}_{library}.deduplication_report.txt",
        mbias_report="tmp/bismark/stats/{species}.{build}.{release}.{datatype}/{sample}.M-bias.txt",
        splitting_report="tmp/bismark/stats/{species}.{build}.{release}.{datatype}/{sample}_splitting_report.txt",
    output:
        html="results/Report/{species}.{build}.{release}.{datatype}/{sample}.bismark2report.html",
    log:
        "logs/bismark/report/{species}.{build}.{release}.{datatype}/{sample}.log"
    benchmark:
        "benchmark/bismark/report/{species}.{build}.{release}.{datatype}/{sample}.tsv"
    params:
        skip_optional_reports=True
    wrapper:
        f"{snakemake_wrappers_version}/bio/bismark/bismark2report"