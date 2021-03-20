##########################################################################################################
#### Highlight markers via tSNE
##########################################################################################################

dir.create("marker_maps", showWarnings = FALSE)

plotPbExprs(sce, k = clustering, features = "type",
            assay = "exprs", 
            fun = "median",
            color_by = "cluster_id", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_cluster.png", plot = last_plot(), path = "marker_maps", width = 13, height = 11)


plotPbExprs(sce, k = clustering, features = "type",  
            group_by = "cluster_id", color_by = "group", ncol = 5)
ggsave("marker_express_cluster_group.png", plot = last_plot(), path = "marker_maps", width = 13, height = 11)


pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD279_PD-1")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_PD-1.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "HLA-DR")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_HLA.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-4")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-4.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-10")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-10.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-17A")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-17A.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "IFNg")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IFNg.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "TNFa")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_TNFa.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "FoxP3")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_FoxP3.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD11c")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11c.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD11b_Mac-1")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11b.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD14")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD14.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD16")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD16.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CX3CR1")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CX3CR1.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD127_IL-7Ra")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD127_IL-7Ra.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD184_CXCR4")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD184_CXCR4.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD192_CCR2")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD192_CCR2.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD7")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD7.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD4")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD4.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD8a")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD8a.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD19")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD19.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD56_NCAM")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD56.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD62L")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD62L.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering)
pDRPD <- plotDR(sce, "TSNE", color_by = "CD66b")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD66b.png", plot = last_plot(), path = "marker_maps", width = 9, height = 7)
rm(pDR10,pDRPD)
