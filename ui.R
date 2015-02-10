library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Body Mass Index calculator"),
  sidebarPanel(
    helpText('Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'),
    sliderInput('height', 'Please enter your height in m',value = 1.75, min = 1.30, max = 2.10, step = 0.01),
    sliderInput('weight', 'Please enter your weight in kg',value = 75, min = 30, max = 200, step = 1),
    actionButton("GoButton", "Update your weight category !")
  ),
  mainPanel(
    p('Your height is'),
    textOutput('height'),
    p(''),
    p('Your weight is'),
    textOutput('weight'),
    p(''),
    p('The resulting BMI is'),
    textOutput('BMI'),
    p(''),
    p('Your weight category is'),
    textOutput('weightCategory')
  )
)
)
