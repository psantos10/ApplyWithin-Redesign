class PositionApplicationCycler

  attr_reader :direction, :current_applicant_id, :position_applications

  def initialize(direction, current_applicant_id, position_applications)
    @direction = direction
    @current_applicant_id = current_applicant_id
    @position_applications = position_applications
  end

  def cycle
    matching_application.hunter_id
  end

private

  def direction
    @direction == :left ? -1 : +1
  end

  def matching_hunter
    position_applications.find_by_hunter_id(current_applicant_id)
  end

  def application_index
    position_applications.index(matching_hunter)
  end

  def matching_application
    index = application_index.to_i + direction
    position_applications[index] || position_applications.first
  end

end
