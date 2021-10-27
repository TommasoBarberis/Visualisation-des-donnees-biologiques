library(shiny)
load("/home/tommaso/M2/Semestre_3/VDB/shiny/data_varis/dfvaris_litter.Rdata")

shinyServer(function(input, output) {
  output$abondancePlot <- renderPlot(

    hist(dfvaris_litter$agedam, freq = FALSE, 
                     main = "Distribution de l'âge des mères",
                     xlab = "Age de la mère en années", ylab = "Densité")
  )
})
