class AddStateToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :state, :string, default: unstart
  end
end
