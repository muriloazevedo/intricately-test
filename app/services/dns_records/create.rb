module DnsRecords
  class Create
    include ::Serializable
    include ::HasContract
    include ::Validations::Model

    serializer_class DnsRecordSerializer
    contract_class DnsRecords::CreateContract

    def initialize(params)
      create_contract(params.to_h)
    end

    def call
      check_contract!
      check_model!
      process
    end

    def dns_record
      contract.values.data[:ipv4] = contract.values.data.delete(:ip)
      @hostname_attributes = contract.values.data.delete(:hostnames_attributes)
      byebug
      @dns_record ||= DnsRecord.new(contract.values)
    end

    alias model dns_record
    alias serializable_object dns_record

    private

    
    def process
      ActiveRecord::Base.transaction do
        dns_record.save!
      end
    end

    attr_reader :dns_record
  end
end