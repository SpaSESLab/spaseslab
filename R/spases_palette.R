# SPASESLab plot color palette
# Source this file to use: source("spases_palette.R")

spases_palette <- c(
  "Mulberry"  = "#5C2340",
  "Slate"     = "#4A6E82",
  "Lichen"    = "#7A9E5B",
  "Wheat"     = "#D4A03C",
  "Charcoal"  = "#3D3D3D"
)

#' Custom color scale for ggplot2 using the SPASESLab palette
#' @param ... Additional arguments passed to scale_color_manual
scale_color_spases <- function(...) {
  ggplot2::scale_color_manual(values = unname(spases_palette), ...)
}

#' Custom fill scale for ggplot2 using the SPASESLab palette
#' @param ... Additional arguments passed to scale_fill_manual
scale_fill_spases <- function(...) {
  ggplot2::scale_fill_manual(values = unname(spases_palette), ...)
}
