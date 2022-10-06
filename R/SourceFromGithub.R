library(stringi)
library(devtools)
source_from_github <- function(user = "avishai987", repositoy, version, subfolder = "", script_name = "") {
  if (script_name == "") {script_name =  repositoy %s+% ".R"}
  else { script_name = gsub(pattern = " ", replacement = "%20", x = script_name)}
  url = "https://github.com/" %s+% user %s+% "/" %s+% repositoy %s+% "/blob/" %s+% version %s+%  "/" %s+% script_name %s+% "?raw=TRUE"
  tryCatch(source_url(url),
           error = function(e)
             stop("Name error. name = " %s+% url))

}
