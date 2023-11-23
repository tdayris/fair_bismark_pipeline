Matierial and methods
=====================

Raw fastq files were trimmed using Fastp_ [#fastppaper]_ . Cleaned reads were 
aligned over indexed Ensembl genome with Bismark_ [#bismarkpaper]_, using 
Bowtie2_ [#bowtie2paper]_. Bismark_ was used to perform methylation calling, 
quality controls and per-sample reports. Additional quality controls were done 
using Picard_ [#picardpaper]_. Quality repord produced  during all trimming, 
mapping, and calling steps have been aggregated with  MultiQC_ [#multiqcpaper]_. 
The  whole pipeline was powered by Snakemake_ [#snakemakepaper]_.

This pipeline is freely available on Github_, installation, usage and
resources are described in the Snakemake workflow_

.. [#fastppaper] Chen, Shifu, et al. "fastp: an ultra-fast all-in-one FASTQ preprocessor." Bioinformatics 34.17 (2018): i884-i890.
.. [#bismarkpaper] Krueger, Felix, and Simon R. Andrews. "Bismark: a flexible aligner and methylation caller for Bisulfite-Seq applications." bioinformatics 27.11 (2011): 1571-1572.
.. [#bowtie2paper] Langmead, Ben, and Steven L. Salzberg. "Fast gapped-read alignment with Bowtie 2." Nature methods 9.4 (2012): 357-359.
.. [#picardpaper] McKenna, Aaron, et al. "The Genome Analysis Toolkit: a MapReduce framework for analyzing next-generation DNA sequencing data." Genome research 20.9 (2010): 1297-1303.
.. [#multiqcpaper] Ewels, Philip, et al. "MultiQC: summarize analysis results for multiple tools and samples in a single report." Bioinformatics 32.19 (2016): 3047-3048.
.. [#snakemakepaper] Köster, Johannes, and Sven Rahmann. "Snakemake—a scalable bioinformatics workflow engine." Bioinformatics 28.19 (2012): 2520-2522.

.. _Bismark: https://snakemake-wrappers.readthedocs.io/en/v2.13.0/wrappers/bismark.html
.. _Bowtie2: https://snakemake-wrappers.readthedocs.io/en/v2.13.0/wrappers/bowtie2.html
.. _Fastp: https://snakemake-wrappers.readthedocs.io/en/v2.13.0/wrappers/fastp.html
.. _Picard: https://snakemake-wrappers.readthedocs.io/en/v2.13.0/wrappers/picard/collectmultiplemetrics.html
.. _MultiQC: https://snakemake-wrappers.readthedocs.io/en/v2.13.0/wrappers/multiqc.html
.. _Snakemake: https://snakemake.readthedocs.io
.. _Github: https://github.com/tdayris/fair_bismark_pipeline
.. _workflow: https://snakemake.github.io/snakemake-workflow-catalog?usage=tdayris/fair_bismark_pipeline

:Authors:
    Thibault Dayris

:Version: 2.1.1 of 11/22/2023
