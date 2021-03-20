sce.2 <- sce

sce <- filterSCE(sce.2, nosocomial == "Nosocomial(+)")
dir.create("nosocomial/positive/", showWarnings = FALSE)
setwd("nosocomial/positive/")
source('D:/R_scripts/day.R')
source('D:/R_scripts/marker_mapping.R')
source('D:/R_scripts/abx.R')
source('D:/R_scripts/mortality.R')
source('D:/R_scripts/fungals.R')
setwd(OutputDirectory)
rm(sce)

sce <- filterSCE(sce.2, nosocomial == "Nosocomial(-)")
dir.create("nosocomial/negative/", showWarnings = FALSE)
setwd("nosocomial/negative/")
source('D:/R_scripts/day.R')
source('D:/R_scripts/marker_mapping.R')
source('D:/R_scripts/abx.R')
source('D:/R_scripts/mortality.R')
source('D:/R_scripts/fungals.R')
setwd(OutputDirectory)
rm(sce)

sce <- sce.2
rm(sce.2)