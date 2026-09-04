# Shared helper functions for the project

library(dplyr)
library(ggplot2)

clean_factor <- function(x) {
  x <- trimws(as.character(x))
  x[x == ""] <- NA_character_
  factor(x)
}

awareness_category <- function(x) {
  dplyr::case_when(
    is.na(x) ~ NA_character_,
    x <= 0.40 ~ "Low",
    x <= 0.70 ~ "Moderate",
    TRUE ~ "High"
  ) |>
    factor(levels = c("Low", "Moderate", "High"), ordered = TRUE)
}

odds_ratio_table <- function(model) {
  coefs <- coef(summary(model))
  out <- data.frame(
    term = rownames(coefs),
    estimate = coefs[, "Estimate"],
    std_error = coefs[, "Std. Error"]
  )
  out$odds_ratio <- exp(out$estimate)
  out$conf_low <- exp(out$estimate - 1.96 * out$std_error)
  out$conf_high <- exp(out$estimate + 1.96 * out$std_error)
  rownames(out) <- NULL
  out
}
