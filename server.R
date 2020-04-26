library(shiny)
library(dplyr)
library(ggplot2)
library(extrafont)

songs = read.csv(file = 'Spotify_data.csv')

function(input, output) { 
  output$val_eng <- renderPlot(
    songs %>%
      filter(genre == input$checked_genres) %>%
      ggplot(., aes(x=valence, y=energy))
      + geom_point(aes(color = genre), size=6)
      + ggtitle("Valence and Energy of Selected Genre")
      + theme(plot.title = element_text(size=30,lineheight=.8, 
                                      vjust=1)),
    height = 600, width = 700
  ) 
  '
  output$avg_mode <- renderPlot(
    
    songs %>% filter(genre==input$check_genres) %>%
      ggplot(., aes(mean(mode))) + geom_bar()
      + ggtitle("Average Mode of Selected Genre (0=Minor, 1=Major)")
    
  )
  '
  }