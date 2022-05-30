class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.string :state
      t.text :email
      t.text :date_of_birth

      t.timestamps
    end
  end
end
