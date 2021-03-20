dir.create("cluster_plots", showWarnings = FALSE)

sce$day <- factor(sce$day, levels = c("Control", "1", "3", "7", "14"))
sce$abx <- factor(sce$abx, levels = c("Control", "Abx(-)", "Abx(+)"))
sce$nosocomial <- factor(sce$nosocomial, levels = c("Control", "Nosocomial(-)", "Nosocomial(+)"))
sce$fungals <- factor(sce$fungals, levels = c("Control", "Fungals(-)", "Fungals(+)"))
sce$SOFA <- factor(sce$SOFA, levels = c("Control", "A", "B", "C", "D"))

p1 <- plotAbundances(sce, k = clustering, by = "cluster_id", group_by = "patient_id") + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
p1 <- p1 + theme(axis.text.x = element_text(angle = 90, size = 8))
p1
ggsave("cluster_abundance_patient.png", plot = last_plot(), path = "cluster_plots", width = 18, height = 9)


p <- plotAbundances(sce, k = clustering, by = "sample_id", group_by = "day", col_clust = FALSE) + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
p <- p + theme(axis.text.x = element_text(angle = 90, size = 8))
p
ggsave("cluster_abundance_day.png", plot = last_plot(), path = "cluster_plots", width = 18, height = 7)

p <- plotAbundances(sce, k = clustering, by = "sample_id", group_by = "abx", col_clust = FALSE) + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
p <- p + theme(axis.text.x = element_text(angle = 90, size = 8))
p
ggsave("cluster_abundance_abx.png", plot = last_plot(), path = "cluster_plots", width = 18, height = 7)


p <- plotAbundances(sce, k = clustering, by = "sample_id", group_by = "nosocomial", col_clust = FALSE) + guides(color = guide_legend(ncol = 1, override.aes = list(size = 3))) 
p <- p + theme(axis.text.x = element_text(angle = 90, size = 8))
p
ggsave("cluster_abundance_nosocomial.png", plot = last_plot(), path = "cluster_plots", width = 18, height = 7)


p <- plotAbundances(sce, k = clustering, by = "sample_id", group_by = "mortality", col_clust = FALSE)
p <- p + theme(axis.text.x = element_text(angle = 90, size = 8))
p
ggsave("cluster_abundance_mortality.png", plot = last_plot(), path = "cluster_plots", width = 18, height = 7)