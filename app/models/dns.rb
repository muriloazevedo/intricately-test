class Dn < ApplicationRecord
  table_name = 'dns'

  validates :ipv4, :presence => true, :uniqueness => true,
    format: { with: Resolv::IPv4::Regex }
end
