dir.create("group", showWarnings = FALSE)

plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3)))
ggsave("TSNE_group.png", plot = last_plot(), path = "group", width = 12, height = 7)

plotDR(sce, dr = "UMAP", color_by = clustering, facet_by = "group") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3)))
ggsave("UMAP_group.png", plot = last_plot(), path = "group", width = 12, height = 7)


pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD279_PD-1", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_PD-1.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "HLA-DR", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_HLA.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "IL-4", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-4.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "IL-10", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-10.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "IL-17A", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-17A.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "IFNg", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IFNg.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "TNFa", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_TNFa.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD11c", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11c.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD11b_Mac-1", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11b.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD14", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD14.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD16", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD16.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CX3CR1", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CX3CR1.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD127_IL-7Ra", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD127_IL-7Ra.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD184_CXCR4", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD184_CXCR4.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD192_CCR2", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD192_CCR2.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, dr = "TSNE", color_by = clustering, facet_by = "group")
pDRPD <- plotDR(sce, dr = "TSNE", color_by = "CD7", facet_by = "group")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD7.png", plot = last_plot(), path = "group", width = 12, height = 7)
rm(pDR10,pDRPD)



pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "group")
ggsave("cluster_abundance.png", plot = last_plot(), path = "group", width = 12, height = 7)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "group/group_cluster_freq.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "group/group_cluster_count.csv")


plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_group.png", plot = last_plot(), path = "group", width = 13, height = 7)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_group.png", plot = last_plot(), path = "group", width = 13, height = 7)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_group_mean.png", plot = last_plot(), path = "group", width = 13, height = 7)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_group.png", plot = last_plot(), path = "group", width = 13, height = 7)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_group_mean.png", plot = last_plot(), path = "group", width = 13, height = 7)
