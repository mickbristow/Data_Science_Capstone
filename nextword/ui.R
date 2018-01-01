## Coursera: Data Science
## Capstone: Final Project
## Author: Michael Bristow
## Date: 01/01/2018

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
  
      # Application title
      titlePanel("Data Science Capstone Project: Next Word Prediction"),
      
      # Sidebar with a slider input for number of bins 
      sidebarLayout(
        sidebarPanel(
          helpText("Please enter a sentence."),
          hr(),
          textInput("inputText", "Enter sentence",value = "Enter text here"),
          hr(),
          helpText("1 - Predicted next work will be displayed automatically", 
                   hr(),
                   "2 - Please allow time for initial data to lad"),
                   
          hr(),
          hr()
        
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
          h3("Entered text (cleaned and normalised)"),
          textOutput("txt_in"),
          h3("Predicted next word"),
          textOutput("txt_pred")
        )
      )
))
