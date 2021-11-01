# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:hostnames) }
  end

  context 'validations' do
    it { should validate_presence_of(:ipv4) }
  end
end