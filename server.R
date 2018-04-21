#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Prediction Algorithm
shinyServer(function(input, output) {
  x<-na.omit(airquality)
  fit_model<-lm(Temp~Ozone+Solar.R+Wind+Month,data=x)
  fit_model1<-lm(Temp~Ozone,data=x)
  fit_model2<-lm(Temp~Solar.R,data=x)
  modelpred<-reactive({
    Oz1<-input$Oz
    Sol1<-input$Solar_Rad
    Wind1<-input$Av_Wind_Speed
    Month1<-input$Mon
    predict(fit_model,newdata=data.frame(Ozone=Oz1, Solar.R=Sol1, Wind=Wind1,Month=Month1))
      })
  output$plot1<-renderPlot({
  plot(x$Ozone,x$Temp,xlab="Ozone Level(ppm)",ylab="Temperature(F)",xlim=c(1,168),ylim=c(50,105), col="red")
  abline(fit_model1,col="blue", lwd=8)
  points(input$Oz,modelpred(),col="green",pch=16,cex=2)
  })
  output$plot2<-renderPlot({
    plot(x$Solar.R,x$Temp,xlab="Solar Radiation",ylab="Temperature(F)",xlim=c(5,350),ylim=c(50,105), col="blue")
    abline(fit_model2,col="brown", lwd=8)
    points(input$Solar_Rad,modelpred(),col="black",pch=16,cex=2)
    })
  
 output$pred<-renderText({
   modelpred()
 }) 
})
