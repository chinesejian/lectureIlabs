class AddDateToLecture < ActiveRecord::Migration
  def change
  	remove_column :lectures, :starts_at
  	remove_column :lectures, :ends_at
    add_column :lectures, :lecture_date, :date
    add_column :lectures, :lecture_time, :time
  end
end
