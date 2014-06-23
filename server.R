library(shiny)
bmi <- function(a,w,s,i,m,h) {
  my <- 24-w-s-i
if(my>8){
if(a>60) {
  status = "Great"
} else if(a<60){
  status ="Good"
}
}
else if(my>6 & my <8){
  status="Good"
}
else{
  status= "Bad"
}
  return(status)
}
bmistatus <- function(bmi){
  if(bmi<18.5){
    status = "Underweight"
  } else if(bmi<25){
    status = "Normal"
  } else if(bmi< 30){
    status = "Overweight"
  } else{
    status = "Obese"
  }
  return(status)
}
# Define server logic required to calculate BMI
shinyServer(function(input, output) {
  output$Age <- renderText({paste0("Age: ",input$Age," years ")
  })
  output$WorkingHours <- renderText({paste0("Daily Working Hours: ",input$wh," Hours")
  })
  output$SleepingHours <- renderText({paste0("Daily Sleeping Hours: ",input$sh," Hours")
  })
  output$Television_Internet <- renderText({paste0("Daily Television And Internet: ",input$ih," Hours")
  })
  output$Martial_Status <- renderText({paste0("Martial_Status: ",input$inRadio," ")
  })
  output$Physical_Workout <- renderText({paste0("Personal Activities: ",input$var," Hours")
  })
  output$bmi <- renderText({
    bmical<-bmi(input$Age,input$wh, input$sh, input$ih,input$inRadio, input$var)
    paste0("Based on the input, your Social Index is: ",bmical)
  })
  output$bmitable <- renderTable({
    data.frame(BMI=c("Below 18.5","18.5 to 24.9","25.0 to 29.9","Over 30"),Status=c("Underweight","Normal","Overweight","Obese"))
  },include.rownames=FALSE)
})