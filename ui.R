
fluidPage(
  tags$head(tags$style(
    HTML('
        #sidebar {
            background-color: #191414;
            color: white
        }
        #header {
          padding: 20px;
          text-align: center;
          background: #1DB954;
          color: white;
          font-size: 20px;
        }
        body, label, input, checkboxGroupInput, button, select { 
          font: "Cambria";
          font-weight: bold;
        }
         ')
  )),
  
  tags$header(h1("Genretics"), id="header"), 
  
  sidebarLayout(
    
    sidebarPanel(
      id="sidebar",
      width=3,
      checkboxGroupInput("checked_genres", label = h3("Genres"), 
                         choices = sort(unique(songs$genre)), selected=sort(unique(songs$genre))[1]
      ),
      
      selectizeInput(inputId = "x",
                     label = "X Metric",
                     choices = names(songs)[4:16],
                     selected = names(songs)[13]
                     ),
      
      selectizeInput(inputId = "y",
                     label = "Y Metric",
                     choices = names(songs)[4:16],
                     selected = names(songs)[5]
                     )
    ),
    
    mainPanel(
      width=9,
      tabsetPanel(type = "tabs",
                  tabPanel("Explore", font="black", plotlyOutput("explore_songs", height="700px")),
                  tabPanel("Average", plotlyOutput("average_plotly", height="700px")),
                  tabPanel("Summary of Y Metric", plotOutput("summary", height="700px")),
                  tabPanel("Glossary", tableOutput("glossary"))
      )
    )
  )

)
