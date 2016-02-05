#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Laboratorio 08"),
  
  #wellpanel para selecionar a variavel 
    sidebarPanel(
      radioButtons(inputId='resposta', label="Resposta",
                   choices=c('price','carat','x','y','z')),
      
      radioButtons(inputId='x',label="Explicativa",
                   choices=c('price','carat','x','y','z'),
                   selected="carat")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tags$h2('Grafico!'),
       plotOutput("reta_ajustada")
    )
    )
  )
