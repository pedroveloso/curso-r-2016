#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Ajusta modelo para as variaveis y e x no banco de dados diamonds
ajustar_modelo <- function(y, x){
  form <- as.formula(paste(y, x, sep='~'))
  modelo <- lm(form, data = diamonds)
  return(modelo)
}

shinyServer(function(input, output) {
  
  output$reta_ajustada <- renderPlot({
    
    # definição das variáveis 
    y <- input$resposta
    x <- input$x
    
    ajuste <- ajustar_modelo(y,x)
    
    # faça um gráfico da variável resposta pela variável selecionada para o eixo X
    # inclua a reta de regressão ajustada.
    output$reta_ajustada <- renderPlot({
    graf<-ggplot(diamonds,aes_string(x=x,y=y))+geom_point()+geom_abline(colour="red",intercept=ajuste$coefficients[1],slope=ajuste$coefficients[2])
      print(graf)
      })
  })
  
})