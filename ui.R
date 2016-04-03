library(shiny)
# Define UI for application 
shinyUI(fluidPage(
  # Header or Title Panel   
  titlePanel(title = h4("A Histogram with iris dataset", align="center")),
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
      selectInput("var", "1. Slect the variable from the iris dataset below:", choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4), selected = 1),
      br(),
      sliderInput("bins", "2. Select the number of BINs for histgram:", min=5, max=25, value=15),
      br(),
      radioButtons("color", "3. Select the colour of histgram:", choices = c("Blue", "Gray", "Yellow"), selected = "Blue")),
    
    #Main Panel
    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      tabsetPanel(type="tab",
      tabPanel("Summary", verbatimTextOutput("sum")),
      tabPanel("Structure", verbatimTextOutput("str")),
      tabPanel("Data", tableOutput("data")),
      tabPanel("Plot", plotOutput("myhist")))
    )
    
  )
)
)