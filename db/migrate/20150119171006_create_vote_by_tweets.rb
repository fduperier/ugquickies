class CreateVoteByTweets < ActiveRecord::Migration
  def change
    create_table :vote_by_tweets do |t|
      t.references :quickie, index: true
      t.string :tweet_screen_name, default: '', null: :false
      t.integer :tweet_id, default: 0, null: false

      t.timestamps
    end

    add_index :vote_by_tweets, [ :quickie_id, :tweet_screen_name ]
  end
end
