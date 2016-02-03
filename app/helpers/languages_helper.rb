module LanguagesHelper

  def how_many_stars(language)
    if language.level == "Native"

      raw("<span class='has-tooltip' data-toggle='tooltip' data-placement='bottom' title='Native'>
             <i class='fa fa-star ' style='font-size:1.5em;color:#FF534B'></i>&nbsp;
           </span>" * 5)

    elsif language.level == "Bilingual"

      raw("<span class='has-tooltip' data-toggle='tooltip' data-placement='bottom' title='Bilingual'>
             <i class='fa fa-star ' style='font-size:1.5em;color:#FF534B'></i>&nbsp;
           </span>" * 4)

    elsif language.level == "Proficient"

      raw("<span class='has-tooltip' data-toggle='tooltip' data-placement='bottom' title='Proficient'>
             <i class='fa fa-star ' style='font-size:1.5em;color:#FF534B'></i>&nbsp;
           </span>" * 3)

    elsif language.level == "Intermediate"

      raw("<span class='has-tooltip' data-toggle='tooltip' data-placement='bottom' title='Intermediate'>
             <i class='fa fa-star ' style='font-size:1.5em;color:#FF534B'></i>&nbsp;
           </span>" * 2)

    elsif language.level == "Beginner"
      raw("<span class='has-tooltip' data-toggle='tooltip' data-placement='bottom' title='Beginner'>
            <i class='fa fa-star ' style='font-size:1.5em;color:#FF534B'></i>&nbsp;
           </span>" * 1)
    end
  end

end

