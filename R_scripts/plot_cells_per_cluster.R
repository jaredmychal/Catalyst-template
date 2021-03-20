pAbunDay <- plotAbundances(sce, k = "meta14", by = "cluster_id", group_by = "day",
                         linkage = "median", col_clust = FALSE)


df <- pAbunDay[["plot_env"]][["df"]]
write.csv(df, "CD4_cluster_freq.csv")
tbl <- pAbunDay[["plot_env"]][["ns"]]
tbl_df <- as.data.frame(tbl)
df$Freq <- tbl_df$Freq
colnames(df)[3] <- "Total_Cells"
write.csv(df, "CD4_cluster_cells.csv")
count <- n_cells(sce)
df_count <- as.data.frame(count)
write.csv(df, "CD4_counts_sample.csv")


pCounts <- ggplot(data = df, mapping = aes(x = nosocomial, y = Total_Cells, color = nosocomial)) + 
    geom_boxplot() + geom_jitter(alpha = 0.3) +
    facet_wrap(facets = vars(cluster_id), scales = "free") +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size=0.5))
pCounts

pCounts2 <- ggplot(data = df, mapping = aes(x = nosocomial, y = Total_Cells, color = nosocomial)) + 
  geom_violin() + geom_jitter(alpha = 0.3) +
  facet_wrap(facets = vars(cluster_id), scales = "free") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size=0.5))
pCounts2