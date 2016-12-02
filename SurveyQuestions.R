### Multi-Q ###
q_nationality <- c('Nat_TimeSpent',            # 1.1 Я провел(а) много времени, пытаясь узнать больше о моей нации, об ее истории, традициях и обычаях.
                   'Nat_SocialGroups',         # 1.2 Я активный член в организациях или социальных группах, которые включают в себя в основном людей моей собственной национальности.
                   'Nat_Feeling',              # 1.3 У меня есть четкое ощущение моей национальности и того, что это означает для меня.
                   'Nat_Influence',            # 1.4. Я много думаю о том, насколько моя национальная принадлежность влияет на мою жизнь.
                   'Nat_Happiness',            # 1.5. Я счастлив(а) иметь ту национальность, к которой я принадлежу.
                   'Nat_Belonging',            # 1.6. У меня есть сильное чувство принадлежности к своей собственной национальности.
                   'Nat_Importance',           # 1.7. Я очень хорошо понимаю, что моя национальность значит для меня.
                   'Nat_Speaking',             # 1.8. Для того, чтобы узнать больше о моей национальности, я часто беседую с другими людьми о моей национальной принадлежности.
                   'Nat_Pride',                # 1.9. У меня есть чувство гордости в отношении моей национальности.
                   'Nat_CulturalActivities',   # 1.10. Я принимаю участие в культурных практиках, относящихся к моей национальности, например, приготовление особых блюд, исполнение или прослушивание национальной музыка, почитание традиций и обычаев.
                   'Nat_Attachment',           # 1.11. Я чувствую сильную привязанность в отношении моей национальности.
                   'Nat_Liking')               # 1.12. Я чувствую себя хорошо относительно моего культурного и национального происхождения.

q_language <- c('LanguageFinnish',           					
                'LanguageEstonian',
                'LanguageSwedish',
                'LanguageEnglish',
                'LanguageGerman')

q_state_language <- c('StateLanguageListen',      # 12. Насколько Вы владеете финским языком?  		
                      'StateLanguageRead',
                      'StateLanguageSpeak',
                      'StateLanguageWrite')

q_child_school <- c('ChildSchool_State',        # 15. Вопрос к тем, у кого есть дети. Какого вида средняя школа или гимназия, в которой Ваши дети сейчас учатся?  						
                    'ChildSchool_Immersion',
                    'ChildSchool_Mixed',
                    'ChildSchool_Bilingual',
                    'ChildSchool_Russian',
                    'ChildSchool_Foreign',
                    'ChildSchool_None',
                    'ChildSchool_NotSure')

q_satisfaction <- c('Satisfaction_Work',
                    'Satisfaction_Safety',
                    'Satisfaction_Home',
                    'Satisfaction_Family',
                    'Satisfaction_Material',
                    'Satisfaction_Friends')

q_agree <- c('Agree_FutureHope',         # 24.1 Я смотрю в будущее с надеждой
             'Agree_NotRecognised',      # 24.2. То, что я делаю, не получает признания
             'Agree_SecondClassCitizen', # 24.3. Я чувствую себя в обществе человеком второго сорта
             'Agree_DefendInterests',    # 24.4. Я могу защитить свои интересы
             'Agree_LookFromAbove',      # 24.5. Из-за моего низкого дохода или работы люди смотрят на меня «сверху вниз»
             'Agree_NoInfluence')        # 24.6. У меня нет возможности влиять на общество

q_importance_state <- c('ImportanceState_NameFamily',  # 25. Насколько важно по Вашему мнению, для неФИННОФ/ЭСТОНЦЕВ следующее, чтобы достичь успеха в Финляндии?  					
                        'ImportanceState_Citizenship',
                        'ImportanceState_Language',
                        'ImportanceState_Friends',
                        'ImportanceState_School',
                        'ImportanceState_Behaviour',
                        'ImportanceState_Other')

q_equal_opp <- c('EqualOpp_Work',            # 26. Замечали ли Вы, что в Финляндии нефинны имеют одинаковые возможности с финнами при прочих равных условиях достичь следующего…?  							
                 'EqualOpp_StateWork',
                 'EqualOpp_HeadWork',
                 'EqualOpp_Business',
                 'EqualOpp_Politics',
                 'EqualOpp_Education',
                 'EqualOpp_StartUp',
                 'EqualOpp_Pay',
                 'EqualOpp_Benefit')

