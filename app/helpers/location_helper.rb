module LocationHelper
  
  def location(business)
    if business.city == "London"
      LondonArea.find_by(postcode: business.postcode[/(\S+)/, 1]).name
    elsif business.city.present?
      return business.city
    else 
      "UK"
    end
  end
  
end
