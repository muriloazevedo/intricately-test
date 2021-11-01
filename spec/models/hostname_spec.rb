# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hostname, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:dns_record) }
  end
  
  context 'validations' do
    it { should validate_presence_of(:dns_records_id) }
  end
end