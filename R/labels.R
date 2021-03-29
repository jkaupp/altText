#' Generate alt text from the title, subtitle and caption of a ggplot
#'
#' @param obj a ggplot
#'
#' @return
#' @export
gen_alttext <- function(obj) {

  labels <- obj$labels

  #remove html
  labels <- lapply(labels, function(x) gsub("<.*?>", "", x))

  #remove markdown * or **
  labels <- lapply(labels, function(x) gsub("\\*+", "", x))
  #remove markdown _ or __
  labels <- lapply(labels, function(x) gsub("\\_+", "", x))

  sprintf("The the following graphic is titled: %s, and is described as: %s.  All attributions are: %s", labels$title, labels$subtitle, labels$caption)


}
