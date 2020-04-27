

function(input, output) { 
  
  songs_genres = reactive(
    
    songs %>%
      filter(genre == input$checked_genres)
    
  )
  
  # glossary_reactive = reactive(
  # 
  # )
  
 
  output$explore_songs <- renderPlotly(
    
    songs %>%
      filter(genre == input$checked_genres) %>%  
      ggplot(., aes_string(x=input$x, y=input$y))
    + geom_point(aes(color = genre, text=paste("Song:", song, "\nArtist:", artist)), size=4)
    + ggtitle("Explore Track Metrics by Genre")
    
  )
    

  output$average_plotly <- renderPlotly(
    
    songs_genres() %>% group_by(genre) %>% select(x = input$x, y = input$y, genre) %>%
      summarize(avg_x=mean(x), avg_y=mean(y)) %>%
      
      ggplot(., aes(x=avg_x, y=avg_y))
    + labs(x = input$x, y = input$y)
    #+ scale_x_continuous(limits = c(0,1))
    #+ scale_y_continuous(limits = c(0,1))
    + geom_point(aes(x=avg_x, y=avg_y, color = genre), size=4)
    + ggtitle("Average X/Y by Genre")
  
  )
  
  output$explore <- renderPlot(
   songs_genres() %>%  
    ggplot(., aes_string(x=input$x, y=input$y))
      + geom_point(aes(color = genre), size=6)
      #+ scale_color_discrete(drop = FALSE)
      #+ scale_size_continuous(limits = c(min(songs$input$x), max(songs$input$x)))
      #+ scale_x_continuous(limits=c(0,1))
      #+ scale_y_continuous(limits=c(0,1))
      + ggtitle("Explore Track Metrics by Genre")
      + theme(plot.title = element_text(size=30,lineheight=.8, 
                                     vjust=1)),
    height = 600,
    width = 700
  ) 
  
  output$average <- renderPlot(
    
     songs_genres() %>% group_by(genre) %>% select(x = input$x, y = input$y, genre) %>%
        summarize(avg_x=mean(x), avg_y=mean(y)) %>%
       
       ggplot(., aes(x=avg_x, y=avg_y))
     + labs(x = input$x, y = input$y)
     + geom_point(aes(color = genre), size=6)
     + ggtitle("Average X/Y by Genre")
     + theme(plot.title = element_text(size=30,lineheight=.8, 
                                       vjust=1)),
     height = 600,
     width = 700
    
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
    + theme(plot.title = element_text(size=30,lineheight=.8, 
                                      vjust=1)),
    height = 600,
    width = 1000
    
  )
  
#  output$glossary <-renderText(
# 
#  )
  
  }