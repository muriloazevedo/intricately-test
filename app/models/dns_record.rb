require 'resolv'

class DnsRecord < ApplicationRecord

  has_many :hostnames, foreign_key: 'dns_records_id'

  validates :ipv4, presence: true, uniqueness: true,
    format: { with: Resolv::IPv4::Regex }
end
