
function(input, output) { 
  
  songs_genres = reactive(
    
    songs %>%
      filter(genre %in% input$checked_genres)
    
  )
  
  
  output$explore_songs <- renderPlotly(
    
    songs_genres() %>%  
      ggplot(., aes_string(x=input$x, y=input$y))
    + geom_point(aes(color = genre, text=paste("Song:", song, "\nArtist:", artist)), size=4)
    + scale_x_continuous(limits = c(0,1))
    + scale_y_continuous(limits = c(0,1))
    + geom_vline(xintercept = .5) + geom_hline(yintercept = .5) 
    + ggtitle("Explore Track Metrics by Genre")
    
  )
    

  output$average_plotly <- renderPlotly(
    
    songs_genres() %>% group_by(genre) %>% select(x = input$x, y = input$y, genre) %>%
      summarize(avg_x=mean(x), avg_y=mean(y)) %>%
      ggplot(., aes(x=avg_x, y=avg_y))
    + labs(x = input$x, y = input$y)
    + scale_x_continuous(limits = c(0,1))
    + scale_y_continuous(limits = c(0,1))
    + geom_vline(xintercept = .5) + geom_hline(yintercept = .5)
    + geom_point(aes(color = genre), size=4)
    + ggtitle("Average Values by Genre")
  
  )
  
  output$summary_plotly <- renderPlotly(
    
    songs %>% group_by(genre) %>% select(genre, y = input$y) %>%
      summarize(avg_y = mean(y)) %>%
      ggplot(., aes(x=reorder(genre, avg_y), y= avg_y))
    + labs(x = "genre", y = input$y)
    + geom_col(aes(fill=genre))
    + scale_x_discrete(labels = c("Alternative Rock" = "Alt Rock", "Classic Rock" = "Class. Rock", "Disco/Funk" = "Disco",
                                  "Progressive Rock" = "Prog Rock", "Video Game Soundtracks" = "Video Gm"))
    + ggtitle(paste0(input$y, " by genre"))
    
  )

  output$summary <- renderPlot(
    
    songs %>% group_by(genre) %>% select(genre, y = input$y) %>%
      summarize(avg_y = mean(y)) %>%
      ggplot(., aes(x=reorder(genre, avg_y), y= avg_y))
    + labs(x = "genre", y = input$y)
    + geom_col(aes(fill=genre))
    + scale_x_discrete(labels = c("Alternative Rock" = "Alt Rock", "Classic Rock" = "Class. Rock", "Disco/Funk" = "Disco",
                                  "Progressive Rock" = "Prog Rock", "Video Game Soundtracks" = "Video Gm"))
    + ggtitle(paste0(input$y, " by genre"))
    + theme(plot.title = element_text(size=20,lineheight=.8, vjust=1)),
    height = 600,
    width = 1050
    
  )
  
  output$glossary <- renderTable(
    
    glossary_df
    
  )
  
  }