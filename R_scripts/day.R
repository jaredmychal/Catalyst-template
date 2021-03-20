dir.create("day", showWarnings = FALSE)
sce$day <- factor(sce$day, levels = c("Control", "1", "3", "7", "14"))

plotDR(sce, "TSNE", color_by = clustering, facet_by = "day") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3)))
ggsave("TSNE_day.png", plot = last_plot(), path = "day", width = 12, height = 7)

plotDR(sce, "UMAP", color_by = clustering, facet_by = "day") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3)))
ggsave("UMAP_day.png", plot = last_plot(), path = "day", width = 12, height = 7)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD279_PD-1", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_PD-1.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "HLA-DR", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_HLA.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-4", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-4.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-10", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-10.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "IL-17A", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IL-17A.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "IFNg", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_IFNg.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "TNFa", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_TNFa.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD11c", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11c.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD11b_Mac-1", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD11b.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD14", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD14.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD16", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD16.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CX3CR1", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CX3CR1.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD127_IL-7Ra", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD127_IL-7Ra.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD184_CXCR4", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD184_CXCR4.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD192_CCR2", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD192_CCR2.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)

pDR10 <- plotDR(sce, "TSNE", color_by = clustering, facet_by = "day")
pDRPD <- plotDR(sce, "TSNE", color_by = "CD7", facet_by = "day")
plot_grid(pDR10, pDRPD, ncol=1)
ggsave("TSNE_CD7.png", plot = last_plot(), path = "day", width = 12, height = 7)
rm(pDR10,pDRPD)


pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "day")
pAbun
ggsave("cluster_abundance.png", plot = last_plot(), path = "day", width = 12, height = 7)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "day/day_cluster_freq_day.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "day/day_cluster_count_day.csv")
rm(df,pAbun,tbl_df)


plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_day.png", plot = last_plot(), path = "day", width = 12, height = 7)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_day.png", plot = last_plot(), path = "day", width = 11, height = 7)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_day_mean.png", plot = last_plot(), path = "day", width = 11, height = 7)

plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_day.png", plot = last_plot(), path = "day", width = 11, height = 7)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_day.png", plot = last_plot(), path = "day", width = 11, height = 7)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_day.png", plot = last_plot(), path = "day", width = 11, height = 7)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_day_mean.png", plot = last_plot(), path = "day", width = 11, height = 7)
