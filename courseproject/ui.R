#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    tabPanel("Analysis",
             fluidPage(
                 
                 titlePanel("Miles Per Gallon (mpg) vs. other variables"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("variable", "Variable:",
                                     c("Number of cylinders" = "cyl",
                                       "Displacement (cu.in.)" = "disp",
                                       "Gross horsepower" = "hp",
                                       "Rear axle ratio" = "drat",
                                       "Weight (lb/1000)" = "wt",
                                       "1/4 mile time" = "qsec",
                                       "V/S" = "vs",
                                       "Transmission" = "am",
                                       "Number of forward gears" = "gear",
                                       "Number of carburetors" = "carb"
                                     )),
                         
                         checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                     ),
                     
                     mainPanel(
                         h3(textOutput("caption")),
                         
                         tabsetPanel(type = "tabs", 
                                     tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                     tabPanel("Regression model", 
                                              plotOutput("mpgPlot"),
                                              verbatimTextOutput("fit")
                                     )
                         )
                     )
                 )
             )
    ),
    
  
))
 