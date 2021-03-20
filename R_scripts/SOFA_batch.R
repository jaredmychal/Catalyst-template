sce.2 <- sce


sce <- filterSCE(sce.2, SOFA == "A")
dir.create("SOFA/A/", showWarnings = FALSE)
setwd("SOFA/A/")
source('D:/R_scripts/day.R')
source('D:/R_scripts/marker_mapping.R')
source('D:/R_scripts/nosocomial.R')
source('D:/R_scripts/group.R')
source('D:/R_scripts/abx.R')
source('D:/R_scripts/mortality.R')
source('D:/R_scripts/fungals.R')
setwd(OutputDirectory)
rm(sce)


sce <- filterSCE(sce.2, SOFA == "B")
dir.create("SOFA/B/", showWarnings = FALSE)
setwd("SOFA/B/")
source('D:/R_scripts/day.R')
source('D:/R_scripts/marker_mapping.R')
source('D:/R_scripts/nosocomial.R')
source('D:/R_scripts/group.R')
source('D:/R_scripts/abx.R')
source('D:/R_scripts/mortality.R')
source('D:/R_scripts/fungals.R')
setwd(OutputDirectory)


sce <- filterSCE(sce.2, SOFA == "C")
dir.create("SOFA/C/", showWarnings = FALSE)
setwd("SOFA/C/")
source('D:/R_scripts/day.R')
source('D:/R_scripts/marker_mapping.R')
source('D:/R_scripts/nosocomial.R')
source('D:/R_scripts/group.R')
source('D:/R_scripts/abx.R')
source('D:/R_scripts/mortality.R')
source('D:/R_scripts/fungals.R')
setwd(OutputDirectory)
rm(sce)

sce <- filterSCE(sce.2, SOFA == "D")
dir.create("SOFA/C/", showWarnings = FALSE)
setwd("SOFA/C/")
source('D:/R_scripts/day.R')
source('D:/R_scripts/marker_mapping.R')
source('D:/R_scripts/nosocomial.R')
source('D:/R_scripts/group.R')
source('D:/R_scripts/abx.R')
source('D:/R_scripts/mortality.R')
source('D:/R_scripts/fungals.R')
setwd(OutputDirectory)
rm(sce)


sce <- sce.2