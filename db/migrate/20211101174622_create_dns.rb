class CreateDns < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'

    create_table :dns, id: :uuid do |t|
      t.string :ipv4, null: false
      t.timestamps
    end
  end
end
