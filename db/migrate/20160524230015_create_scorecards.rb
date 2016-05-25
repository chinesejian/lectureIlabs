class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :overall
      t.integer :content
      t.integer :performance
      t.string :comment
      t.integer :user_id
      t.integer :lecture_id


      t.timestamps null: false
    end

		add_foreign_key :scorecards, :users, column: :user_id
		add_foreign_key :scorecards, :lectures, column: :lecture_id

  end
end
