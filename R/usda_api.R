#' Sets up the call to the USDA API
#' 
#' Defines and passes the string to pull from USDA
#' @param path A defined path to append to the set API
#' @keywords json
#' @export
#' @examples
#' process_data()

usda_api <- function(path){
  require(httr)  
  require(jsonlite)
  require(xml2)
  
  url <- modify_url("https://api.nal.usda.gov",path=path)
  res <- GET(url)
  if(http_type(res)=="application/json"){
    jsonlite::fromJSON(content(res, "text"))
  } 
  else if(http_type(res)=="application/xml"){
    print("We can't process xml yet. Try again with json.")
  }
}

