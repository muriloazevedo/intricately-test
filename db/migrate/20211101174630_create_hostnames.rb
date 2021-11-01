class CreateHostnames < ActiveRecord::Migration[6.1]
  def change
    create_table :hostnames do |t|
      t.string :address, null: false
      t.references :dns_records, type: :uuid
      t.timestamps
    end

    add_index :hostnames, :address, unique: true
  end
end
