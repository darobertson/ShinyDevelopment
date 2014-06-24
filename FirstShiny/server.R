library(shiny)
library(datasets)
data(iris)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
# Combine the selected variables into a new data frame
  IrisDataset <- reactive({
           iris[iris$Species == input$species,c(input$xcol, input$ycol)]
  })


# Create output summary and plot
  output$summary <- renderPrint({
    summary.data <- IrisDataset()
    summary(summary.data)
})

  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(IrisDataset(), main = c("Iris Regression for Species ", input$species))
    })
  })