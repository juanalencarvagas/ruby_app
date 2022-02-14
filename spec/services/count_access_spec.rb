# frozen_string_literal: true

require_relative '../../app/services/count_access_service'
require 'rspec'
require 'spec_helper'

RSpec.describe CountAccessService do
  subject { described_class.new(hash).call }

  context 'list of urls' do
    let(:hash) { build(:log).register }

    it 'should return three groups in descending order of count ' do
      expect(subject).to eq([['url_3', 3], ['url_2', 2], ['url_1', 1]])
    end
  end
end
