library(shiny)

# Define UI for application that Calculates the Life Balance on Simple User Inputs
shinyUI(fluidPage(
  # Application title
  titlePanel(" Life Balance Calulator"),
  p("Instructions:  To calculate the balance in your life, the parameters like work hours, Internet hours, family time, sleep Time and recreational time are considered."),
  br(),
  # Sidebar with a three text inputs
  sidebarLayout(position = "left",
                sidebarPanel(
                  h2('Enter your physical data:'),
                  h3('Age'),
                  numericInput("Age", label = h4("Years"),max=100,min=10, value = 20),
                  h3('No of Working hours'),
                  numericInput("wh", label = h4("hours"),max=12,min=0, value = 8),
                  h3('Internet Hours'),
                  numericInput("ih", label = h4("Hours"),max=24,min=0, value = 3),
                  h3('Sleeping  Hours'),
                  numericInput("sh", label = h4("Hours"),max=24,min=0, value = 3),
                  radioButtons("inRadio", "Martial Status:",
                               c("Married" = "Married",
                                 "Single" = "Single")),
                  selectInput("var", 
                              label = "Hobbies and Self Time",
                              choices = list("More than 4 hours", "Between 4-2",
                                             "Less than 2 Hours"),
                              selected = "Percent White"),
                  submitButton('Caclculate Social Index')
                ),
                # Displaying the Selected data
                mainPanel(
               
                  h3('Thanks for Given Information:'),
                  h4(textOutput("Age")),
                  h4(textOutput("WorkingHours")),
                  h4(textOutput("SleepingHours")),
                  h4(textOutput("Television_Internet")),
                  h4(textOutput("Martial_Status")),
                  h4(textOutput("Physical_Workout")),
                  br(),
                  h3('Calculated Life Balance is:'),
                  h4(textOutput("bmi"))
                )
  )
  ))