class Education < ActiveRecord::Base
  belongs_to :hunter
  delegate :user, to: :hunter

  validates :institution, :qualification, :subject, :result, :start_date, :end_date, presence: true

  def formatted_start_date
    start_date.strftime("%b %Y") if start_date
  end

  def formatted_end_date
    end_date.strftime("%b %Y") if end_date
  end

end
