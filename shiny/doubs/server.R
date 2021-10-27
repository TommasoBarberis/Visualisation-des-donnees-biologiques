# server.R
library(shiny)
library(ade4)

shinyServer(function(input, output) {
  
  output$abondancePlot <- renderPlot({
    
    data(doubs)
    df_espece <- doubs$fish[[input$espece]]
    plot(doubs$xy$x, doubs$xy$y, 
         cex = ifelse(df_espece == 0, 1, df_espece),
         pch = ifelse(df_espece == 0, 4, 19))
  })
})