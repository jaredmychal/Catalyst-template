dir.create("fungals", showWarnings = FALSE)
sce$fungals <- factor(sce$fungals, levels = c("Control", "Fungals(-)", "Fungals(+)"))

plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3)))
ggsave("TSNE_fungals.png", plot = last_plot(), path = "fungals", width = 12, height = 7)

plotDR(sce, "UMAP", color_by = clustering, facet_by = "fungals") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3)))
ggsave("UMAP_fungals.png", plot = last_plot(), path = "fungals", width = 12, height = 7)


pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD279_PD-1", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_PD-1.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "HLA-DR", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_HLA.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-4", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-4.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-10", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-10.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-17A", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-17A.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "IFNg", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IFNg.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "TNFa", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_TNFa.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD11c", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11c.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD11b_Mac-1", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11b.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD14", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD14.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD16", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD16.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CX3CR1", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CX3CR1.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD127_IL-7Ra", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD127_IL-7Ra.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD184_CXCR4", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD184_CXCR4.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD192_CCR2", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD192_CCR2.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "fungals")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD7", facet_by = "fungals")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD7.png", plot = last_plot(), path = "fungals", width = 12, height = 7)
rm(pDR10,pDRPD)



pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "fungals")
ggsave("cluster_abundance.png", plot = last_plot(), path = "fungals", width = 12, height = 7)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "fungals/cluster_freq_fungals.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "fungals/cluster_count_fungals.csv")


plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "fungals", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_fungals.png", plot = last_plot(), path = "fungals", width = 12, height = 7)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "fungals", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_fungals.png", plot = last_plot(), path = "fungals", width = 11, height = 7)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "fungals", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_fungals_mean.png", plot = last_plot(), path = "fungals", width = 11, height = 7)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "fungals", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_fungals.png", plot = last_plot(), path = "fungals", width = 11, height = 7)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "fungals", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_fungals_mean.png", plot = last_plot(), path = "fungals", width = 11, height = 7)
