class SetLanguageLevels < ActiveRecord::Migration
  def change
    ['Native', 'Bilingual',  'Professional Proficiency', 'Proficient',
     'Intermediate', 'Beginner'].each do |level|
      LanguageLevel.create!(level: level)
    end
  end
end
