class CreateGoogleOmniauthTable < ActiveRecord::Migration
  def change
    create_table :google_omniauth_tables do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
  end
end
