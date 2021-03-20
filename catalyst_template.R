# load required packages
library(CATALYST)
library(cowplot)
library(flowCore)
library(diffcyt)
library(scater)
library(uwot)
library(SingleCellExperiment)
library(premessa)
library(Spectre)
Spectre::package.check()    # Check that all required packages are installed
Spectre::package.load()     # Load required packages
options(java.parameters="-Xmx16G")  ## allow JAVA to use large memory space

# Load colour palette
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

### Set PrimaryDirectory for working files
setwd("D:/Myeloids")
getwd()
PrimaryDirectory <- getwd()

#Review fcs panel, change any files so that all files have the same names for each marker. Delete ones not shared by all.
#premessa::paneleditor_GUI()

### Set input directory that contains Cytobank .fcs files that have been renamed by premessa
setwd(PrimaryDirectory)
setwd("data/renamed/")
InputDirectory <- getwd()
setwd(PrimaryDirectory)

### Set 'metadata' directory containing metadata spreadsheet and panel sheet
setwd(PrimaryDirectory)
setwd("metadata/")
MetaDirectory <- getwd()
setwd(PrimaryDirectory)

### Create output directory
dir.create("Output", showWarnings = FALSE)
setwd("Output")
OutputDirectory <- getwd()
setwd(PrimaryDirectory)


##########################################################################################################
#### Import and prep data
##########################################################################################################


### Import data

setwd(InputDirectory)
fcs <- list.files(InputDirectory, ".fcs")
fs <- read.flowSet(fcs, transformation = FALSE, truncate_max_range = FALSE)

### Import Metadata
setwd(MetaDirectory)
md <- fread("metadata.csv")

## Import marker Panel Data
panel <- fread("Cell_Panel.csv")

setwd(PrimaryDirectory)

all(panel$fcs_colname %in% colnames(fs)) #check that panel markers match the names in the fcs files
#create a SingleCellExperiment file (sce)
sce <- prepData(fs, panel, md, features = panel$fcs_colname, 
                panel_cols = list(channel = "fcs_colname", antigen = "antigen",
                                  class ="marker_class"),
                md_cols = list(file = "file_name", id = "sample_id", 
                               factors = c("group", "day", "patient_id", 
                                           "abx", "nosocomial", "fungals", 
                                           "mortality", "batch", "SOFA"))) #Load metadata based on column names in the metadata sheet


#save SCE file 
saveRDS(sce, "sce.RDS")


##########################################################################################################
#### 3. Diagnostic plots
##########################################################################################################

# Plot marker expression and colour by group (ICU or control)
pExprs <- plotExprs(sce, color_by = "group") + scale_fill_manual(values=cbPalette)
pExprs$facet$params$ncol <- 6
pExprs
ggsave("expression_by_group.png", plot = last_plot(), path = "Output", width = 11, height = 7)
rm(pExprs)

## Plot cell count and colour by group (ICU or control)
n_cells(sce)
cells_tbl <- n_cells(sce)
pCount <- plotCounts(sce, 
                     group_by = "sample_id", 
                     color_by = "group")
pCount <- pCount + theme(axis.text.x = element_text(angle = 90, size = 8))
ggsave("counts_by_condition.png", plot = last_plot(), path = "Output", width = 11, height = 7)
rm(pCount)


## Plot marker ranking and colour by group (ICU or control)
#
pNRS <- plotNRS(sce, features = type_markers(sce), color_by = "group") + scale_fill_manual(values=cbPalette)
pNRS <- pNRS + theme(axis.text.x = element_text(angle = 90, size = 8))
pNRS
ggsave("NRS_by_condition.png", plot = last_plot(), path = "Output")
rm(pNRS)

# #plot MDS
pbMDS(sce, by = "sample_id", color_by = "group", fun = "median"
) + scale_fill_manual(values=cbPalette)
ggsave("pdMDS.png", plot = last_plot(), path = "Output", width = 11, height = 7)

