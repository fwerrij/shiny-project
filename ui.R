shinyUI(fluidPage(
    # Application title
    titlePanel("Property price proposal App"),
    p("This example app uses the dataset HousePrices in the R library AER of 546 
observations of house sales with 12 properties in the City of Windsor, Canada 
during July, August and September, 1987. To predict house prices a multiple linear
regression model is fitted on the 11 remaining properties. A private house owner 
can use the model to get an idea of a reasonable asking price for his/her property.
The app is interactive: all 11 input values (with descriptive headers) can be 
modified, the price proposal is displayed reactively onder Result."),
em("The validity of model is of course limited by the nature of the data. For 
   actual usage an appropriate dataset should be looked for or collected."),
    fluidRow(
      
      column(3,
        sliderInput("bedrooms", label = h3("Number of bedrooms"),
                    min = 1, max = 6, value = 3, step = 1)),
      column(3,
        sliderInput("stories", label = h3("Number of stories excluding basement"),
                    min = 1, max = 4, value = 2, step = 1)),
      column(3,
        sliderInput("bathrooms", label = h3("Number of full bathrooms"),
                    min = 1, max = 4, value = 2, step = 1)),
      column(3,
        sliderInput("garage", label = h3("Number of garage places"),
                    min = 0, max = 4, value = 2, step = 1))),
    fluidRow(
      column(2,
        radioButtons("driveway", label = h4("Does the house have a driveway?"),
                     choices = list("Yes" = "yes", "No" = "no"),selected = "yes")),
      column(2,
        radioButtons("recreation", label = h4("Does the house have a recreational room?"),
                    choices = list("Yes" = "yes", "No" = "no"),selected = "no")),
      column(2,
        radioButtons("gasheat", label = h4("Does the house use gas for hot water heating?"),
                    choices = list("Yes" = "yes", "No" = "no"),selected = "yes")),
      column(2,
        radioButtons("fullbase", label = h4("Does the house have a full finished basement?"),
                    choices = list("Yes" = "yes", "No" = "no"),selected = "yes")),
      column(2,
             radioButtons("aircon", label = h4("Is there central air conditioning?"),
                          choices = list("Yes" = "yes", "No" = "no"),selected = "yes")),
      column(2,
             radioButtons("prefer", label = h4(" Is the house located in the preferred neighborhood of the city?"),
                          choices = list("Yes" = "yes", "No" = "no"),selected = "no"))),
    fluidRow(
      column(4,
             sliderInput("lotsize", label = h3("Lotsize in sqf"),
                         min = 1500, max = 16500, value = 4000)),
      column(8,
               h2('Result'),
               verbatimTextOutput("proposal")))
      )
    )


