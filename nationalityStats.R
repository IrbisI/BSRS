# Source functions for analysis
source("stringGrouping.R")

# Nationality analysis
nationalities = c("русс", "эст", "фин", "коми", "инг", "карел", "сету",
                  "укр", "бел", "татар", "армя",  "лат", "лит", "поля")

stringGrouping("Nationality_Self", nationalities)
stringGrouping("Nationality_Father", nationalities)
stringGrouping("Nationality_Mother", nationalities)

# Country analysis
countries = c("росс", "эст", "фин",
              "укр", "бел", "татар", "арме",  "лат", "лит", "поль",
              "казах", "узбек", "таджи", "киргиз",
              "герм")

stringGrouping("PlaceBirth", countries)

# Emigration analysis
countriesE = c("росс", "эст", "фин",
              "укр", "бел", "татар", "арме",  "лат", "лит", "поль",
              "казах", "узбек", "таджи", "киргиз",
              "герм", "австрия", "англ", "швец", "норв", "дания", "ирлан", "лихт", "люкс",
              "швей", "чех", "словак", "болгар", "хорва",
              "испа", "франц", "итал", "грецию", "португалия", "кипр","монако", 
              "австралия", "новая зеландия", "мальд", "сша", "канада", "индия", "тайланд", "япония")

D$Emigration_A <- do.call(paste, c(D[c("Emigration_1", "Emigration_2")], sep = " ")) 

#stringGrouping("Emigration_1", countriesE)
#stringGrouping("Emigration_2", countriesE)

stringGrouping("Emigration_A", countriesE)

# Languages

languages = c("эст", "выру", 
              "франц", "испа", "итал", "порт", 
              "укр", "поль", "армя", "татар", "болг", "бел", "чешс", "латы", 
              "киргиз", "узбек", "карель", "сету", 
              "кита", "корей", "венг", "датс" )

stringGrouping("Language_Other_Name", languages)
