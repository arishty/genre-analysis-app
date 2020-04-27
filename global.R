library(shiny)
library(dplyr)
library(ggplot2)
library(extrafont)
library(plotly)
#library(gapminder)


songs = read.csv(file = 'Spotify_data.csv')
glossary_df = read.csv(file = 'Glossary_metrics.csv')
