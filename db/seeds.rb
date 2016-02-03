['Akan', 'Amharic', 'Arabic', 'Assamese', 'Awadhi', 'Azerbaijani', 'Balochi', 'Belarusian', 'Bengali', 'Bhojpuri', 'Burmese', 'Cantonese', 'Cebusano', 'Chewa', 'Chhattisgarhi', 'Chittagonian', 'Czech', 'Deccan', 'Dhundhari', 'Dutch', 'English', 'French', 'Fula', 'Gan', 'German', 'Greek', 'Gujarati', 'Haitian Creole', 'Hakka', 'Haryanvi', 'Hausa', 'Hiligaynon', 'Hindi', 'Hmong', 'Hungarian', 'Igbo', 'Ilokano', 'Italian', 'Indonesian', 'Japanese', 'Javanese', 'Jin', 'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Kirundi', 'Konkani', 'Korean', 'Kurdish', 'Madurese', 'Magahi', 'Maithili', 'Malagasy', 'Malayalam', 'Mandarin', 'Marathi', 'Marwari', 'Min Bei', 'Min Dong', 'Min Nan', 'Mossi', 'Nepali', 'Oriya', 'Oromo', 'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi', 'Quechua', 'Romanian', 'Russian', 'Saraiki', 'Serbo-Croatian', 'Shona', 'Sindhi', 'Sinhalese', 'Somali', 'Spanish', 'Sundanese', 'Swahili', 'Swedish', 'Sylheti', 'Tagalog', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukrainian', 'Urdu', 'Uyghur', 'Uzbek', 'Vietnamese', 'Wu', 'Xhoas', 'Xiang', 'Yoruba', 'Zhuang', 'Zulu' ].each do |name|
  LanguageName.find_or_create_by({name: name})
end

['Native', 'Bilingual', 'Proficient', 'Intermediate', 'Beginner'].each do |level|
  LanguageLevel.find_or_create_by({level: level})
end

['Bar', 'Cafe', 'Restaurant'].each do |type|
  BusinessType.find_or_create_by({name: type})
end

['Waiting staff', 'Bar staff', 'Barista', 'Chef', 'Kitchen Porter'].each do |bracket|
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

Hash["Abbey Wood" => "SE2", "Acton" => "W3", "Aldgate" => "EC3A", "Anerley" => "SE20", "Balham" => "SW12", "Bank of England" => "EC2R", "Barbican" => "EC2Y", "Barnes" => "SW13", "Battersea" => "SW11", "Blackfriars" => "EC4V", "Bethnal Green" => "E2", 
"Blackheath" => "SE3", "Bloomsbury" => "WC1B", "Bow" => "E3", "Brixton" => "SW2", "Brockley" => "SE4", "Camberwell" => "SE5", "Camden Town" => "NW1", "Cannon Street" => "EC4R", "Chancery Lane" => "WC2A", "Charing Cross" => "WC2N", "Catford" => "SE6", 
"Charlton" => "SE7", "Chelsea" => "SW3", "Chingford" => "E4", "Chiswick" => "W4", "Clapham" => "SW4", "Clapton" => "E5", "Cornhill" => "EC3V", "Covent Garden" => "WC2E", "Deptford" => "SE8", "Dulwich" => "SE21", "Drury Lane" => "WC2B", 
"Ealing" => "W5", "Earls Court" => "SW5", "East Dulwich" => "SE22", "East Finchley" => "N2", "East Ham" => "E6", "Eltham" => "SE9", "Farringdon" => "EC1M", "Fetter Lane" => "EC4A", "Finchley Church End" => "N3", "Finsbury Park" => "N4", "Finsbury" => "EC1R", 
"Finsbury" => "EC1V", "Forest Gate" => "E7", "Forest Hill" => "SE23", "Fulham" => "SW6", "Gray's Inn" => "WC1R", "Golders Green" => "NW11", "Greenwich" => "SE10", "Guildhall" => "EC2V", "Hatton Garden" => "EC1N", "Hackney" => "E8", "Hammersmith" => "W6", 
"Hampstead" => "NW3", "Hanwell" => "W7", "Hendon" => "NW4", "Herne Hill" => "SE24", "Highbury" => "N5", "Highgate" => "N6", "Holborn" => "WC1V", "Holloway" => "N7", "Homerton" => "E9", "Hornsey" => "N8", "Islington" => "N1", "Kennington" => "SE11", 
"Kensington" => "W8", "Kentish Town" => "NW5", "Kilburn" => "NW6", "Kings Cross" => "WC1X", "Lee" => "SE12", "Leicester Square" => "WC2H", "Lewisham" => "SE13", "Leyton" => "E10", "Leytonstone" => "E11", "Liverpool Street" => "EC2M", "Lloyd's of London" => "EC3M", 
"Lower Edmonton" => "N9", "Maida Hill" => "W9", "Manor Park" => "E12", "Mansion House" => "EC4N", "Marble Arch" => "W1", "Mill Hill" => "NW7", "Mortlake" => "SW14", "Monument" => "EC3R", "Muswell Hill" => "N10", "New Cross" => "SE14", "New Southgate" => "N11",
"North Finchley" => "N12", "North Kensington" => "W10", "Notting Hill" => "W11", "Norwood" => "SE19", "Old Broad Street" => "EC2N", "Oxford Street" => "WC1A", "Paddington" => "W2", "Palmers Green" => "N13", "Peckham" => "SE15", "Plaistow" => "E13", "Poplar" => "E14", 
"Putney" => "SW15", "Rotherhithe" => "SE16", "Russell Square" => "WC1N", "Shepherds Bush" => "W12", "Shoreditch" => "EC2A", "Somerset House" => "WC2R", "South Kensington" => "SW7", "South Lambeth" => "SW8", "South Norwood" => "SE25", "South Tottenham" => "N15", 
"Southgate" => "N14", "Southwark" => "SE1", "St Johns Wood" => "NW8", "Stepney" => "E1", "Stockwell" => "SW9", "Stoke Newington" => "N16", "Stratford" => "E15", "Streatham" => "SW16", "Sydenham" => "SE26", "St Barts" => "EC1A", "St Luke's" => "EC1Y", "St Pancras" => "WC1H", 
"St Paul's" => "EC4M", "Temple" => "EC4Y", "Thamesmead" => "SE28", "The Hyde" => "NW9", "Tooting" => "SW17", "Tottenham" => "N17", "Tower Hill" => "EC2N", "Upper Edmonton" => "N18", "UCL" => "WC1E",  "Upper Holloway" => "N19", "Victoria Docks & North Woolwich" => "E16", 
"Walthamstow" => "E17", "Walworth" => "SE17", "Wandsworth" => "SW18", "West Ealing" => "W13", "West Brompton" => "SW10", "West Kensington" => "W14", "West Norwood" => "SE27", "West Wimbledon" => "SW20", "Westminster" => "SW1", "Whetstone" => "N20", "Willseden" => "NW10", 
"Wimbledon" => "SW19", "Winchmore Hill" => "N21", "Wood Green" => "N22", "Woodford & South Woodford" => "E18", "Woolwich" => "SE18"].each do |key, value|
  LondonArea.find_or_create_by({name: key, postcode: value})
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