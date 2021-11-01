# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hostname, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:dns_record) }
  end
end