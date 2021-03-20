plotDR(sce, "UMAP", color_by = "meta20") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_20.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta20") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_20.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta18") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_18.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta18") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_18.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta16") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_16.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta16") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_16.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta14") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_14.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta14") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_14.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta12") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 

ggsave("umap_all_samples_12.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta12") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_12.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta10") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_10.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta10") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_10.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta8") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_8.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta8") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_8.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "UMAP", color_by = "meta6") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette) 
ggsave("umap_all_samples_6.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)


plotDR(sce, "TSNE", color_by = "meta6") +          
  guides(color = guide_legend(ncol = 1, override.aes = list(size = 1))
  ) + scale_fill_manual(values=cbPalette)
ggsave("tsne_all_samples_6.png", plot = last_plot(), path = OutputDirectory, width = 7, height = 5)

