class Users::RegistrationsController < Devise::RegistrationsController

private

  def after_sign_up_path_for(resource)
    if resource.group.class.to_s == "Business"
       "/businesses/#{resource.group.id}/edit_job"
    else
       "/hunters/#{resource.group.id}/edit_profile"
    end
  end

end