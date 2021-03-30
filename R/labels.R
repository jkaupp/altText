#' Generate alt text from the title, subtitle and caption of a ggplot
#'
#' @param obj a ggplot
#' @export
alt_text <- function(obj) {

  if(inherits(obj, "patchwork")) {

    labels <- list(title = obj$patches$annotation$title,
                   subtitle = obj$patches$annotation$subtitle,
                   caption = obj$patches$annotation$caption)

  } else {

     labels <- obj$labels

  }

  #remove html tags
  labels <- lapply(labels, function(x) gsub("<.*?>", "", x))
  #remove markdown * or **
  labels <- lapply(labels, function(x) gsub("\\*+", "", x))
  #remove markdown _ or __
  labels <- lapply(labels, function(x) gsub("\\_+", "", x))

  sprintf("The the following graphic is titled: %s, and is described as: %s.  All attributions are: %s", labels$title, labels$subtitle, labels$caption)


}
