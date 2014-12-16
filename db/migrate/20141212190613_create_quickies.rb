class CreateQuickies < ActiveRecord::Migration
  def change
    create_table :quickies do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.references :user_group, index: true
      t.references :creator, index: true

      t.timestamps
    end
  end
end
