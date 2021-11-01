module DnsRecords
  class Index
    include ::Serializable
    include ::HasContract
    include ::Validations::Model

    serializer_class ::DnsRecordSerializer
    contract_class DnsRecords::IndexContract

    RESULTS_PER_PAGE = 10

    def initialize(params)
      create_contract(params)
    end

    def call
      @hostnames = Hostname.all
      @hostnames = @hostnames.where(address: included) if contract.values[:included].present?
      @hostnames = @hostnames.where.not(address: excluded) if contract.values[:excluded].present?

      { total_records: records.count,
        records: records,
        related_hostnames: related_hostnames }
    end

    def included
      contract.values[:included]
    end

    def excluded
      contract.values[:excluded]
    end

    def records
      @hostnames.map do |hostname|
        {id: hostname.dns_record.id, ip_address: hostname.dns_record.ipv4 }
      end.uniq
    end

    def related_hostnames
      hostnames_related = @hostnames
                          .group(:address)
                          .count
      hostnames_related.map { |h, c| {count: c, hostname: h }}
    end
  end
end