library(shiny)
library(datasets)
shinyServer(
  
  function(input, output){
    
    icolm <- reactive({ 
      as.numeric(input$var)
      })
    output$text1 <- renderText({
      paste("Data setvariable/column name is: ", names(iris[icolm()]))
      
    })
    
    output$text2 <- renderText({
      paste("Color of histogram is: ", input$color)
      
    })
    
    output$text3 <- renderText({
      paste("Number of histogram BINs is: ", input$bins)
      
    })
    
    output$sum <- renderPrint({
      summary(iris)
      
    })
    
    output$str <- renderPrint({
      str(iris)
      
    })
    output$data <- renderTable({
      iris[icolm()]
      
    })
    output$myhist <- renderPlot({
      hist(iris[,icolm()], breaks=seq(0, max(iris[,icolm()]), length.out=input$bins+1),col=input$color, xlim=c(0, max(iris[,icolm()])), main="Histogram of iris dataset", xlab=names(iris[icolm()]))
    })
  }
)