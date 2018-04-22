#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for predicting New York Temperature
shinyUI(
  fluidPage(
  
  # Application title
  titlePanel("New York City-La Guardia Airport-Temperature Predictor (ie.From May to September)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("Oz", "What is the expected Ozone Level (parts per billion)", 1, 170, value=100),
       sliderInput("Solar_Rad", "What is the expected Solar Radiation Level (langleys)", 5, 350, value=170),
       sliderInput("Av_Wind_Speed", "What is the average Wind Speed (miles per hour)", 1, 20, value=10),
       numericInput("Mon","Month(5,6,7,8,9)",value=7, min=5,max=9),
       submitButton("Submit"),
       h3 ("App User Guide available at: https://github.com/billarin1420/Data_Products  ")
    ),
    mainPanel (
      plotOutput("plot1"),
      plotOutput("plot2"),
      h3 ("Predicted Temperature (Fahrenheit)"),
      textOutput ("pred")
      
    )
    )
    )
  )