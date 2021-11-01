class AddUniqueIndexToIp < ActiveRecord::Migration[6.1]
  def change
    add_index :dns_records, :ipv4, unique: true
  end
end
