class Experience < ActiveRecord::Base
  belongs_to :hunter
  delegate :user, to: :hunter

  validates :job_title, presence: true
  validates :employer, presence: true
  validates :location, presence: true
  validates :tagline, presence: true, length: { minimum: 20, maximum: 200}
  validates :job_description, presence: true, length: { minimum: 150, maximum: 700}

  def formatted_start_date
    start_date.strftime("%b %Y") if start_date
  end

  def formatted_end_date
    end_date.strftime("%b %Y") if end_date
  end

  def how_long(start_date, end_date)
    distance_of_time_in_words(start_date, end_date)
  end

	def time_between
    ((end_date - start_date).to_i)/30  
  end

end