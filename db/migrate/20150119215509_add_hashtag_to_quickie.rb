class AddHashtagToQuickie < ActiveRecord::Migration
  def change
    add_column :quickies, :hashtag, :string
    add_index :quickies, :hashtag, unique: true
  end
end
