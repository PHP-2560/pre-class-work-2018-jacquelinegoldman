library(shiny)

#create a simple app that takes a standard normal statistic and 
#displays the probability of achieving that value or greater 
#in a standard normal distribution. 
#In other words it takes a (z) value and gives a p-value. 

ui<-fluidPage(titlePanel("get the p-vlaue from a z score"),
              sidebarLayout(
                sidebarPanel("your zscore will go here"),
                mainPanel("the p-value will go here")
              ))

zscore<- function(z, one.sided=NULL){
  if(is.null(one.sided)){
    pval=pnorm(-abs(z))
    pval = 2 * pval
  } else if (one.sided=="-"){
    pval=pnorm(z)
  } else {
    pval=pnorm(-z)
  }
  return(pval)
}

shinyApp(ui = ui, server = zscore)