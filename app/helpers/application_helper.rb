module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def remove_unwanted_words string
    bad_words = ["less than", "about"]

    bad_words.each do |bad|
      string.gsub!(bad + " ", '')
    end

    return string
  end

end
