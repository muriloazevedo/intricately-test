class DnsSerializer
  include FastJsonapi::ObjectSerializer

  set_type :dns

  has_many :hostnames

  attributes :id, :ip

  attribute :ip, &:ipv4
end
