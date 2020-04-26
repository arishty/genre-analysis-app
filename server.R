

function(input, output) { 
  
  songs_genres = reactive(
    
    songs %>%
      filter(genre == input$checked_genres)
    
  )
  
 
  
  output$val_eng <- renderPlot(
   songs_genres() %>%  
    ggplot(., aes_string(x=input$x, y=input$y))
      + geom_point(aes(color = genre), size=6)
      + ggtitle("Explore Track Metrics by Genre")
      + theme(plot.title = element_text(size=30,lineheight=.8, 
                                     vjust=1)),
    height = 600,
    width = 700
  ) 
  '
  output$avg_mode <- renderPlot(
    
     songs_genres() %>% 
      ggplot(., aes(mean(mode))) + geom_bar()
      + ggtitle("Average Mode of Selected Genre (0=Minor, 1=Major)")
    
  )
  '
  }