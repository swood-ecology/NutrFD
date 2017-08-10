#' Process USDA JSON data
#' 
#' This function takes json data from the USDA food nutrient API and returns essential information
#' @param data A data file in json format
#' @keywords json
#' @export
#' @examples
#' process_data()

process_data <- function(data){
  require(tidyverse)
  
  d = do.call(cbind.data.frame, data$report$food)[,c("ndbno","name","nutrients.name","nutrients.value")]
  spread(d,key=nutrients.name,value=nutrients.value)
}