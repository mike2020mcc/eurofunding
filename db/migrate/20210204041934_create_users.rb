class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :shufti_reference
      t.string :shufti_event
      t.string :shufti_verification_url
      t.string :shufti_response
      t.boolean :remittances, null: false, default: false
      t.boolean :banking, null: false, default: false
      t.string :given_name, null: false
      t.string :family_name, null: false
      t.string :email, null: false
      t.string :country, null: false
      t.string :mobile, null: false
      t.string :password_digest, null: false
      t.string :login_ip, null: false
      t.string :login_country, null: false
      t.datetime :login_at, null: false
      t.timestamps
    end
  end
end
