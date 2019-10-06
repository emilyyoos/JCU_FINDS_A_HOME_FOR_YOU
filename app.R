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
                        menuItem("New Arrivals", tabName = "new", icon = icon("paw"),
                                 menuSubItem("Cat / Kitten", tabName = "cat_kitten"),
                                 menuSubItem("Dog / Puppy", tabName = "dog_puppy")),
                        menuItem("Adoptions", tabName = "adoptions", icon = icon("heart"),
                                 menuSubItem("Cat / Kitten", tabName = "adopt_cat_kitten"),
                                 menuSubItem("Dog / Puppy", tabName = "adopt_dog_puppy")),
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
                        tabItem(tabName = "cat_kitten",
                                fluidRow(align = "center", h1("Cat's History")),
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
                                  # column(6,
                                  #        checkboxInput("cat_shot_needed",
                                  #                      h4("What shots does your cat need?"),
                                  #                      choices = c("Vac A", "Vac B", "Vac C"))
                                  #        )
                                ),
                                fluidRow(
                                  column(6,
                                         textInput("cat_notes", h4("What do you want to tell the new owner about your pet?"), width = "100%")
                                         ),
                                  column(6,
                                         uiOutput("cat_contact")
                                         )
                                )
                                ),
                        tabItem(tabName = "dog_puppy",
                                fluidRow(align = "center", h1("Dog's History")),
                                hr(),
                                fluidRow(
                                  column(4,
                                         uiOutput("dog_kids"))),
                                fluidRow(
                                  column(12,
                                         textInput("dog_location", h4("Where is dog kept during the day?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_run", h4("Does your dog have full run of the house?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_hold", h4("How long can your dog hold it's urine?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_accidents")),
                                  column(6,
                                         uiOutput("dog_leg"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_food", h4("What does your dog like to eat?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_treats", h4("What treats do you give your dog (ex: Rawhides, Bones)?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_bath")
                                  ),
                                  column(6,
                                         uiOutput("dog_groomed")
                                  )
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_groomed_location")
                                  ),
                                  column(6,
                                         uiOutput("dog_beg")
                                  )
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_brush")
                                         ),
                                  column(6,
                                         uiOutput("dog_teeth")
                                         )
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_behave")
                                  ),
                                  column(6,
                                         uiOutput("dog_w_cat")
                                  )
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_tricks", h4("What tricks does your dog know?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_leash")
                                         ),
                                  column(6,
                                         uiOutput("dog_pull")
                                         )
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_sleep", h4("Where does your dog sleep?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_active")),
                                  column(6,
                                         uiOutput("dog_hyper"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_hyper_explain", h4("Explain"), width = "100%"))
                                ),
                                fluidRow(
                                  column(12,
                                         textInput("dog_toys", h4("What toys does your dog like?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_fence")),
                                  column(6,
                                         uiOutput("dog_jump"))
                                ),
                                fluidRow(
                                  column(12,
                                         uiOutput("dog_bark"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_heartworm")),
                                  column(6,
                                         textInput("dog_heartworm_due", h4("Due?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         textInput("dog_flea", h4("What flea control do you use"), width = "100%")),
                                  column(6,
                                         textInput("dog_flea_due", h4("Due?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         uiOutput("dog_shots")),
                                  column(6,
                                         textInput("dog_shots_needed", h4("What shots does your dog need?"), width = "100%"))
                                ),
                                fluidRow(
                                  column(6,
                                         textInput("dog_notes", h4("What would you tell the new owner about your pet?"), width = "100%")),
                                  column(6,
                                         textInput("dog_contact", h4("Is it okay if the new owner contacts you?"), width = "100%"))
                                )
                        ),
                        tabItem(tabName = "adopt_cat_kitten",
                                textOutput("cat_par"),
                                fluidRow(align = "center", h3("Northeast Ohio SPCA Cat and Kitten Adoption Application")),
                                fluidRow(
                                  column(6,
                                         textInput("cat_cntrl_no", h5("Control No."), width = "100%")),
                                  column(6,
                                         textInput("cat_adopt_no", h5("Adoption No."), width = "100%"))
                                ),
                                fluidRow(
                                  column(4,
                                         textInput("cat_cash", h5("Cash"), width = "100%"),
                                         textInput("cat_check", h5("Check"), width = "100%"),
                                         textInput("cat_total", h5("Total"), width = "100%")
                                         ),
                                  column(4,
                                         textInput("cat_breed", h5("Breed"), width = "100%"),
                                         textInput("cat_age", h5("Age"), width = "100%"),
                                         textInput("cat_sex", h5("Sex"), width = "100%")
                                         ),
                                  column(4,textInput("cat_vacc", h5("Vacc"), width = "100%"),
                                         textInput("cat_worm", h5("Wormed"), width = "100%"),
                                         textInput("cat_name", h5("Name"), width = "100%")
                                         )
                                ),
                                hr(),
                                fluidRow(align= "center", h3("Adopter Information")),
                                fluidRow(
                                  column(4,
                                         textInput("adopt_name", h5("Adopter's Name"), width = "100%"),
                                         textInput("adopt_address", h5("Address"), width = "100%")
                                         ),
                                  column(4,
                                         textInput("adopt_phone", h5("Phone"), width = "100%"),
                                         textInput("adopt_city", h5("City/State"), width = "100%")
                                         ),
                                  column(4,
                                         textInput("adopt_email", h5("Email"), width = "100%"),
                                         textInput("adopt_zip", h5("Zip"), width = "100%")
                                         )
                                ),
                                fluidRow(align = "center", h3("References")),
                                fluidRow(
                                  column(4, 
                                         textInput("ref_1", h5("Reference Name"), width = "100%"),
                                         textInput("ref_2", h5("Reference Name"), width = "100%")
                                         ),
                                  column(4,
                                         textInput("ref_1_add", h5("Reference Address"), width = "100%"),
                                         textInput("ref_2_add", h5("Reference Address"), width = "100%")
                                         ),
                                  column(4,
                                         textInput("ref_1_phone", h5("Reference Phone"), width = "100%"),
                                         textInput("ref_2_phone", h5("Reference Phone"), width = "100%")
                                         )
                                ),
                                fluidRow(align = "center", h3("Adoption Information")),
                                fluidRow(
                                  column(4,
                                         uiOutput("pet_for"),
                                         uiOutput("adopt_fam"),
                                         uiOutput("adopt_lease"),
                                         textInput("adopt_pet_loc", h5("Where will your pet be kept?", width = "100%")),
                                         uiOutput("adopt_other_pets"),
                                         uiOutput("adopt_other_pets_where"),
                                         uiOutput("adopt_before"),
                                         uiOutput("adopt_before_concl"),
                                         uiOutput("adopt_spca"),
                                         textInput("adopt_occ", h5("Occupation"), width = "100%"),
                                         textInput("adopt_sup", h5("Supervisor's Name"), width = "100%")
                                         ),
                                  column(4,
                                         uiOutput("adopt_single"),
                                         uiOutput("adopt_work"),
                                         uiOutput("adopt_move"),
                                         uiOutput("adopt_allergies"),
                                         uiOutput("adopt_other_pets_y"),
                                         uiOutput("adopt_other_pets_length"),
                                         uiOutput("adopt_before_length"),
                                         br(),
                                         uiOutput("adopt_spca_concl"),
                                         textInput("adopt_business", h5("Business Phone"), width = "100%"),
                                         textInput("adopt_vet", h5("Vet's Name"), width = "100%")
                                         ),
                                  column(4,
                                         uiOutput("adopt_live"),
                                         uiOutput("adopt_hours"),
                                         uiOutput("adopt_move_y"),
                                         br(),
                                         br(),
                                         br(),
                                         uiOutput("adopt_before_breed"),
                                         br(),
                                         textInput("adopt_comp", h5("Company"), width = "100%")
                                         )
                                ),
                                fluidRow(align = "center", h3("Signature")),
                                fluidRow(textOutput("cat_adopt_agree")),
                                fluidRow(
                                  column(6,
                                         textInput("adopt_sig", h5("Adopter's Signature"), width = "100%")
                                         ),
                                  column(6,
                                         textInput("adopt_date", h5("Date"), width = "100%")
                                         )
                                ),
                                fluidRow(
                                  checkboxInput("info", "Send me information on upcoming shelter events!")
                                ),
                                fluidRow(textOutput("cat_adopt_concl"))
                                ),
                        tabItem(tabName = "adopt_dog_puppy"),
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
  
  output$cat_contact <- renderUI({
    selectInput("cat_contact",
                h4("Is it okay if the new owner contacts you?"),
                choices = c("Yes", "No"))
  })
  #####
  
  kids_list_dog <- c("Children Of All Ages", "Only 12+", "Not Good With Kids")

  output$dog_kids <- renderUI({
    selectInput("dog_kids",
                h4("Good With Kids?"),
                choices = kids_list_dog)
  })
  # 
  # # output$kids_explain <- renderUI({
  # #   textInput("explain", "Explain", width = "90%")
  # # })
  # 
  output$dog_accidents <- renderUI({
    selectInput("dog_accidents",
                h4("Does your dog ever have accidents?"),
                choices = c("Yes", "No"))
  })

  output$dog_leg <- renderUI({
    selectInput("dog_leg",
                h4("Does your dog lift its leg?"),
                choices = c("Yes", "No"))
  })
  # #####
  output$dog_bath <- renderUI({
    selectInput("dog_bath",
                h4("Does your dog like taking a bath?"),
                choices = c("Yes", "No"))
  })

  output$dog_groomed <- renderUI({
    selectInput("dog_groomed",
                h4("Is your dog groomed?"),
                choices = c("Yes", "No"))
  })

  output$dog_groomed_location <- renderUI({
    req(input$dog_groomed == "Yes")
    textInput("dog_groomed_location", h4("Where?"), width = "100%")
  })

  output$dog_beg <- renderUI({
    selectInput("dog_beg",
                h4("Does your dog beg for table food?"),
                choices = c("Yes", "No"))
  })

  output$dog_behave <- renderUI({
    selectInput("dog_behave",
                h4("Does your dog behave?"),
                choices = c("Yes", "No"))
  })

  output$dog_brush <- renderUI({
    selectInput("dog_brush",
                h4("Does your dog like to be brushed?"),
                choices = c("Yes", "No"))
  })

  output$dog_teeth <- renderUI({
    selectInput("dog_teeth",
                h4("Does you brush your dog's teeth?"),
                choices = c("Yes", "No"))
  })


  output$dog_w_cat <- renderUI({
    selectInput("dog_w_cat",
                h4("Has your dog been around cats?"),
                choices = c("Yes", "No"))
  })

  output$dog_leash <- renderUI({
    selectInput("dog_leash",
                h4("Does your dog walk on a leash?"),
                choices = c("Yes", "No")
                )
  })

  output$dog_pull <- renderUI({
    selectInput("dog_pull",
                h4("Does your dog pull?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_active <- renderUI({
    selectInput("dog_active",
                h4("Is your dog active?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_hyper <- renderUI({
    selectInput("dog_hyper",
                h4("Is your dog hyper?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_fence <- renderUI({
    selectInput("dog_fence",
                h4("Do you keep your dog in a fenced yard?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_jump <- renderUI({
    req(input$dog_fence == "Yes")
    selectInput("dog_jump",
                h4("Does your dog try to jump the fence?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_bark <- renderUI({
    selectInput("dog_bark",
                h4("Does your dog bark a lot?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_heartworm <- renderUI({
    selectInput("dog_heartworm",
                h4("Is your dog on heartworm medication?"),
                choices = c("Yes", "No")
    )
  })
  
  output$dog_shots <- renderUI({
    selectInput("dog_shots",
                h4("Is your dog up to date on it's shots?"),
                choices = c("Yes", "No")
    )
  })
  
  output$cat_par <- renderText({
    "We do not guarantee the behavior or health of any animal adopted from the shelter. The information we
    have on the pets had been provided by the former owners or foster homes. Adult animals are not
    recommended to families with small children. If your pet becomes sick within two weeks, contact the Pet
    Shelter immediately. If you go to another facility we do not reimburse your expenses 216-351-7387"
  })
  
  output$pet_for <- renderUI({
    selectInput(
      "pet_for",
      h5("Who is this pet for?"),
      choices = c("Self", "Gift", "Other"),
      width = "100%"
    )
  })
  
  output$adopt_single <- renderUI({
    selectInput("adopt_single",
                h5("Are you single?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_live <- renderUI({
    selectInput("adopt_live",
                h5("Do you live alone?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_fam <- renderUI({
    selectInput("adopt_fam",
                h5("Do you live with family?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_work <- renderUI({
    selectInput("adopt_work",
                h5("Do you work?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_hours <- renderUI({
    req(input$adopt_work == "Yes")
    textInput("adopt_hours", h5("What are your work hours?"), width = "100%")
  })
  
  output$adopt_lease <- renderUI({
    selectInput("adopt_lease",
                h5("Does your lease allow pets?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_move <- renderUI({
    selectInput("adopt_move",
                h5("Are you moving?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_move_y <- renderUI({
    req(input$adopt_move == "Yes")
    textInput("adopt_move_y", h5("When?"), width = "100%")
  })
  
  output$adopt_allergies <- renderUI({
    selectInput("adopt_allergies",
                h5("Allergies?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_other_pets <- renderUI({
    selectInput("adopt_other_pets",
                h5("Do you have other pets?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_other_pets_y <- renderUI({
    req(input$adopt_other_pets == "Yes")
    textInput("adopt_other_pets_y", h5("What kind?"), width = "100%")
  })
  
  output$adopt_other_pets_where <- renderUI({
    req(input$adopt_other_pets == "Yes")
    textInput("adopt_other_pets_where", h5("Where did you get your pet?"), width = "100%")
  })
  
  output$adopt_other_pets_length <- renderUI({
    req(input$adopt_other_pets == "Yes")
    textInput("adopt_other_pets_length", h5("How long did you have it?"), width = "100%")
  })
  
  output$adopt_before <- renderUI({
    selectInput("adopt_before",
                h5("Have you had a pet before?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_before_length <- renderUI({
    req(input$adopt_before == "Yes")
    textInput("adopt_before_length", h5("How long did you have it?"), width = "100%")
  })
  
  output$adopt_before_breed <- renderUI({
    req(input$adopt_before == "Yes")
    textInput("adopt_before_breed", h5("Breed?"), width = "100%")
  })
  
  output$adopt_before_concl <- renderUI({
    req(input$adopt_before == "Yes")
    textInput("adopt_before_concl", h5("What happened to the pet?"), width = "100%")
  })
  
  output$adopt_spca <- renderUI({
    selectInput("adopt_spca",
                h5("Have you ever adopted from the SPCA before?"),
                choices = c("Yes", "No"),
                width = "100%"
    )
  })
  
  output$adopt_spca_concl <- renderUI({
    req(input$adopt_spca == "Yes")
    textInput("adopt_spca_concl", h5("What happened to the pet?"), width = "100%")
  })
  
  output$cat_adopt_concl <- renderText({
    "We do not guarantee the behavior or health of any animal adopted from the shelter. The information we
    have on the pets had been provided by the former owners or foster homes. Adult animals are not
    recommended to families with small children. If your pet becomes sick within two weeks, contact the Pet
    Shelter immediately. If you go to another facility we do not reimburse your expenses 216-351-7387"
    
  })
  
  output$cat_adopt_agree <- renderText({
    "I have read and I accept the terms of the adoption agreement printed on this application."
  })
  
}

shinyApp(ui, server)
