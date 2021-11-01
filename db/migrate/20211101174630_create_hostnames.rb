class CreateHostnames < ActiveRecord::Migration[6.1]
  def change
    create_table :hostnames do |t|
      t.string :address, null: false
      t.references :dns_records
      t.timestamps
    end
  end
end
