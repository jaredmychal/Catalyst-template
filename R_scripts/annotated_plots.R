dir.create("group", showWarnings = FALSE)


pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "group")
pAbun + theme(plot.title = element_text(size=12))
pAbun
ggsave("cluster_abundance_group.jpg", plot = last_plot(), path = "group", width = 12, height = 10)


df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "group/group_cluster_freq_day.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "group/group_cluster_count_day.csv")
rm(df,pAbun,tbl_df,tbl)

plotDR(sce, "TSNE", color_by = clustering, facet_by = "group") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("tsne_by_group.png", plot = last_plot(), path = "group", width = 12, height = 7)


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
ggsave("marker_express_group.png", plot = last_plot(), path = "group", width = 12, height = 10)


pbExp <- plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
pbExp
ggsave("cytokine_express_group.png", plot = last_plot(), path = "group", width = 12, height = 10)
df <- pbExp[["data"]]
write.csv(df, "cytokines.csv")

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
ggsave("cytokine_express_group_mean.png", plot = last_plot(), path = "group", width = 12, height = 10)

pbExp <- plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
pbExp
ggsave("exhausted_express_group.png", plot = last_plot(), path = "group", width = 12, height = 10)
df <- pbExp[["data"]]
write.csv(df, "exhaust_markers.csv")
rm(pbExp)

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
ggsave("exhausted_express_group_mean.png", plot = last_plot(), path = "group", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features =c("CD279_PD-1", "HLA-DR"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("PD-1_HLA-DR_express_cluster_group.png", plot = last_plot(), path = "group", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = "TNFa",
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("TNFa_express_cluster_group.png", plot = last_plot(), path = "group", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_cluster_group.png", plot = last_plot(), path = "group", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_cluster_group.png", plot = last_plot(), path = "group", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "group", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("cytokines_express_cluster_group.png", plot = last_plot(), path = "group", width = 12, height = 10)

##########################################################################################################


dir.create("day", showWarnings = FALSE)
sce$day <- factor(sce$day, levels = c("Control", "1", "3", "7", "14"))


pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "day")
pAbun + theme(plot.title = element_text(size=12))
pAbun
ggsave("cluster_abundance_day.png", plot = last_plot(), path = "day", width = 12, height = 10)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "day/day_cluster_freq_day.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "day/day_cluster_count_day.csv")
rm(df,pAbun,tbl_df,tbl)

plotDR(sce, "TSNE", color_by = clustering, facet_by = "day") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("tsne_by_day.png", plot = last_plot(), path = "day", width = 12, height = 7)

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
ggsave("marker_express_day.png", plot = last_plot(), path = "day", width = 12, height = 10)


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
ggsave("cytokine_express_day.png", plot = last_plot(), path = "day", width = 12, height = 10)


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
ggsave("cytokine_express_day_mean.png", plot = last_plot(), path = "day", width = 12, height = 10)

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
ggsave("exhausted_express_day.png", plot = last_plot(), path = "day", width = 12, height = 10)

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
ggsave("exhausted_express_day_mean.png", plot = last_plot(), path = "day", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features =c("CD279_PD-1", "HLA-DR"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("PD-1_HLA-DR_express_cluster_day.png", plot = last_plot(), path = "day", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = "TNFa",
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("TNFa_express_cluster_day.png", plot = last_plot(), path = "day", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_cluster_day.png", plot = last_plot(), path = "day", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_cluster_nosocomial.png", plot = last_plot(), path = "day", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "day", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("cytokines_express_cluster_day.png", plot = last_plot(), path = "day", width = 12, height = 10)


##########################################################################################################


dir.create("nosocomial", showWarnings = FALSE)
sce$nosocomial <- factor(sce$nosocomial, levels = c("Control", "Nosocomial(-)", "Nosocomial(+)"))

plotDR(sce, "TSNE", color_by = clustering, facet_by = "nosocomial") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("tsne_by_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 7)


plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "day", shape_by = "nosocomial")
ggsave("cluster_abundance_by_day_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "nosocomial")
pAbun
ggsave("cluster_abundance_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "nosocomial/cluster_freq_nosocmial.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "nosocomial/cluster_count_nosocmial.csv")
rm(df,pAbun,tbl_df,tbl)

plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_nosocomial_mean.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_nosocomial_mean.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = exhaust,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhaust_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features =c("CD279_PD-1", "HLA-DR"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("PD-1_HLA-DR_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = "IFNg",
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("IFNg_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "nosocomial", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("cytokines_express_cluster_nosocomial.png", plot = last_plot(), path = "nosocomial", width = 12, height = 10)


##########################################################################################################


dir.create("abx", showWarnings = FALSE)
sce$abx <- factor(sce$abx, levels = c("Control", "Abx(-)", "Abx(+)"))

plotDR(sce, "TSNE", color_by = clustering, facet_by = "abx") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("tsne_by_abx.png", plot = last_plot(), path = "abx", width = 12, height = 7)

plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "day", shape_by = "abx")
ggsave("cluster_abundance_by_day_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "abx")
pAbun
ggsave("cluster_abundance_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "abx/cluster_freq_abx.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "abx/cluster_count_abx.csv")
rm(df,pAbun,tbl_df,tbl)

plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_abx_mean.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_abx_mean.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = exhaust,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhaust_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features =c("CD279_PD-1", "HLA-DR"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("PD-1_HLA-DR_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = "IFNg",
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("IFNg_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "abx", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("cytokines_express_cluster_abx.png", plot = last_plot(), path = "abx", width = 12, height = 10)


##########################################################################################################

dir.create("SOFA", showWarnings = FALSE)
sce$SOFA <- factor(sce$SOFA, levels = c("Control", "A", "B", "C", "D"))

plotDR(sce, "TSNE", color_by = clustering, facet_by = "SOFA") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("tsne_by_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 7)

plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "day", shape_by = "SOFA")
ggsave("cluster_abundance__by_day_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "SOFA")
pAbun
ggsave("cluster_abundance_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "SOFA/cluster_freq_SOFA.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "SOFA/cluster_count_SOFA.csv")
rm(df,pAbun,tbl_df,tbl)

plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_SOFA_mean.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_SOFA_mean.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = exhaust,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhaust_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features =c("CD279_PD-1", "HLA-DR"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("PD-1_HLA-DR_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = "IFNg",
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("IFNg_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "SOFA", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("cytokines_express_cluster_SOFA.png", plot = last_plot(), path = "SOFA", width = 12, height = 10)


##########################################################################################################

dir.create("mortality", showWarnings = FALSE)

plotDR(sce, "TSNE", color_by = clustering, facet_by = "mortality") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
ggsave("tsne_by_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 7)


plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "day", shape_by = "mortality")
ggsave("cluster_abundance_by_day_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

pAbun <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "mortality")
pAbun
ggsave("cluster_abundance_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

df <- pAbun[["plot_env"]][["df"]]
write.csv(df, "mortality/cluster_freq_mortality.csv")
tbl <- pAbun[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "mortality/cluster_count_mortality.csv")
rm(df,pAbun,tbl_df,tbl)

plotPbExprs(sce, features = type_markers(sce),
            assay = "exprs", 
            fun = "median",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("marker_express_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "median",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)


plotPbExprs(sce, features = cytokines,
            assay = "exprs", 
            fun = "mean",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_mortality_mean.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "median",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, features = exhaust,
            assay = "exprs", 
            fun = "mean",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhausted_express_mortality_mean.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("cytokine_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = exhaust,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 5
)
ggsave("exhaust_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features =c("CD279_PD-1", "HLA-DR"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("PD-1_HLA-DR_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)


plotPbExprs(sce, k = clustering, features = "IFNg",
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("IFNg_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IL-4", "IL-10"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("anti_inflammatory_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = c("IFNg", "TNFa", "IL-17A"),
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("pro_inflammatory_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

plotPbExprs(sce, k = clustering, features = cytokines,
            assay = "exprs", 
            fun = "median",
            facet_by = "cluster_id",
            color_by = "mortality", 
            shape_by = NULL,
            size_by = FALSE,
            geom = "both",
            jitter = TRUE,
            ncol = 4
)
ggsave("cytokines_express_cluster_mortality.png", plot = last_plot(), path = "mortality", width = 12, height = 10)

