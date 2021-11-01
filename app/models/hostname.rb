class Hostname < ApplicationRecord
  belongs_to :dns_record, foreign_key: 'dns_records_id'
end
