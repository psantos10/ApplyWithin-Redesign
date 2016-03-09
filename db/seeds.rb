['Akan', 'Amharic', 'Arabic', 'Assamese', 'Awadhi', 'Azerbaijani', 'Balochi', 'Belarusian', 'Bengali', 'Bhojpuri', 'Burmese', 'Cantonese', 'Cebusano', 'Chewa', 'Chhattisgarhi', 'Chittagonian', 'Czech', 'Deccan', 'Dhundhari', 'Dutch', 'English', 'French', 'Fula', 'Gan', 'German', 'Greek', 'Gujarati', 'Haitian Creole', 'Hakka', 'Haryanvi', 'Hausa', 'Hiligaynon', 'Hindi', 'Hmong', 'Hungarian', 'Igbo', 'Ilokano', 'Italian', 'Indonesian', 'Japanese', 'Javanese', 'Jin', 'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Kirundi', 'Konkani', 'Korean', 'Kurdish', 'Madurese', 'Magahi', 'Maithili', 'Malagasy', 'Malayalam', 'Mandarin', 'Marathi', 'Marwari', 'Min Bei', 'Min Dong', 'Min Nan', 'Mossi', 'Nepali', 'Oriya', 'Oromo', 'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi', 'Quechua', 'Romanian', 'Russian', 'Saraiki', 'Serbo-Croatian', 'Shona', 'Sindhi', 'Sinhalese', 'Somali', 'Spanish', 'Sundanese', 'Swahili', 'Swedish', 'Sylheti', 'Tagalog', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukrainian', 'Urdu', 'Uyghur', 'Uzbek', 'Vietnamese', 'Wu', 'Xhoas', 'Xiang', 'Yoruba', 'Zhuang', 'Zulu' ].each do |name|
  LanguageName.find_or_create_by({name: name})
end

['Native', 'Bilingual', 'Proficient', 'Intermediate', 'Beginner'].each do |level|
  LanguageLevel.find_or_create_by({level: level})
end

['Bar', 'Cafe', 'Restaurant', 'Fast Food', 'Shop'].each do |type|
  BusinessType.find_or_create_by({name: type})
end

['Waiting staff', 'Bar staff', 'Barista', 'Chef', 'Shop Staff', 'Kitchen Staff', 'Kitchen Porter'].each do |bracket|
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

Hash["SE2" => "Abbey Wood", "W3" => "Acton", "EC3A" => "Aldgate", "SE20" => "Anerley", "SW12" => "Balham", "EC2R" => "Bank of England", "EC2Y" => "Barbican", "SW13" => "Barnes", "SW11" => "Battersea", "EC4V" => "Blackfriars", "E2" => "Bethnal Green",
"SE3" => "Blackheath", "WC1B" => "Bloomsbury", "E3" => "Bow", "SW2" => "Brixton", "SE4" => "Brockley", "SE5" => "Camberwell", "NW1" => "Camden Town", "EC4R" => "Cannon Street", "WC2A" => "Chancery Lane", "WC2N" => "Charing Cross", "SE6" =>
"Catford", "SE7" => "Charlton", "SW3" => "Chelsea", "E4" => "Chingford", "W4" => "Chiswick", "SW4" => "Clapham", "E5" => "Clapton", "EC3V" => "Cornhill", "WC2E" => "Covent Garden", "SE8" => "Deptford", "SE21" => "Dulwich", "WC2B" => "Drury Lane",
"W5" => "Ealing", "SW5" => "Earls Court", "SE22" => "East Dulwich", "N2" => "East Finchley", "E6" => "East Ham", "SE9" => "Eltham", "EC1M" => "Farringdon", "EC4A" => "Fetter Lane", "N3" => "Finchley Church End", "N4" => "Finsbury Park", "EC1R" =>
"Finsbury", "EC1V" => "Finsbury", "E7" => "Forest Gate", "SE23" => "Forest Hill", "SW6" => "Fulham", "WC1R" => "Gray's Inn", "NW11" => "Golders Green", "SE10" => "Greenwich", "EC2V" => "Guildhall", "EC1N" => "Hatton Garden", "E8" => "Hackney", "W6" => "Hammersmith", "NW3" => "Hampstead", "W7" => "Hanwell", "NW4" => "Hendon", "SE24" => "Herne Hill", "N5" => "Highbury", "N6" => "Highgate", "WC1V" => "Holborn", "N7" => "Holloway", "E9" => "Homerton", "N8" => "Hornsey", "N1" => "Islington", 
"SE11" => "Kennington", "W8" => "Kensington", "NW5" => "Kentish Town", "NW6" => "Kilburn", "WC1X" => "Kings Cross", "SE12" => "Lee", "WC2H" => "Leicester Square", "SE13" => "Lewisham", "E10" => "Leyton", "E11" => "Leytonstone", "EC2M" => "Liverpool
Street", "EC3M" => "Lloyd's of London", "N9" => "Lower Edmonton", "W9" => "Maida Hill", "E12" => "Manor Park", "EC4N" => "Mansion House", "W1" => "Marble Arch", "NW7" => "Mill Hill", "SW14" => "Mortlake", "EC3R" => "Monument", "N10" => "Muswell
Hill", "SE14" => "New Cross", "N11" => "New Southgate", "N12" => "North Finchley", "W10" => "North Kensington", "W11" => "Notting Hill", "SE19" => "Norwood", "EC2N" => "Old Broad Street", "WC1A" => "Oxford Street", "W2" => "Paddington", "N13" =>
"Palmers Green", "SE15" => "Peckham", "E13" => "Plaistow", "E14" => "Poplar", "SW15" => "Putney", "SE16" => "Rotherhithe", "WC1N" => "Russell Square", "W12" => "Shepherds Bush", "EC2A" => "Shoreditch", "WC2R" => "Somerset House", "SW7" => "South
Kensington", "SW8" => "South Lambeth", "SE25" => "South Norwood", "N15" => "South Tottenham", "N14" => "Southgate", "SE1" => "Southwark", "NW8" => "St Johns Wood", "E1" => "Stepney", "SW9" => "Stockwell", "N16" => "Stoke Newington", "E15" =>
"Stratford", "SW16" => "Streatham", "SE26" => "Sydenham", "EC1A" => "St Barts", "EC1Y" => "St Luke's", "WC1H" => "St Pancras", "EC4M" => "St Paul's", "EC4Y" => "Temple", "SE28" => "Thamesmead", "NW9" => "The Hyde", "SW17" => "Tooting", "N17" =>
"Tottenham", "EC2N" => "Tower Hill", "N18" => "Upper Edmonton", "WC1E" => "UCL", "N19" => "Upper Holloway", "E16" => "Victoria Docks & North Woolwich", "E17" => "Walthamstow", "SE17" => "Walworth", "SW18" => "Wandsworth", "W13" => "West Ealing",
"SW10" => "West Brompton", "W14" => "West Kensington", "SE27" => "West Norwood", "SW20" => "West Wimbledon", "SW1" => "Westminster", "N20" => "Whetstone", "NW10" => "Willseden", "SW19" => "Wimbledon", "N21" => "Winchmore Hill", "N22" => "Wood
Green", "E18" => "Woodford & South Woodford", "SE18" => "Woolwich", "W1T" => "Tottenham Court Road", "E1W" => "Limehouse", "E20" => "Newham", "E98" => "Tower Hamlets", "EC1P" => "Clerkenwell", "EC2P" => "Clerkenwell", "EC3N" => "Tower Hamlets",
"EC3P" => "Clerkenwell", "EC4P" => "Clerkenwell", "N1C" => "Camden", "N1P" => "Islington", "N81" => "Poplar", "NW1W" => "Camden", "NW2" => "Barnet", "NW26" => "Camden", "SE1P" => "Southwark", "SW1A" => "St James's", "SW1E" => "St James's", "SW1H" =>
"St James's", "SW1P" => "Westminster", "SW1V" => "Westminster", "SW1W" => "Westminster", "SW1X" => "Westminster", "SW1Y" => "Westminster", "SW95" => "Lambeth", "W1A" => "Westminster", "W1B" => "Marylebone High Street", "W1C" => "Marylebone High
Street", "W1D" => "West End", "W1F" => "West End", "W1G" => "Marylebone High Street", "W1H" => "Marylebone High Street", "W1J" => "West End", "W1K" => "Knightsbridge", "W1M" => "West End", "W1N" => "West End", "W1P" => "Camden", "W1R" => "West End",
"W1S" => "West End", "W1U" => "Marylebone High Street", "W1V" => "West End", "W1W" => "Marylebone High Street", "W1X" => "West End", "W1Y" => "West End"].each do |key, value|
  LondonArea.find_or_create_by({postcode: key, name: value})
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