class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :host_user_id
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps null: false
    end

    add_foreign_key :lectures, :users, column: :host_user_id

  end
end
