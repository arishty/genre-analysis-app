library(shiny)
library(dplyr)
library(ggplot2)
library(extrafont)
#library(plotly)
#install.packages(plotly)

songs = read.csv(file = 'Spotify_data.csv')