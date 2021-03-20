##########################################################################################################
#### 4. Cell population identification with FlowSOM and ConsensusClusterPlus
##########################################################################################################
dir.create("Output/subsets", showWarnings = FALSE)

cd4 <- filterSCE(sce, k = "Clusters",
                 cluster_id %in% "CD4+")
dir.create("Output/subsets/cd4", showWarnings = FALSE)

n_cells(cd4)
pCount <- plotCounts(cd4, 
                     group_by = "sample_id", 
                     color_by = "group") 
pCount <- pCount + theme(axis.text.x = element_text(angle = 90, size = 8))
pCount
ggsave("cd4_counts_by_condition.png", plot = last_plot(), path = "Output/subsets/cd4", width = 11, height = 7, units = "in", dpi = 300)


## Dimensionality reduction 

cd4 <- runDR(cd4, dr = "UMAP", cells = 500, features = "type")
#cd4 <- runDR(cd4, dr = "TSNE", cells = 500, features = "type")

cd4 <- cluster(cd4, features = "type",    
               xdim = 10, ydim = 10, maxK = 12, seed = 1234)


##########################################################################################################
## Plot marker heatmap for each cluster
##########################################################################################################


pExpHM <- plotExprHeatmap(cd4, features = "type", by ="cluster_id", k ="meta12", 
                          scale = "never",
                          row_anno = TRUE,   # annotate samples
                          row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                          row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                          bin_anno = FALSE,          # annotate bins with value
                          bars = TRUE, perc = TRUE) # include barplot of sample sizes

pExpHM

pExpHM2 <- plotExprHeatmap(cd4, features = "type", by ="cluster_id", k ="meta12", 
                           scale = "first", q = 0.01,
                           row_anno = TRUE,   # annotate samples
                           row_clust = TRUE, col_clust = FALSE, # cluster samples/markers
                           row_dend = TRUE, col_dend = TRUE,   # include dendrograms
                           bin_anno = FALSE,          # annotate bins with value
                           bars = TRUE, perc = TRUE) # include barplot of sample sizes
pExpHM2

##########################################################################################################
# apply manual merging            
##########################################################################################################

### Metadata
setwd(MetaDirectory)
merging_table2 <- fread("cd4_cluster_annotation.csv")


setwd(PrimaryDirectory)

cd4 <- mergeClusters(cd4, k = "meta12",                                  
                     table = merging_table2, id = "cd4clusters")  



##########################################################################################################
## Plot DR clusters 
##########################################################################################################


p0 <- plotDR(cd4, "UMAP", color_by = "cd4clusters") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1)))  
p0$facet$params$ncol <- 1
p0
ggsave("umap_all_samples.png", plot = last_plot(), path = "Output/subsets/cd4", width = 11, height = 7, units = "in", dpi = 300)

p0.2 <- plotDR(cd4, "TSNE", color_by = "cd4clusters") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1)))  
p0.2$facet$params$ncol <- 1
p0.2
ggsave("tsne_all_samples.png", plot = last_plot(), path = "Output/subsets/cd4", width = 11, height = 7, units = "in", dpi = 300)


## Facet per condition  

p1 <- plotDR(cd4, "UMAP", color_by = "cd4clusters") + facet_wrap("group") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1)))  
p1$facet$params$nrow <- 1
p1
ggsave("umap_all_samples_by_group.png", plot = last_plot(), path = "Output/subsets/cd4", width = 11, height = 7, units = "in", dpi = 300)


p1.2 <- plotDR(cd4, "TSNE", color_by = "cd4clusters") + facet_wrap("group") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1)))  
p1.2$facet$params$nrow <- 1
p1.2
ggsave("tsne_all_samples_by_group.png", plot = last_plot(), path = "Output/subsets/cd4", width = 11, height = 7, units = "in", dpi = 300)


pGrid <- plot_grid(p1, p1.2, nrow = 2, rel_widths = c(5, 5, 2))
pGrid
ggsave("tsne_vs_umap_all_samples_by_group.png", plot = last_plot(), path = "Output/subsets/cd4", width = 11, height = 7, units = "in", dpi = 300)



##########################################################################################################
## Plot abundances
##########################################################################################################

#plot marker expression by group

pPBexpr <- plotPbExprs(cd4, k = "cd4clusters", features = "type",
                       assay = "exprs", 
                       fun = "mean",
                       color_by = "group", 
                       shape_by = NULL,
                       size_by = FALSE,
                       geom = "both",
                       jitter = TRUE,
                       ncol = 5
)
pPBexpr
ggsave("Pseudobulk-level_boxplot_by_group.png", plot = pPBexpr, path = "Output/subsets/cd4", width = 9, height = 9, units = "in", dpi = 300)


pPBexpr2 <- plotPbExprs(cd4, k = "cd4clusters", features = "type",
                       assay = "exprs", 
                       fun = "mean",
                       color_by = "day", 
                       shape_by = NULL,
                       size_by = FALSE,
                       geom = "both",
                       jitter = TRUE,
                       ncol = 5
)
pPBexpr2
ggsave("Pseudobulk-level_boxplot_by_day.png", plot = pPBexpr, path = "Output/subsets/cd4", width = 9, height = 9, units = "in", dpi = 300)


## Plot abundance of clusters by condition


pAbun <- plotAbundances(cd4, k = "cd4clusters", by = "cluster_id", group_by = "group",
                        linkage = "median", col_clust = FALSE)
pAbun$facet$params$ncol <- 4
pAbun
ggsave("population_abundance_by_group.png", plot = last_plot(), path = "Output/subsets/cd4", width = 9, height = 9, units = "in", dpi = 300)


pAbun2 <- plotAbundances(cd4, k = "cd4clusters", by = "cluster_id", group_by = "day",
                        linkage = "median", col_clust = FALSE)
pAbun2$facet$params$ncol <- 4
pAbun2
ggsave("population_abundance_by_day.png", plot = last_plot(), path = "Output/subsets/cd4", width = 9, height = 9, units = "in", dpi = 300)

