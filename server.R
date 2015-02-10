library(shiny)

BMI <- function(weight,height) weight/height^2

weightCategory <-function(BMI) {
      if (BMI <15.0) 'Very severely underweight'
  else if (BMI > 15.0 && BMI<16.0) 'Severly underweight'
  else if (BMI>16.0 && BMI<18.5) 'Underweight'
  else if (BMI>18.5 && BMI<25.0) 'Normal (healthy weight)'
  else if (BMI>25.0 && BMI<30.0) 'Overweight'
  else if (BMI>30.0 && BMI<35.0) 'Obese Class I (Moderately obese)'
  else if (BMI>35.0 && BMI<40.0) 'Obese Class II (Severely obese)'
  else if (BMI>40.0) 'Obese Class III (Very severely obese)'
}

shinyServer(
  function(input, output) {
    output$height <- renderText({paste(input$height, " m")})
    output$weight <- renderText({paste(input$weight, "kg")})
    output$BMI <- renderPrint({BMI(input$weight,input$height)})
    output$weightCategory <- renderPrint({
                                          input$GoButton 
                                          isolate(weightCategory(BMI(input$weight,input$height)))})
  }
)

