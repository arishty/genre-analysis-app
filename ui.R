# fluidPage controls screen org / resizing for you! also sidebar layout does that
#everything is comma separated in fluidpage function, all parameters

fluidPage(
  tags$head(tags$style(
    HTML('
         #sidebar {
            background-color: #1DB954;
        }

        body, label, input, button, select { 
          font-family: "Arial";
        }')
  )),
  h1("Genretics", id="sidebar"), #shiny::tags$h1 -> tags is writing html for me -> <h1>
  
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("checked_genres", label = h3("Genres"), 
                         choices = sort(unique(songs$genre)), selected="Alternative Rock"
      ),
      selectizeInput(inputId = "x",
                     label = "Feature X",
                     choices = names(songs)[4:17],
                     selected = names(songs)[13]
                     ),
      
      selectizeInput(inputId = "y",
                     label = "Feature Y",
                     choices = names(songs)[4:17],
                     selected = names(songs)[5]

                     )
      
      
    ),
    mainPanel(
      fluidRow(
        column(12, plotOutput("val_eng"))
      ),
      #plotOutput("avg_mode")
    )
  )

)
