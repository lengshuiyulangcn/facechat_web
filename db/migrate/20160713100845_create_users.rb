class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :image
      t.string :oauth_token
      t.string :provider
      t.string :nick_name
      t.timestamp :oauth_expires_at

      t.timestamps
    end
  end
end
