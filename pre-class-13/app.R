library(shiny)

#create a simple app that takes a standard normal statistic and 
#displays the probability of achieving that value or greater 
#in a standard normal distribution. 
#In other words it takes a (z) value and gives a p-value. 

ui<-fluidPage(
  titlePanel("Practice Shiny App"),

# Sidebar with a slider input
sidebarLayout(
  sidebarPanel(
    numericInput(inputId="scoreInput", label="Z Score", value=0)
  ),
  
  # Show a plot of the generated distribution
  mainPanel( "P value",
             textOutput("PVal")
  )
)
)

# Define server logic required to draw a histogram
zscore<- function(input, output) {
  
  output$PVal<-renderText(
    {2*pnorm(-abs(input$scoreInput))
    })
}

# Run the application 
shinyApp(ui = ui, server = zscore)