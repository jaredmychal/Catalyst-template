options(java.parameters="-Xmx16G")  ## allow JAVA to use large memory space
library(tidyverse)
library(data.table)
library(SingleCellExperiment)
library(iMUBAC)


##########################################################################################################
## Load Data
##########################################################################################################
### Set PrimaryDirectory
getwd()
PrimaryDirectory <- getwd()

### Set 'input' directory
setwd(PrimaryDirectory)
setwd("data/renamed/")
InputDirectory <- getwd()
setwd(PrimaryDirectory)

### Set 'metadata' directory
setwd(PrimaryDirectory)
setwd("metadata/")
MetaDirectory <- getwd()
setwd(PrimaryDirectory)

### Create output directory
dir.create("Output", showWarnings = FALSE)
setwd("Output")
OutputDirectory <- getwd()
setwd(PrimaryDirectory)

### Metadata
setwd(MetaDirectory)
md <- fread("metadata.csv")
md[,batch:=factor(batch, levels=c("Batch1","Batch2","Batch3"))]
md[,group:=factor(group, levels=c("Control","ICU"))]
panel <- fread("Cell_Panel_3.csv")
panel2 <- fread("Cell_Panel_3.csv")
panel3 <- fread("Cell_Panel_3.csv")


pd <- list(panel,panel2,panel3) %>% magrittr::set_names(c("Batch1", "Batch2", "Batch3"))
setwd(PrimaryDirectory)


sce <- iMUBAC::prepSCE(
       md=md,
       pd=pd,
       channel_length=NULL,
       channel_DNA=c("Ir191Di","Ir193Di"),
       channel_LD="Pt195Di",
       type="CyTOF"
   )

colData(sce) <- colData(sce)[c("file_name","panel","batch","sample_id","group")]


##########################################################################################################
## Batch-correction
##########################################################################################################

# Take the subset of data from healthy donors
sce_down <- sce[,sce$"group"=="Control"]

# Batch-correction
sce_down <- iMUBAC::batchCorrection(
        sce_down,
        maxN=50000, ## A maximum of 50000 cells are randomly selected from each batch.
        seed=12345  ## a random seed
)


sce_down <- iMUBAC::runUMAP(
        sce_down,
        by_exprs_values="exprs",
        name="UMAP",
        n_neighbors=25,
        min_dist=0.4,
        scale=T,
        n_threads=12, ## the number of threads for parallel computing
        seed=12345
)

sce_down <- iMUBAC::runUMAP(
        sce_down,
        by_exprs_values="normexprs",
        name="UMAPnorm",
        n_neighbors=25,
        min_dist=0.4,
        scale=T,
        n_threads=12,
        seed=12345
)

plt1 <- ggpubr::ggarrange(
        iMUBAC::plotDR(
                sce_down,
                dimred="UMAP",
                colour_by="batch"
        ) +
                scale_colour_brewer(palette="Dark2"),
        iMUBAC::plotDR(
                sce_down,
                dimred="UMAPnorm",
                colour_by="batch"
        ) +
                scale_colour_brewer(palette="Dark2"),
        ncol=2, nrow=1, common.legend=T, legend="right"
)

plt1


##########################################################################################################
## Unsupervised Clustering
##########################################################################################################

sce_down <- iMUBAC::clustering(
        sce_down,
        features=rownames(sce_down), ## Using all markers for clustering
        by_exprs_values="normexprs",
        method="FlowSOM",
        xdim=20,
        ydim=20,
        maxK=40, ## the number of metaclusters returned
        seed=12345
)


# Median expression heatmap
plt2 <- iMUBAC::plotClusterHeatmap(
        sce_down,
        features=rownames(sce_down),
        clusters=sce_down$"cluster_id",
        by_exprs_values="normexprs",
        fun="median",
        scale=T,
        cluster_rows=T,
        cluster_anno=T,
        draw_dend=T,
        draw_freqs=T
)
plt2

plt3 <- iMUBAC::plotDR(
        sce_down,
        dimred="UMAPnorm",
        colour_by="cluster_id",
        text_by="cluster_id"    ## to overlay cluster ids on each of the clusters
)
plt3

##########################################################################################################
## Batch-specific cluster propagation
##########################################################################################################

sce <- iMUBAC::clusterPropagation(
        sce,           ## the original data containing cells from controls and patients (non-batch-corrected)
        sce_down,      ## down-sampled data containing cells from controls (batch-corrected and clustered)
        by_exprs_values="exprs", ## Non-batch-corrected expression values are used for classifier training.
        maxN=100,
        numThreads=12,  ## the number of threads for parallel computing
        seed=12345
)