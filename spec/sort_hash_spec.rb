# frozen_string_literal: true

require_relative '../sort_hash'
require 'rspec'

RSpec.describe SortHash do
  subject { described_class.new(hash).run }

  context 'unordered list of urls' do
    let(:hash) do
      {
        url1: 23,
        url2: 18,
        url3: 54
      }
    end

    it 'should return in descending order' do
      expect(subject).to eq([[:url3, 54], [:url1, 23], [:url2, 18]])
    end
  end
end
