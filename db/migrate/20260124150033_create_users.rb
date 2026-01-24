class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :slack_id
      t.string :redirect_url
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :users, :slack_id, unique: true
  end
end
