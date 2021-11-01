class DnsRecordSerializer
  include JSONAPI::Serializer

  set_type :dns

  has_many :hostnames

  attributes :id, :ip

  attribute :ip, &:ipv4
end
