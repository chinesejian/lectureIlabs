class Lecture < ActiveRecord::Base

	 belongs_to :host, foreign_key: :host_user_id, class_name: "User"

end
