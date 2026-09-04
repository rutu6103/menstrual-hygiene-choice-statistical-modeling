packages <- c(
  "readr", "readxl", "dplyr", "tidyr", "ggplot2", "forcats",
  "janitor", "broom", "MASS", "renv"
)
install.packages(setdiff(packages, rownames(installed.packages())))
