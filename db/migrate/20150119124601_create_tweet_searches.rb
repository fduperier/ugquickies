class CreateTweetSearches < ActiveRecord::Migration
  def change
    create_table :tweet_searches do |t|
      t.integer :max_id, default: 0, null: false
      t.integer :since_id, default: 0, null: false
      t.integer :count, default: 0, null: false
      t.decimal :completed_in, default: 0.0, null: false

      t.timestamps
    end
  end
end
