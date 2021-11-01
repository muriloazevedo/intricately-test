# frozen_string_literal: true

module DnsRecords
  class CreateContract < Dry::Validation::Contract
    params do
      required(:ip).value(:string)
      required(:hostnames_attributes).each do
        schema do
          required(:hostname).value(:string)
        end
      end
    end
  end
end
