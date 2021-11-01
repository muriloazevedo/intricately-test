# frozen_string_literal: true

module DnsRecords
  class IndexContract < Dry::Validation::Contract
    params do
      required(:page).value(:integer)
      optional(:included).value(:array)
      optional(:excluded).value(:array)
    end
  end
end