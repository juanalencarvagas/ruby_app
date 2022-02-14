# frozen_string_literal: true

require_relative '../../app/services/print_service'
require 'rspec'

RSpec.describe PrintService do
  subject { described_class.new(hash).call }

  context 'ordered hash of urls' do
    let(:hash) do
      {
        url1: 23,
        url2: 54
      }
    end

    it 'should return in the same list' do
      expect(subject).to eq({ url1: 23, url2: 54 })
    end
  end
end
