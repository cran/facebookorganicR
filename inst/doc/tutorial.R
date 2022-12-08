## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_facebookorganic_data.RData")

## ----setup--------------------------------------------------------------------
library(facebookorganicR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_facebookorganic_data <-
#    fetch_facebookorganic(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_facebookorganic_data)

## -----------------------------------------------------------------------------
ggplot(my_facebookorganic_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_facebookorganic_data, family = "poisson")
summary(lmod)

