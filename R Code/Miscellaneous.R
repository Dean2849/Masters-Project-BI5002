## Save Packages
tmp = installed.packages()
installedpkgs = as.vector(tmp[is.na(tmp[,"Priority"]), 1])
save(installedpkgs, file="installed_old.rda")

## Update R
library(installr)
updateR()

## Load and Update Packages
load("installed_old.rda")
tmp = installed.packages()
installedpkgs.new = as.vector(tmp[is.na(tmp[,"Priority"]), 1])
missing = setdiff(installedpkgs, installedpkgs.new)
install.packages(missing)
update.packages()

##Sorting ggplot2 (Hopefully!)
deps = tools::package_dependencies("ggplot2", recursive = TRUE)$ggplot2
for (dep in deps) {
  try(install.packages(dep))
}

devtools::install_github('rlang')
library(tidyverse)