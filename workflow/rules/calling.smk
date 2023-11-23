rule bismark_methylation_extractor_pair_ended:
    input: 
        "results/Mapping/{species}.{build}.{release}.{datatype}/{sample}.bam"
    output:
        mbias_r1="results/Methylation/{species}.{build}.{release}.{datatype}/{sample}.M-bias_R1.png",
        mbias_r2="results/Methylation/{species}.{build}.{release}.{datatype}/{sample}.M-bias_R2.png",
        mbias_report=temp("tmp/bismark/stats/{species}.{build}.{release}.{datatype}/{sample}.M-bias.txt"),
        splitting_report=temp("tmp/bismark/stats/{species}.{build}.{release}.{datatype}/{sample}_splitting_report.txt"),
        methylome_CpG_cov="results/Methylation_Coverage/{species}.{build}.{release}.{datatype}/{sample}.bismark.cov.gz",
        methylome_CpG_mlevel_bedGraph="results/Methylation_Coverage/{species}.{build}.{release}.{datatype}/{sample}.bedGraph.gz",
        read_base_meth_state_cpg="results/Methylation/CpG_context_{sample}.txt.gz",
        read_base_meth_state_chg="results/Methylation/CHG_context_{sample}.txt.gz",
        read_base_meth_state_chh="results/Methylation/CHH_context_{sample}.txt.gz"
    log:
        "logs/bismark/methylation_extractor/{species}.{build}.{release}.{datatype}/{sample}.log"
    benchmark:
        "benchmark/bismark/methylation_extractor/{species}.{build}.{release}.{datatype}/{sample}.tsv"
    params:
        extra=config.get("params", {}).get("bismark", {}).get("extractor", "--gzip --comprehensive --bedGraph"),
    wrapper:
        f"{snakemake_wrappers_version}/bio/bismark/bismark_methylation_extractor"