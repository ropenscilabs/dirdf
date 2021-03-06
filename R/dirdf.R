#' List Files in a Directory as a Data Frame
#'
#' Creates a data frame using information from paths and file names.
#' It searches through the directories in order to create the path names of the files.
#' It accepts either a [template][templates] or a regular expression and column names.
#'
#' @seealso [dirdf_parse()]
#'
#' @inheritParams dirdf_parse
#'
#' @param paths character vector with zero or more paths that will be searched.
#'
#' @param recursive if `TRUE`, it will recursively search over directories.
#' 
#' @param \ldots Additional arguments pass to [base::dir()].
#'
#' @example incl/dirdf.R
#'
#' @export
dirdf <- function(paths, template = NULL, regexp = NULL, colnames = NULL, missing = NA_character_, recursive = TRUE, ...) {
  pathnames <- lapply(paths, FUN = dir, recursive = recursive, ...)
  pathnames <- unlist(pathnames, use.names = FALSE)

  dirdf_parse(pathnames, template = template, colnames = colnames, regexp = regexp, missing = missing)
}


#' @rdname dirdf
#' @export
dirdf2 <- function(paths, template = NULL, regexp = NULL, colnames = NULL, missing = NA_character_, recursive = TRUE, ...) {
  pathnames <- lapply(paths, FUN = dir2, recursive = recursive, ...)
  pathnames <- unlist(pathnames, use.names = FALSE)

  dirdf_parse(pathnames, template = template, colnames = colnames, regexp = regexp, missing = missing)
}
