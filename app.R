#packages to install
# install.packages("shiny")
# install.packages("shinydashboard")
# install.packages("devtools")
# install.packages("DT")



library(shiny)
library(shinydashboard)
library(DT)

#myAnimalData <- read.csv("data/myAnimalData.csv")

ui <- dashboardPage(skin = "black",
                    dashboardHeader(title = "Northeast Ohio SPCA",
                                    dropdownMenu(type = "notifications",
                                                 messageItem(
                                                   from = "Wellness Clinic",
                                                   message = "Captain: neutered",
                                                   time = "12:00"
                                                 ),
                                                 messageItem(
                                                   from = "Wellness Clinic",
                                                   message = "Pi: check up",
                                                   time = "13:45"
                                                 ),
                                                 messageItem(
                                                   from = "Wellness Clinic",
                                                   message = "Tripp: Booster Shot",
                                                   time = "2:00"
                                                 ),
                                                 messageItem(
                                                   from = "Transfer Incoming",
                                                   message = "Transfer from North Carolina",
                                                   icon = icon("truck"),
                                                   time = "3:00"
                                                 )
                                    ),
                                    dropdownMenu(type = "messages",
                                                 messageItem(
                                                   from = "Amy",
                                                   message = "Be careful with Capitain",
                                                   time = "1:00"
                                                 ),
                                                 messageItem(
                                                   from = "Vince",
                                                   message = "Pi = No dogs!",
                                                   time = "13:45"
                                                 ),
                                                 messageItem(
                                                   from = "Kevin",
                                                   message = "Tripp on short walks today! Just had surgery!",
                                                   time = "2:00"
                                                 )
                                    ),
                                    dropdownMenu(type = "tasks", badgeStatus = "success",
                                                 taskItem(value = 90, color = "green",
                                                          "Dog Capacity"
                                                 ),
                                                 taskItem(value = 17, color = "aqua",
                                                          "Cat Capacity"
                                                 ),
                                                 taskItem(value = 75, color = "yellow",
                                                          "Shelter Capacity"
                                                 )
                                    )),
                    dashboardSidebar(
                      sidebarMenu(
                        sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                                          label = "Search..."),
                        menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
                        menuItem("New Arrivals", tabName = "new", icon = icon("paw")),
                        menuItem("Adoptions", tabName = "adoptions", icon = icon("heart")),
                        menuItem("Current Animals", tabName = "current", icon = icon("th")),
                        menuItem("Staff", tabName = "staff", icon = icon("user"))
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        tabItem(tabName = "overview",
                                fluidRow(
                                  infoBox("Arrivals", 52, icon = icon("share-alt"), fill = TRUE, color = "red"),
                                  infoBox("Adoptions", 30, icon = icon("heart"), fill = TRUE),
                                  infoBox("Animals", 100, icon = icon("paw"), fill = TRUE, color = "teal")
                                ),
                                fluidRow(
                                  box(
                                    title = "Age Distribution", status = "primary", solidHeader = TRUE,
                                    collapsible = TRUE,
                                    dataTableOutput("animal_age"),
                                    width = "100%"
                                  )
                                  
                                )),
                        tabItem(tabName = "new",
                                fluidRow(align = "center", h1("Animal's History")),
                                hr(),
                                fluidRow(
                                  column(4,
                                         uiOutput("kids"))),
                                  fluidRow(
                                    column(12,
                                    textInput("cat_location", h4("Where is your cat kept during the day?"), width = "100%"))
                                  ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_run", h4("Does your cat have full run of the house?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_lap", h4("Does your cat like to sit on your lap?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_hide", h4("Does your cat hide?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("accidents")),
                                  column(6,
                                         uiOutput("miss_litter"))     
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_box_location", h4("Where do you keep the litter box?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_food", h4("What does your cat like to eat?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_treats", h4("What treats do you give your cat (ex: Catnip)?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("cat_bath")
                                         ),
                                  column(6,
                                         uiOutput("cat_groomed")
                                         )
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("cat_behave")
                                         ),
                                  column(6,
                                         uiOutput("cat_groomed_location")
                                         )
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("cat_w_dog")
                                         ),
                                  column(6,
                                         uiOutput("cat_w_cat")
                                         )
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_sleep", h4("Where does your cat sleep?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("cat_active")
                                         ),
                                  column(6,
                                         textInput("cat_active_explain", h4("Explain"), width = "100%")
                                         )
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("cat_toys", h4("What toys does your cat like?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         textInput("cat_flea_cntrl", h4("What flea control do you use?"), width = "100%")),
                                  column(6,
                                         textInput("cat_flea_cntrl_due", h4("Due?"), width = "100%")
                                         )
                                ),
                                fluidRow(
                                  column(12,
                                         uiOutput("cat_shots"))
                                ),
                                fluidRow(
                                  column(6,
                                         checkboxInput("cat_shot_needed",
                                                       h4("What shots does your cat need?"),
                                                       choices = c("Vac A", "Vac B", "Vac C"))
                                         )
                                )
                                ),
                        tabItem(tabName = "adoptions"),
                        tabItem(tabName = "current"),
                        tabItem(tabName = "staff")
                      )
                      
                    )
)

