class SetLanguageNames < ActiveRecord::Migration
  def change
    ['Akan', 'Amharic', 'Arabic', 'Assamese', 'Awadhi', 'Azerbaijani', 'Balochi', 'Belarusian', 'Bengali', 'Bhojpuri', 'Burmese', 'Cantonese', 'Cebusano', 'Chewa', 'Chhattisgarhi', 'Chittagonian', 'Czech', 'Deccan', 'Dhundhari', 'Dutch', 'English', 'French', 'Fula', 'Gan', 'German', 'Greek', 'Gujarati', 'Haitian Creole', 'Hakka', 'Haryanvi', 'Hausa', 'Hiligaynon', 'Hindi', 'Hmong', 'Hungarian', 'Igbo', 'Ilokano', 'Italian', 'Indonesian', 'Japanese', 'Javanese', 'Jin', 'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Kirundi', 'Konkani', 'Korean', 'Kurdish', 'Madurese', 'Magahi', 'Maithili', 'Malagasy', 'Malayalam', 'Mandarin', 'Marathi', 'Marwari', 'Min Bei', 'Min Dong', 'Min Nan', 'Mossi', 'Nepali', 'Oriya', 'Oromo', 'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi', 'Quechua', 'Romanian', 'Russian', 'Saraiki', 'Serbo-Croatian', 'Shona', 'Sindhi', 'Sinhalese', 'Somali', 'Spanish', 'Sundanese', 'Swahili', 'Swedish', 'Sylheti', 'Tagalog', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukrainian', 'Urdu', 'Uyghur', 'Uzbek', 'Vietnamese', 'Wu', 'Xhoas', 'Xiang', 'Yoruba', 'Zhuang', 'Zulu' ].each do |name|
      LanguageName.create!(name: name)
  end 
  end
end
