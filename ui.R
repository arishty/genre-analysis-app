library(shiny)

# fluidPage controls screen org / resizing for you! also sidebar layout does that
#everything is comma separated in fluidpage function, all parameters

songs = read.csv(file = 'Spotify_data.csv')


fluidPage(
  
  #titlePanel(img(src= 'spotify_logo.jpg', width="50%")), #shiny::tags$h1 -> tags is writing html for me -> <h1>
  
  
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("checked_genres", label = h3("Genres"), 
                         choices = unique(songs$genre), selected="Progressive Rock"
      )
      
    ),
    mainPanel(
      fluidRow(
        column(12, plotOutput("val_eng"))
        #column(6, plotOutput("avg_mode"))
      )
    )
  )

)
