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

    data %>% .$foodNutrients %>% flatten() %>% as_tibble() %>%
    select(nutrient.id,nutrient.name,nutrient.unitName,amount) %>%
    mutate(
      crop.id = rep(data %>% .$fdcId,
                    nrow(data %>% .$foodNutrients))
    )
}