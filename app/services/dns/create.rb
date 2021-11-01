module Dns
  class Create
    include ::Serializable
    include ::HasContract
    include ::Validations::Model

    serializer_class DnsSerializer
    contract_class Dnss::CreateContract

    def initialize(params)
      create_contract(params.to_h)
    end

    def call

    end
  end
end