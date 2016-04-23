['Akan', 'Amharic', 'Arabic', 'Assamese', 'Awadhi', 'Azerbaijani', 'Balochi', 'Belarusian', 'Bengali', 'Bhojpuri', 'Burmese', 'Cantonese', 'Cebusano', 'Chewa', 'Chhattisgarhi', 'Chittagonian', 'Czech', 'Deccan', 'Dhundhari', 'Dutch', 'English', 'French', 'Fula', 'Gan', 'German', 'Greek', 'Gujarati', 'Haitian Creole', 'Hakka', 'Haryanvi', 'Hausa', 'Hiligaynon', 'Hindi', 'Hmong', 'Hungarian', 'Igbo', 'Ilokano', 'Italian', 'Indonesian', 'Japanese', 'Javanese', 'Jin', 'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Kirundi', 'Konkani', 'Korean', 'Kurdish', 'Madurese', 'Magahi', 'Maithili', 'Malagasy', 'Malayalam', 'Mandarin', 'Marathi', 'Marwari', 'Min Bei', 'Min Dong', 'Min Nan', 'Mossi', 'Nepali', 'Oriya', 'Oromo', 'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi', 'Quechua', 'Romanian', 'Russian', 'Saraiki', 'Serbo-Croatian', 'Shona', 'Sindhi', 'Sinhalese', 'Somali', 'Spanish', 'Sundanese', 'Swahili', 'Swedish', 'Sylheti', 'Tagalog', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukrainian', 'Urdu', 'Uyghur', 'Uzbek', 'Vietnamese', 'Wu', 'Xhoas', 'Xiang', 'Yoruba', 'Zhuang', 'Zulu' ].each do |name|
  LanguageName.find_or_create_by({name: name})
end

['Native', 'Bilingual', 'Proficient', 'Intermediate', 'Beginner'].each do |level|
  LanguageLevel.find_or_create_by({level: level})
end

['Bar', 'Cafe', 'Restaurant', 'Fast Food', 'Shop'].each do |type|
  BusinessType.find_or_create_by({name: type})
end

['Waiting staff', 'Bar staff', 'Barista', 'Chef', 'Shop Staff', 'Kitchen Staff', 'Kitchen Porter', 'Manager', 'Assistant Manager', 'Supervisor'].each do |bracket|
  JobBracket.find_or_create_by({name: bracket})
end

['Full time', 'Part time', 'Full & Part time', 'Temp', 'Seasonal', 'One off', 'Nights'].each do |category|
  JobCategory.find_or_create_by({name: category})
end

['£ 6.70 - 7.50', '£ 7.50 - 10.00', '£ 10.00 - 12.50', '£ 12.50 - 15.00', '£ 15.00 - 17.50', '£ 17.50 - 20.00', '£ 20.00 +'].each do |wage|
  JobWage.find_or_create_by({name: wage})
end

['10+', '20+', '30+', '40+', '50+', '60+', '70+', '80+'].each do |hour|
  WeeklyHour.find_or_create_by({name: hour})
end

london_list = [
[ "St Barts", "EC1A", "Central East" ], [ "Farringdon", "EC1M", "Central East" ], [ "Hatton Garden", "EC1N", "Central East" ], [ "Clerkenwell", "EC1P", "Central East" ], [ "Finsbury", "EC1R", "Central East" ], [ "Finsbury", "EC1V", "Central East" ], [ "St Luke's", "EC1Y", "Central East" ], 
[ "Shoreditch", "EC2A", "Central East" ], [ "Liverpool Street", "EC2M", "Central East" ], [ "Old Broad Street", "EC2N", "Central East" ], [ "Tower Hill", "EC2N", "Central East" ], [ "Clerkenwell", "EC2P", "Central East" ], [ "Bank of England", "EC2R", "Central East" ], [ "Guildhall", "EC2V", "Central East" ], [ "Barbican", "EC2Y", "Central East" ],
[ "Aldgate", "EC3A", "Central East" ], [ "Lloyd's of London", "EC3M", "Central East" ], [ "Tower Hamlets", "EC3N", "Central East" ], [ "Monument", "EC3R", "Central East" ], [ "Cornhill", "EC3V", "Central East" ], [ "Clerkenwell", "EC3P", "Central East" ], 
[ "Fetter Lane", "EC4A", "Central East" ], [ "St Paul's", "EC4M", "Central East" ], [ "Mansion House", "EC4N", "Central East" ], [ "Clerkenwell", "EC4P", "Central East" ], [ "Cannon Street", "EC4R", "Central East" ], [ "Blackfriars", "EC4V", "Central East" ], [ "Temple", "EC4Y", "Central East" ], [ "Southwark", "SE1", "Central East" ], [ "Southwark", "SE1P", "Central East" ],
[ "Oxford Street", "WC1A", "Central West" ], [ "Bloomsbury", "WC1B", "Central West" ], [ "UCL", "WC1E", "Central West" ], [ "St Pancras", "WC1H", "Central West" ], [ "Russell Square", "WC1N", "Central West" ], [ "Gray's Inn", "WC1R", "Central West" ], [ "Holborn", "WC1V", "Central West" ], [ "Kings Cross", "WC1X", "Central West" ], 
[ "Chancery Lane", "WC2A", "Central West" ], [ "Drury Lane", "WC2B", "Central West" ], [ "Covent Garden", "WC2E", "Central West" ], [ "Leicester Square", "WC2H", "Central West" ], [ "Charing Cross", "WC2N", "Central West" ], [ "Somerset House", "WC2R", "Central West" ], [ "Westminster", "SW1", "Central West" ], [ "St James's", "SW1A", "Central West" ], [ "St James's", "SW1E", "Central West" ], 
[ "St James's", "SW1H", "Central West" ], [ "Westminster", "SW1P", "Central West" ], [ "Westminster", "SW1V", "Central West" ], [ "Westminster", "SW1W", "Central West" ], [ "Westminster", "SW1X", "Central West" ], [ "Westminster", "SW1Y", "Central West" ], [ "Marble Arch", "W1", "Central West" ], [ "Westminster", "W1A", "Central West" ], [ "Marylebone High Street", "W1B", "Central West" ], 
[ "Marylebone High Street", "W1C", "Central West" ], [ "West End", "W1D", "Central West" ], [ "West End", "W1F", "Central West" ], [ "Marylebone High Street", "W1G", "Central West" ], [ "Marylebone High Street", "W1H", "Central West" ], [ "West End", "W1J", "Central West" ], [ "Knightsbridge", "W1K", "Central West" ], [ "West End", "W1M", "Central West" ], [ "West End", "W1N", "Central West" ], 
[ "Camden", "W1P", "Central West" ], [ "West End", "W1R", "Central West" ], [ "West End", "W1S", "Central West" ], [ "Tottenham Court Road", "W1T", "Central West" ], [ "Marylebone High Street", "W1U", "Central West" ], [ "West End", "W1V", "Central West" ], [ "Marylebone High Street", "W1W", "Central West" ], [ "West End", "W1X", "Central West" ], [ "West End", "W1Y", "Central West" ], [ "Paddington", "W2", "Central West "], 
[ "Stepney", "E1", "East" ], [ "Limehouse", "E1W", "East" ], [ "Bethnal Green", "E2", "East" ], [ "Bow", "E3", "East" ], [ "Chingford", "E4", "East" ], [ "Clapton", "E5", "East" ], [ "East Ham", "E6", "East" ], [ "Forest Gate", "E7", "East" ], [ "Hackney", "E8", "East" ], [ "Homerton", "E9", "East" ], [ "Leyton", "E10", "East" ], [ "Leytonstone", "E11", "East" ], [ "Manor Park", "E12", "East" ], 
[ "Plaistow", "E13", "East" ], [ "Poplar", "E14", "East" ], [ "Stratford", "E15", "East" ], [ "Victoria Docks & North Woolwich", "E16", "East" ], [ "Walthamstow", "E17", "East" ], [ "Woodford & South Woodford", "E18", "East" ], [ "Newham", "E20", "East" ], [ "Tower Hamlets", "E98", "East" ], [ "Acton", "W3", "West" ], [ "Chiswick", "W4", "West" ], [ "Ealing", "W5", "West" ], [ "Hammersmith", "W6", "West" ], 
[ "Hanwell", "W7", "West" ], [ "Kensington", "W8", "West" ], [ "Maida Hill", "W9", "West" ], [ "North Kensington", "W10", "West" ], [ "Notting Hill", "W11", "West" ], [ "Shepherds Bush", "W12", "West" ], [ "West Ealing", "W13", "West" ], [ "West Kensington", "W14", "West" ], [ "Islington", "N1", "North" ], [ "East Fintchley", "N2", "North" ], [ "Finchley Church End", "N3", "North" ], [ "Finsbury Park", "N4", "North" ], 
[ "Highbury", "N5", "North" ], [ "Highgate", "N6", "North" ], [ "Holloway", "N7", "North" ], [ "Hornsey", "N8", "North" ], [ "Lower Edmonton", "N9", "North" ], [ "Muswell Hill", "N10", "North" ], [ "New Southgate", "N11", "North" ], [ "North Finchley", "N12", "North" ], [ "Palmers Green", "N13", "North" ], [ "Southgate", "N14", "North" ], [ "South Tottenham", "N15", "North" ], [ "Stoke Newington", "N16", "North" ], 
[ "Tottenham", "N17", "North" ], [ "Upper Edmonton", "N18", "North" ], [ "Upper Holloway", "N19", "North" ], [ "Camden", "N1C", "North" ], [ "Islington", "N1P", "North" ], [ "Whetstone", "N20", "North" ], [ "Winchmore Hill", "N21", "North" ], [ "Wood Green", "N22", "North" ], [ "Hornsey", "N81", "North" ], [ "Brixton", "SW2", "South West" ], [ "Clapham", "SW4", "South West" ], [ "Earls Court", "SW5", "South West" ], 
[ "Fulham", "SW6", "South West" ], [ "South Kensington", "SW7", "South West" ], [ "South Lambeth", "SW8", "South West" ], [ "Stockwell", "SW9", "South West" ], [ "West Brompton", "SW10", "South West" ], [ "Battersea", "SW11", "South West" ], [ "Balham", "SW12", "South West" ], [ "Barnes", "SW13", "South West" ], [ "Mortlake", "SW14", "South West" ], [ "Putney", "SW15", "South West" ], [ "Streatham", "SW16", "South West" ], 
[ "Tooting", "SW17", "South West" ], [ "Wandsworth", "SW18", "South West" ], [ "Wimbledon", "SW19", "South West" ], [ "West Wimbledon", "SW20", "South West" ], [ "Lambeth", "SW95", "South West" ], [ "Abbey Wood", "SE2", "South East" ], [ "Blackheath", "SE3", "South East" ], [ "Brockley", "SE4", "South East" ], [ "Camberwell", "SE5", "South East" ], [ "Catford", "SE6", "South East" ], [ "Charlton", "SE7", "South East" ], 
[ "Deptford", "SE8", "South East" ], [ "Eltham", "SE9", "South East" ], [ "Greenwich", "SE10", "South East" ], [ "Kennington", "SE11", "South East" ], [ "Lee", "SE12", "South East" ], [ "Lewisham", "SE13", "South East" ], [ "New Cross", "SE14", "South East" ], [ "Peckham", "SE15", "South East" ], [ "Rotherhithe", "SE16", "South East" ], [ "Walworth", "SE17", "South East" ], [ "Woolwich", "SE18", "South East" ], [ "Norwood", "SE19", "South East" ], 
[ "Anerley", "SE20", "South East" ], [ "Dulwich", "SE21", "South East" ], [ "East Dulwich", "SE22", "South East" ], [ "Forest Hill", "SE23", "South East" ], [ "Herne Hill", "SE24", "South East" ], [ "South Norwood", "SE25", "South East" ], [ "Sydenham", "SE26", "South East" ], [ "West Norwood", "SE27", "South East" ], [ "Thamesmead", "SE28", "South East" ], [ "Camden Town", "NW1", "North West" ], [ "Willseden", "NW10", "North West" ], 
[ "Golders Green", "NW11", "North West" ], [ "Camden", "NW1W", "North West" ], [ "Barnet", "NW2", "North West" ], [ "Camden", "NW26", "North West" ], [ "Hampstead", "NW3", "North West" ], [ "Hendon", "NW4", "North West" ], [ "Kentish Town", "NW5", "North West" ], [ "Kilburn", "NW6", "North West" ], [ "Mill Hill", "NW7", "North West" ], [ "St Johns Wood", "NW8", "North West" ], [ "The Hyde", "NW9", "North West" ], 
]
london_list.each do |area|
  LondonArea.find_or_create_by( :name => area[0], :postcode => area[1], :region => area[2] )
end

['Afghan', 'Albanian', 'Algerian', 'American', 'Andorran', 'Angolan', 'Antiguans', 'Argentinean', 'Armenian', 'Australian', 'Azerbaijani', 
  'Bahamian', 'Bahraini', 'Bangladeshi', 'Barbadian', 'Barbudans', 'Batswana', 'Belarusian', 'Belgian', 'Belizean', 'Beninese', 'Bhutanese', 'Bolivian', 'Bosnian', 'Brazilian', 'British', 'Bruneian', 'Bulgarian', 'Burkinabe', 'Burmese', 'Burundian', 
  'Cambodian', 'Cameroonian', 'Canadian', 'Cape Verdean', 'Central African', 'Chadian', 'Chilean', 'Chinese', 'Colombian', 'Comoran', 'Congolese', 'Costa Rican', 'Croatian', 'Cuban', 'Cypriot', 'Czech', 
  'Danish', 'Djibouti', 'Dominican', 'Dutch', 
  'East Timorese', 'Ecuadorean', 'Egyptian', 'Emirian', 'Equatorial Guinean', 'Eritrean', 'Estonian', 'Ethiopian', 
  'Fijian', 'Filipino', 'Finnish', 'French', 
  'Gabonese', 'Gambian', 'Georgian', 'German', 'Ghanaian', 'Greek', 'Grenadian', 'Guatemalan', 'Guinea-Bissauan', 'Guinean', 'Guyanese', 
  'Haitian', 'Herzegovinian', 'Honduran', 'Hungarian', 
  'I-Kiribati', 'Icelander', 'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish', 'Israeli', 'Italian', 'Ivorian', 
  'Jamaican', 'Japanese', 'Jordanian', 
  'Kazakhstani', 'Kenyan', 'Kittian', 'Kuwaiti', 'Kyrgyz', 
  'Laotian', 'Latvian', 'Lebanese', 'Liberian', 'Libyan', 'Liechtensteiner', 'Lithuanian', 'Luxembourger', 
  'Macedonian', 'Malagasy', 'Malawian', 'Malaysian', 'Maldivan', 'Malian', 'Maltese', 'Marshallese', 'Mauritanian', 'Mauritian', 'Mexican', 'Micronesian', 'Moldovan', 'Monacan', 'Mongolian', 'Moroccan', 'Mosotho', 'Motswana', 'Mozambican', 
  'Namibian', 'Nauruan', 'Nepalese', 'New Zealander', 'Nicaraguan', 'Nigerian', 'Nigerien', 'North Korean', 'Northern Irish', 'Norwegian', 
  'Omani', 
  'Pakistani', 'Palauan', 'Panamanian', 'Papua New Guinean', 'Paraguayan', 'Peruvian', 'Polish', 'Portuguese', 
  'Qatari', 
  'Romanian', 'Russian', 'Rwandan', 
  'Saint Lucian', 'Salvadoran', 'Samoan', 'San Marinese', 'Sao Tomean', 'Saudi', 'Senegalese', 'Serbian', 'Seychellois', 'Sierra Leonean', 'Singaporean', 'Slovakian', 'Slovenian', 'Solomon Islander', 'Somali', 'South African', 'South Korean', 'Spanish', 'Sri Lankan', 'Sudanese', 'Surinamer', 'Swazi', 'Swedish', 'Swiss', 'Syrian', 
  'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 'Togolese', 'Tongan', 'Trinidadian', 'Tobagonian', 'Tunisian', 'Turkish', 'Tuvaluan', 
  'Ugandan', 'Ukrainian', 'Uruguayan', 'Uzbekistani', 
  'Venezuelan', 'Vietnamese', 
  'Yemenite', 
  'Zambian', 'Zimbabwean'].each do |nationality|
  Nationality.find_or_create_by({name: nationality})
end