##########################################################################################################
#### Cell population identification with FlowSOM and ConsensusClusterPlus
##########################################################################################################

gc()
#set random seed for reproducibility
set.seed(362331)

#create R object to store all the panel markers
markers_all <- c("CD45", "CD3", "CD19", "CD4", "CD8a", "CD11c", "IL-17A", "CD56_NCAM", "CD192_CCR2", "CD123_IL-3R", "TNFa", "CD62L", "CD45RA", "CD184_CXCR4", "IFNg", "FoxP3", "CD14", "CD66b", "IL-4", "IL-10", "CD11b_Mac-1", "CD127_IL-7Ra", "CD25_IL-2R", "CX3CR1", "HLA-DR", "CD279_PD-1", "CD7", "CD16")

#create R object to store all the panel markers used for clustering and tSNE
f <- c("CD3", "CD19", "CD4", "CD8a", "CD7", "CD11b_Mac-1", "CD11c", "CD14", "CD16", "CD25_IL-2R", "CD45RA", "CD56_NCAM", "CD62L", "CD66b", "CD123_IL-3R", "CD127_IL-7Ra", "CD184_CXCR4", "CD192_CCR2", "CX3CR1", "FoxP3", "TNFa", "IFNg", "IL-4", "IL-10", "IL-17A", "HLA-DR", "CD279_PD-1")

#Set metadata factors to the correct order, not alphabetical
sce$day <- factor(sce$day, levels = c("Control", "1", "3", "7", "14"))
sce$abx <- factor(sce$abx, levels = c("Control", "Abx(-)", "Abx(+)"))
sce$nosocomial <- factor(sce$nosocomial, levels = c("Control", "Nosocomial(-)", "Nosocomial(+)"))
sce$fungals <- factor(sce$fungals, levels = c("Control", "Fungals(-)", "Fungals(+)"))
sce$SOFA <- factor(sce$SOFA, levels = c("Control", "A", "B", "C", "D"))

#create R object to store markers were are interested in for later
cytokines <- c("IFNg", "TNFa", "IL-4", "IL-10", "IL-17A")
exhaust <- c("CD11b_Mac-1", "CD11c", "CD16", "CD66b", "CD184_CXCR4", "CD192_CCR2", "CX3CR1")

#Genere K number of clusters from all events in all fcs files

sce <- cluster(sce, features = f,    
               xdim = 12, ydim = 12, maxK = 40, seed = 362331)   

#check the delta area of the generate clusters
delta_area(sce)
ggsave("delta_area.png", plot = last_plot(), path = "Output", width = 11, height = 7)

saveRDS(sce, "sce_cluster.RDS")

#Check clusters to review expression of markers/features that we used for clustering
#Save heatmap as pdf

pdf(file = "Output/original_cluster_heatmap.pdf", width = 10,
    height = 7, compress = FALSE)
plotExprHeatmap(sce, features = f, by ="cluster_id", k ="meta40",
                scale = "never",
                row_anno = TRUE,   # annotate samples
                row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                bin_anno = FALSE,          # annotate bins with value
                bars = TRUE, perc = TRUE) # include barplot of sample sizes
dev.off()


pdf(file = "Output/original_cluster_heatmap_scaled.pdf", width = 10,
    height = 7, compress = FALSE)
plotExprHeatmap(sce, features = f, by ="cluster_id", k ="meta40",
                scale = "first", q = 0.01,
                row_anno = TRUE,   # annotate samples
                row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                bin_anno = FALSE,          # annotate bins with value
                bars = TRUE, perc = TRUE) # include barplot of sample sizes
dev.off()


pdf(file = "Output/original_cluster_heatmap_scaled_last.pdf", width = 10,
    height = 7, compress = FALSE)
plotExprHeatmap(sce, features = f, by ="cluster_id", k ="meta40",
                scale = "last", q = 0.01,
                row_anno = TRUE,   # annotate samples
                row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                bin_anno = FALSE,          # annotate bins with value
                bars = TRUE, perc = TRUE) # include barplot of sample sizes
