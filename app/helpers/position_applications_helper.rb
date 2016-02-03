require 'position_application_cycler'

module PositionApplicationsHelper

  def next_hunter_id(applications, current_id=Hunter.first)
    hunter_ids = applications.flat_map(&:hunter).
                              map(&:id)
    hunter_ids.index(current_id)
  end

  def position_application_status(application)
    if Impression.where(trackable: application).none?
      "applied"
    elsif application.rejected?
      "rejected"
    else
      "viewed"
    end
  end

  def past_application_reason(application)
    if application.rejected_at.present?
       (application.rejected_at).strftime("%d %b %Y")
    elsif application.cancelled_at.present?
        (application.cancelled_at).strftime("%d %b %Y")
    else application.advertisement.closed_at.present?
        (application.advertisement.closed_at).strftime("%d %b %Y")
    end
  end

  def order_past_applications(application)
    application.sort_by {|pa| pa['updated_at']}.reverse
  end

  def prev_arrow(position_applications)
      applications = application_cycler(:left, position_applications)
      link_to('Back', "?current_applicant_id=#{applications.cycle}",
             class: 'btn btn-default btn-sm')
  end

  def next_arrow(position_applications)
    applications = application_cycler(:right, position_applications)
    link_to('Next', "?current_applicant_id=#{applications.cycle}",
           class: 'btn btn-default btn-sm')
  end

  def arrow_icon(direction=:left)
    raw("<i class='fa fa-arrow-#{direction}'></i>")
  end

private

  def application_cycler(direction, position_applications)
      PositionApplicationCycler.new(direction,
                                    params[:current_applicant_id],
                                      position_applications)
  end

end