# frozen_string_literal: true

module DnsRecords
  class IndexContract < Dry::Validation::Contract
    params do
      required(:page).value(:integer)
      optional(:included).value(:string)
      optional(:excluded).value(:string)
    end
  end
end