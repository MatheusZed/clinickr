class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.datetime :birthday
      t.string :city
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
