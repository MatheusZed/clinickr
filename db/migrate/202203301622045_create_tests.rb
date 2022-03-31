class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :test_type
      t.string :test_limits
      t.string :result
      t.belongs_to :exam

      t.timestamps
    end
  end
end
