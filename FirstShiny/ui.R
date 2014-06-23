library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Iris Measurements"),
  
  # Sidebar with controls
  sidebarPanel(
    selectInput("species", "Choose a Species:", 
                choices = c("setosa", "versicolor", "virginica")),
    selectInput('xcol', 'X Variable', names(iris[,1:4])),
    selectInput('ycol', 'Y Variable', names(iris[,1:4]),
                selected=names(iris)[[2]])
  ),    

  # Plot the quantitative data selected for that species
mainPanel(
      
      verbatimTextOutput("summary"),
      
      plotOutput("plot1")
    )
  ))