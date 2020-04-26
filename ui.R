# fluidPage controls screen org / resizing for you! also sidebar layout does that
#everything is comma separated in fluidpage function, all parameters

fluidPage(
  tags$header(),
  tags$head(tags$style(
    HTML('
         #title {
            background-color: #1DB954;
         }
        #sidebar {
            background-color: #000000;
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
        }')
  )),
  tags$header(h1("Genretics"), role="banner", id="header"), #shiny::tags$h1 -> tags is writing html for me -> <h1>
  
  sidebarLayout(
    sidebarPanel(
      id="sidebar",
      width=3,
      checkboxGroupInput("checked_genres", label = h3("Genres"), 
                         choices = sort(unique(songs$genre)), selected="Alternative Rock"
      ),
      selectizeInput(inputId = "x",
                     label = "X Metric",
                     choices = names(songs)[4:17],
                     selected = names(songs)[13]
                     ),
      
      selectizeInput(inputId = "y",
                     label = "Y Metric",
                     choices = names(songs)[4:17],
                     selected = names(songs)[5]
                     )
    ),
    
    
    mainPanel(
      width=9,
      tabsetPanel(type = "tabs",
                  tabPanel("Explore", font="black", plotOutput("explore")),
                  tabPanel("Average", plotOutput("average")),
                  tabPanel("Summary of Y Metric", plotOutput("summary"))
                  #tabPanel("Glossary", ...("glossary"))
      ),
    )
  )

)
