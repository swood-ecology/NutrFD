#' Queries the USDA database
#' 
#' Runs the query to the USDA database
#' @param codes A vector of USDA codes
#' @param api.key A user's API key
#' @param format The format of the data to pull. Defaults to json
#' @keywords json
#' @export
#' @examples
#' query_usda()

query_usda <- function(codes,api.key){
  require(tidyverse)
  dat <- data.frame()
  for(i in 1:length(codes)){
    if(is.na(codes[i]) == TRUE){
      dat = dat
    }
    else{
      res = usda_api(paste0("/",codes[i],"?api_key=",api.key))
      print(codes[i])
      dat = bind_rows(dat,process_data(res)) 
    }
  }
  dat
}