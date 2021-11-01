class Hostname < ApplicationRecord
  self.per_page = 10
  belongs_to :dns_record, foreign_key: 'dns_records_id'
end