surveyQuestions <- c('count',
           'Country',
           'Time', 
           'Nationality_Self',
            q_nationality,             # 1. Nationality factors
           'Nationality_Father',       # 2. Национальность моего отца
           'Nationality_Mother',       # 3. Национальность моей матери
           'Gender',                   # 4. Ваш пол:
           'Age',                      # 5. Ваш возраст _______ лет
           'FamilyStatus',             # 6. Каково Ваше семейное положение в настоящее время? Вы…?
           'PlaceBirth',               # 7. Место Вашего рождения:
           'TimeInCountry',            # 8. Сколько всего лет Вы живёте в СТРАНЕ? Запишите, пожалуйста, число полных лет:
           'ReasonForMoving',          # 9. Вопрос к тем, кто переехал в Финляндию. Что послужило причиной Вашего переезда?  
           'ReasonForMoving_Other',
           q_language,                   # 10. Какими языками Вы владеете, кроме родного, и на каком уровне?
           'Language_Other',
           'Language_Other_Name',
           'NativeLanguage',             # 11. Какой язык является для Вас родным?
           'NativeLanguage_Other',
           q_state_language,             # 12. Насколько Вы владеете финским языком?  		
           'StateLanguageSatisfaction',# 13. Как вы считаете, достаточно ли Вам Вашего знания финского языка для жизни в Финляндии?
           'Religion',                 # 14. Какая из нижеперечисленных религий Вам ближе всего?
           'Religion_Other',
           q_child_school,              # 15. Вопрос к тем, у кого есть дети. Какого вида средняя школа или гимназия, в которой Ваши дети сейчас учатся?  						
           'Education',                # 16. Ваше образование?  
           'Education_Other',
           'Occupation',               # 17. Какова сейчас Ваша основная деятельность?  
           'Occupation_Other',
           'IncomeLevel',              # 18. Как Вы оцениваете Ваш доход?
           'IncomeFuture',             # 19. Как Вы считаете, через пять лет экономическое положение Вашей семьи, по сравнению с нынешним, будет …?
           'IncomePersonal',           # 20. Какой был Ваш личный доход за прошедший месяц?
           'IncomeAssessment',         # 21. Какое из представленных описаний, по Вашему мнению, наиболее точно описывает уровень дохода Вашей семьи в нынешнее время?
           'Satisfaction',             # 22. Скажите, пожалуйста, насколько Вы удовлетворены своей жизнью в целом в настоящее время?
           q_satisfaction,             # 23. Скажите, пожалуйста, насколько Вы удовлетворены…?
           q_agree,
           q_importance_state, # 25. Насколько важно по Вашему мнению, для неФИННОФ/ЭСТОНЦЕВ следующее, чтобы достичь успеха в Финляндии?  					
           q_equal_opp,         # 26. Замечали ли Вы, что в Финляндии нефинны имеют одинаковые возможности с финнами при прочих равных условиях достичь следующего…?  							
           'Equality',                 # 27. Как бы Вы оценили положение финнов и нефиннов в обществе Финляндии?
           'WayOfLife',                # 28. Как Вы считаете, похож ли образ жизни и мыслей финнов, по сравнению с Вашим ...? Почему?
           'Integration',              # 29. Насколько успешной была до сих пор, по Вашему мнению, интеграция нефиннов в финское общество?
           'Democracy',                # 30. В конституции сказано, что в финском государстве власть принадлежит народу. Считаете ли Вы себя частью финского народа с точки зрения конституции? Почему?
           'Emigration_1',             # 31. Если бы Вам предложили переехать на постоянное место жительства в другую страну, то в какую страну Вы бы хотели переехать?
           'Emigration_2')

### to Integer ###
toInteger <- c('count',
               q_nationality,
               'Gender',
               'Age',
               'FamilyStatus',
               'TimeInCountry',
               'ReasonForMoving',
               q_language,
               'Language_Other',
               'NativeLanguage',
               q_state_language,
               'Religion',
               q_child_school,
               'Education',
               'Occupation',
               'IncomeLevel',
               'IncomeFuture',
               'IncomePersonal',
               'IncomeAssessment',
               'Satisfaction',
               q_satisfaction,
               q_agree,
               q_importance_state,
               q_equal_opp)


toFactor <- c('Country',
              'Gender',
              'FamilyStatus',
              'NativeLanguage',
              'Religion',
              'Education',
              'Occupation',
              q_state_language,
              q_language)

             

### Clean 5s ###
clean5s <- c(q_satisfaction,
             q_agree,
             q_equal_opp)

### Clean True ###
cleanTrue = c(q_child_school)

invertValues = c(q_state_language,
                 q_equal_opp)