dev.off()


##########################################################################################################
## Plot clusters at multiple levels with DR
##########################################################################################################

## Dimensionality reduction of FlowSOM clusters.

set.seed(86665596)
sce <- runDR(sce, dr = "UMAP", cells = 5000, features = f,  n_neighbors = 80, scale = TRUE, n_threads = 16, verbose = TRUE)
sce <- runDR(sce, dr = "TSNE", cells = 5000, features = f, perplexity = 80, pca = FALSE, normalize = FALSE, theta = 0.5, exaggeration_factor = 5, stop_lying_iter = 500, eta = 500, max_iter = 5000, num_threads = 16, verbose = TRUE)

#Run a script to generate tSNE and UMAP plots of dimensionality reduction clusters
source('R_scripts/plot_dr_all.R')


saveRDS(sce, "sce_DR.RDS")



##########################################################################################################
#### 6. Annotate clusters
##########################################################################################################

#import annotation file with new cluster names
setwd(MetaDirectory)
merging_table1 <- fread("cluster_annotation.csv")
setwd(PrimaryDirectory)

#annotate cluster with annotation file
sce <- mergeClusters(sce, k = "meta40",                                  
                     table = merging_table1, id = "Clusters", overwrite = TRUE)  

#Set R object to our newly generated cluster group for easier plotting later
clustering <- "Clusters"

#generate tSNE and UMAP plots with cluster annotations
plotDR(sce, "TSNE", color_by = clustering) + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("annotated_tsne.png", plot = last_plot(), path = "Output", width = 11, height = 7)
plotDR(sce, "UMAP", color_by = clustering) + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("annotated_UMAP.png", plot = last_plot(), path = "Output", width = 11, height = 7)

saveRDS(sce, "sce_annotated.RDS")

# Plot heatmaps for annotated clusters for easier reading

## Plot marker heatmap for each cluster
pdf(file = "Output/annotated_heatmap.pdf", width = 10, 
    height = 7, compress = FALSE)
plotExprHeatmap(sce, features = type_markers(sce), by ="cluster_id", k =clustering, 
                scale = "never",
                row_anno = FALSE,   # annotate samples
                row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                bin_anno = FALSE,          # annotate bins with value
                bars = TRUE, perc = TRUE) # include barplot of sample sizes
dev.off()

pdf(file = "Output/annotated_heatmap_scaled.pdf", width = 10, 
    height = 7, compress = FALSE)
plotExprHeatmap(sce, features = type_markers(sce), by ="cluster_id", k =clustering, 
                scale = "first", q = 0.01,
                row_anno = FALSE,   # annotate samples
                row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                bin_anno = FALSE,          # annotate bins with value
                bars = TRUE, perc = TRUE) # include barplot of sample sizes
dev.off()


pdf(file = "Output/annotated_heatmap_scaled_last.pdf", width = 10, 
    height = 7, compress = FALSE)
plotExprHeatmap(sce, features = type_markers(sce), by ="cluster_id", k =clustering, 
                scale = "last", q = 0.01,
                row_anno = FALSE,   # annotate samples
                row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                bin_anno = FALSE,          # annotate bins with value
                bars = TRUE, perc = TRUE) # include barplot of sample sizes
dev.off()


##########################################################################################################
#### 7. Plot expression and abundance differences between clusters across metadata 
##########################################################################################################


### Create output directory
dir.create("Output/annotated", showWarnings = FALSE)
setwd("Output/annotated")
OutputDirectory <- getwd()
setwd(OutputDirectory)

source('R_scripts/day.R')
source('R_scripts/marker_mapping.R')
source('R_scripts/nosocomial.R')
source('R_scripts/group.R')
source('R_scripts/abx.R')
source('R_scripts/SOFA.R')
source('R_scripts/mortality.R')
source('R_scripts/annotated_plots.R')
source('R_scripts/cluster_plots.R')

setwd(PrimaryDirectory)

