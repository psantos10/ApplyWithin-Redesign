module PositionsHelper

  def ticks_or_crosses(val)
    if val == "No"
      return raw("<i class='fa fa-times'style='color:red;font-size:1.2em'></i>")
    elsif val == "n/a"
      return raw("<i class='fa fa-times'style='color:red;font-size:1.2em'></i>")
    else  val == "Yes"
      return raw("<i class='fa fa-check' style='color:green;font-size:1.2em'></i>")
    end
  end

  def advertisement_or_position_date(position)
    if position.current_advertisement.present?
      distance_of_time_in_words_to_now position.current_advertisement.created_at
    else 
      distance_of_time_in_words_to_now position.created_at
    end
  end

  def destroy_applications_for(position)
      position.current_applications.select {|app| app.update_attributes(:deleted_at => DateTime.now) }
  end

  # def sheperdsbush_positions
  #   Position.all.joins(:business).where('businesses.postcode ILIKE ?', "%W12%").count
  # end
  #
  # def hammersmith_positions
  #   Position.all.joins(:business).where('businesses.postcode ILIKE ?', "%W6%").count
  # end
  #
  # def chiswick_positions
  #   Position.all.joins(:business).where('businesses.postcode ILIKE ?', "%W4%").count
  # end
  #
  # def notting_hill_positions
  #   Position.all.joins(:business).where('businesses.postcode ILIKE ?', "%W11%").count
  # end
  #
  # def ladbroke_grove_positions
  #   Position.all.joins(:business).where('businesses.postcode ILIKE ?', "%W10%").count
  # end
  #
  # def kensington_positions
  #   Position.all.joins(:business).where('businesses.postcode ILIKE ?', "%W8%", "%W14%").count
  # end

  def job_hours
    [
      ['10+'],
      ['20+'],
      ['30+'],
      ['40+'],
      ['50+'],
      ['60+'],
      ['70+'],
    ]
  end

  def job_rank
    [
      ['Entry level'],
      ['Supervisor level'],
      ['Manager level'],
    ]
  end

  def job_openings
    [
      ['1'],
      ['2'],
      ['3'],
      ['4'],
      ['5+'],
    ]
  end

  def job_start_date
    [
      ['ASAP'],
      ['1 weeks time'],
      ['2 weeks time'],
      ['3 weeks time'],
      ['1 months time'],
      ['2 months time'],
      ['3 months time'],
      ['6 months time'],
    ]
  end

  def job_wage
    [
      ['£ 6.70 - 7.50'],
      ['£ 7.50 - 10.00'],
      ['£ 10.00 - 12.50'],
      ['£ 12.50 - 15.00'],
      ['£ 15.00 - 17.50'],
      ['£ 17.50 - 20.00'],
      ['£ 20.00 +'],
    ]
  end

  def job_dress_code
    [
      ['uniform'],
      ['smart'],
      ['casual'],
    ]
  end

  def job_y_n_na
    [
      ['yes'],
      ['no'],
      ['n/a'],
    ]
  end

end