library(shiny)
# Part that has to be included to get full functionality
# To be executed only once:
library(AER)
data("HousePrices")
fm_ag <- lm(log(price) ~ driveway + recreation + fullbase + gasheat + 
              aircon + garage + prefer + log(lotsize) + log(bedrooms) + 
              log(bathrooms) + log(stories), data = HousePrices)

# To be executed multiple times: 
# create one line df to test prediction capability
valueProp <- function(lotsize, bedrooms, bathrooms, stories, driveway, recreation, 
                       fullbase, gasheat, aircon, garage, prefer){

d <- data.frame(lotsize, bedrooms, bathrooms, stories, driveway, recreation,
                fullbase, gasheat, aircon, garage, prefer)
predval <- round(exp(predict(fm_ag ,d)),0)
#    result <- lotsize * 5
#  if (prefer == "yes") result <- result * 1.1
return(predval)
}
shinyServer(
function(input, output) {
output$inputValue1 <- renderPrint({input$lotsize})
output$inputValue2 <- renderPrint({input$bedrooms})
output$inputValue3 <- renderPrint({input$bathrooms})
output$inputValue4 <- renderPrint({input$stories})
output$inputValue5 <- renderPrint({input$driveway})
output$inputValue6 <- renderPrint({input$recreation})
output$inputValue7 <- renderPrint({input$fullbase})
output$inputValue8 <- renderPrint({input$gasheat})
output$inputValue9 <- renderPrint({input$aircon})
output$inputValue10 <- renderPrint({input$garage})
output$inputValue11 <- renderPrint({input$prefer})

output$proposal <- renderText({paste0("The proposed asking price is $", 
                                       valueProp(input$lotsize, input$bedrooms, 
                                                  input$bathrooms, input$stories,
                                                  input$driveway, input$recreation,
                                                  input$fullbase, input$gasheat,
                                                  input$aircon, input$garage, 
                                                  input$prefer),".")})
  }
)