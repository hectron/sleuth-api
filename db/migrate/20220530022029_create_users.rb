class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.string :state
      t.text :email
      t.date :birthday

      t.timestamps
    end
  end
end
