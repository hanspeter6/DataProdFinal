
library(shiny)

shinyUI(fluidPage(

  titlePanel("Cheddar Cheese: Taste vs Three Acids"),

  sidebarLayout(
    sidebarPanel(
            h3("Select Variables"),
            selectInput("select", "", choices = list(
                                                "All" = "All",
                                                "Acetic Acid" = "Acetic",
                                                "Hydrogen Sulphide" = "H2S",
                                                "Lactic Acid" = "Lactic"),
                                                        selected = "All",
                                                        multiple = FALSE,
                                                        size = 4,
                                                        selectize = FALSE),
            h3("Intercept"),
            textOutput("intercept"),
            h3("Slope"),
            textOutput("slope"),
            h3("Correlation Matrix"),
            tableOutput("tab")

    ),
    
    mainPanel(
            h4("Plots"),
            plotOutput("distPlot"),
            h3("Documentation"),
            textOutput("doc")
    )
  )
))
