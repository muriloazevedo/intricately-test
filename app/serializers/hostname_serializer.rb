class HostnameSerializer
  include JSONAPI::Serializer

  set_type :hostname

  attributes :id, :hostname
end
