data(cheddar, package = "faraway")
library(shiny) ; library(ggplot2) ; library(faraway)

shinyServer(function(input, output) {

        output$distPlot <- renderPlot({

                if(input$select == "All") {
                        Acetic <- cheddar$Acetic
                        Taste <- cheddar$taste
                        Lactic <- cheddar$Lactic
                        H_Sulphide <- cheddar$H2S
                        qplot(Acetic, Taste, size = Lactic, color = H_Sulphide,
                              xlab = "Acetic Acid", ylab = "Taste",
                              main = "Taste vs Acetic Acid; colour = Hydrogen Sulphide; size = Lactic Acid")
                       
                }
                
                else if(input$select == "Acetic") {
                        y <- cheddar$taste
                        x <- cheddar$Acetic
                        g <- ggplot(cheddar,aes(Acetic, taste))
                        g <- g + geom_point()
                        g <- g + stat_smooth(formula = y ~ x, method = "lm")
                        g <- g + xlab("Acetic Acid (log scale)") + ylab("Taste") +
                                ggtitle("Taste vs Acetic Acid (log scale)")
                        g
                }
                else if(input$select == "H2S") {
                        y <- cheddar$taste
                        x <- cheddar$H2S
                        g <- ggplot(cheddar,aes(H2S, taste))
                        g <- g + geom_point()
                        g <- g + stat_smooth(formula = y ~ x, method = "lm")
                        g <- g + xlab("Hydrogen Sulphide (log scale)") + ylab("Taste") +
                                ggtitle("Taste vs Hydrogen Sulphide (log scale)")
                        g
                }
                else if(input$select == "Lactic") {
                        y <- cheddar$taste
                        x <- cheddar$Lactic
                        g <- ggplot(cheddar,aes(Lactic, taste))
                        g <- g + geom_point()
                        g <- g + stat_smooth(formula = y ~ x, method = "lm")
                        g <- g + xlab("Lactic Acide") + ylab("Taste") +
                                ggtitle("Taste vs Lactic Acid")
                        g
                }
        })
  
        output$intercept <-renderText({
                if(input$select == "All") {
                        print("N/A")
                }
                else if(input$select == "Acetic") {
                        lm(cheddar$taste~cheddar$Acetic)$coefficient[1]
                }
                else if(input$select == "H2S") {
                        lm(cheddar$taste~cheddar$H2S)$coefficient[1]
                }
                else if(input$select == "Lactic") {
                        lm(cheddar$taste~cheddar$Lactic)$coefficient[1]
                }
        })
  
        output$slope <-renderText({
                if(input$select == "All") {
                        print("N/A")
                }
                else if(input$select == "Acetic") {
                        lm(cheddar$taste~cheddar$Acetic)$coefficient[2]
                }
                else if(input$select == "H2S") {
                        lm(cheddar$taste~cheddar$H2S)$coefficient[2]
                }
                else if(input$select == "Lactic") {
                        lm(cheddar$taste~cheddar$Lactic)$coefficient[2]
                }
        })
        
        output$doc <- renderText({
                "The purpose of this app is to serve as a convenient initial
                        exploration of the relationships between taste and various acid
                        concentrations in cheddar cheese. The dataset (cheddar) from package 'faraway' is based on a
                        study of cheddar cheese from the LaTrobe Valley of Victoria,
                        Australia. Concentrations of three different acids were measured
                        and the samples subjected to taste tests. Taste scores were obtained
                        by combining the scores from several tasters. Packages used to run this app:
                        'faraway', 'ggplot2' and 'shiny'."
                
                
                
        })
        
        output$tab <- renderTable(cor(cheddar), rownames = TRUE)
})