server <- function(input, output, session) {
  
  # output$message_menu <- renderMenu({
  #   msgs <- apply(messageData, 1, function(row) {
  #     messageItem(from = row[["from"]], message = row[["message"]])
  #   })
  #   dropdownMenu(type = "messages", .list = msgs)
  # })
  
  #animal age output in 'overview' tab
  # output$animal_age <- renderDataTable({
  #   datatable(myAnimalData, options = list(searching = FALSE,
  #                                          initComplete = JS(
  #                                            "function(settings, json) {",
  #                                            "$(this.api().table().header()).css({'background-color': '#fff', 'color': '#000'});",
  #                                            "}")))
  # })
  
  kids_list <- c("Children Of All Ages", "Only 12+", "Not Good With Kids")
  
  output$kids <- renderUI({
    selectInput("kids",
                h4("Good With Kids?"),
                choices = kids_list)
  })
  
  # output$kids_explain <- renderUI({
  #   textInput("explain", "Explain", width = "90%")
  # })
  
  output$accidents <- renderUI({
    selectInput("accidents",
                h4("Does your cat ever have accidents?"),
                   choices = c("Yes", "No"))
  })
  
  output$miss_litter <- renderUI({
    selectInput("miss_litter",
                h4("Does your cat ever miss the litter box?"),
                   choices = c("Yes", "No"))
  })
  
  output$cat_bath <- renderUI({
    selectInput("cat_bath",
                h4("Does your cat like taking a bath?"),
                choices = c("Yes", "No"))
  })
  
  output$cat_groomed <- renderUI({
    selectInput("cat_groomed",
                h4("Is your cat groomed?"),
                choices = c("Yes", "No"))
  })
  
  output$cat_groomed_location <- renderUI({
    req(input$cat_groomed == "Yes")
    textInput("cat_groomed_location", h4("Where?"), width = "100%")
  })
  
  output$cat_behave <- renderUI({
    selectInput("cat_behave",
                h4("Does your cat behave?"),
                choices = c("Yes", "No"))
  })
  
  output$cat_w_dog <- renderUI({
    selectInput("cat_w_dog",
                h4("Has your cat been around dogs?"),
                choices = c("Yes", "No"))
  })
  output$cat_w_cat <- renderUI({
    selectInput("cat_w_cat",
                h4("Has your cat been around other cats?"),
                choices = c("Yes", "No"))
  })
  
  output$cat_active <- renderUI({
    selectInput("cat_active",
                h4("Is your cat very active?"),
                choices = c("Yes", "No"))
  })
  
  output$cat_shots <- renderUI({
    selectInput("cat_shots",
                h4("Is your cat up to date on shots?"),
                choices = c("Yes", "No"))
  })
  
}

shinyApp(ui, server)
