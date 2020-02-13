library(tidyverse)
library(httr)
library(jsonlite)
# make the URL
url <-"https://educationdata.urban.org/api/v1/college-university/ipeds/enrollment-full-time-equivalent/2016/2/"

# g"/api/vi/college-university/ipeds/enrollment-full-time-equivalent/{year}/{level_of_study}/" 
ed_json <- GET(url=url, user_agent("Georgetown Univ. Student (cr1020@georgetown.edu)"))
http_status(ed_json)
ed_json <- content(ed_json, type = "text")
ed_json <- fromJSON(ed_json)
ed_data <- ed_json[["results"]]
View(ed_data)
View(ed_json)
# use the URL to make a request from the API


# get the contents of the response as a text string
pop_json <- content(pop_json, as = "text")
# create a character matrix from the JSON
pop_matrix <- fromJSON(pop_json)
# turn the body of the character matrix into a tibble
pop_data <- as_tibble(pop_matrix[2:nrow(pop_matrix), ],
                      .name_repair = "minimal")
# add variable names to the tibble
names(pop_data) <- pop_matrix[1, ]
pop_data