#' @title source_from_github
#' @description source script from github
#' @param user PARAM_DESCRIPTION, Default: 'avishai987'
#' @param repositoy repositoy name
#' @param version version
#' @param subfolder PARAM_DESCRIPTION, Default: ''
#' @param script_name PARAM_DESCRIPTION, Default: ''

source_from_github <- function(user = "avishai987", repositoy, version, subfolder = "", script_name = "") {
  require(devtools)

  if (script_name == "") {script_name =  repositoy %s+% ".R"} # by default, script name is like repositoy name
  else { script_name = gsub(pattern = " ", replacement = "%20", x = script_name)}
  url =   file.path("https://github.com", user,repositoy,"blob", version ,script_name ,"?raw=TRUE")
  tryCatch(devtools::source_url(url),
           error = function(e)
             stop("Name error. name = " %s+% url))



  rep_dir_exists = dir.exists(file.path(.libPaths()[1], repositoy))
  if (rep_dir_exists ==F){
    download_to = file.path(.libPaths()[1], repositoy %>% paste0(".zip"))
    download.file(url = file.path("https://github.com", user,repositoy,"archive","master.zip")
                  , destfile = download_to)
    unzip(zipfile = download_to,exdir = file.path(.libPaths()[1], repositoy))

  }
}
