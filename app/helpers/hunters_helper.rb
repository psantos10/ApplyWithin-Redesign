module HuntersHelper

  def hunter_to_view(position_applications)

    application = position_applications.find_by_hunter_id(
                    params[:current_applicant_id]) ||
                    position_applications[0]
    if application == nil
      return :dashboard, notice: "No applications"
    else 
      application.hunter
    end
  end

  def hunter_y_n
    [
      ['yes'],
      ['no'],
    ]
  end

  def hunter_seeking
    [
      ['Full-time'],
      ['Part-time'],
      ['Either'],
      ['Temp'],
      ['Seasonal'],
      ['Nights'],
    ]
  end

end
