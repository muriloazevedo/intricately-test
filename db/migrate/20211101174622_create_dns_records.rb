class CreateDnsRecords < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'

    create_table :dns_records, id: :uuid do |t|
      t.string :ipv4, null: false
      t.timestamps
    end
  end
end
