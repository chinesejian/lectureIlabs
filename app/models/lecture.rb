class Lecture < ActiveRecord::Base

	 belongs_to :host, foreign_key: :host_user_id, class_name: "User"

	def parse_lecture_time
    self[:lecture_time].strftime("%I:%M %p") if self[:lecture_time]
  end

  def parse_lecture_date
    self[:lecture_date].strftime('%m/%d/%Y') if self[:lecture_date]
  end

  def lecture_date=(value)
    self[:lecture_date] = Date.strptime(value, '%m/%d/%Y')
  end

  def host
  	User.find(self[:host_user_id])
  end
end
