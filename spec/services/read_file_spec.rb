# frozen_string_literal: true

require_relative '../../app/services/read_file_service'
require 'rspec'

RSpec.describe ReadFileService do
  subject { described_class.new(arguments).call }

  let(:arguments) { './spec/fixtures/example.log' }

  context 'file name' do
    let(:file) { ReadFileService.new('./spec/fixtures/example.log').call }
    let(:inexistent_file) { ReadFileService.new(directory('./spec/fixtures/inexistent_file.log')).call }
    it 'should not raise error with the right file name' do
      expect { file }.to_not raise_error
    end
    it 'should raise an error if file name is not exist' do
      expect { inexistent_file }.to raise_error(StandardError)
    end
  end

  context 'returned hash' do
    let(:file) { ReadFileService.new('./spec/fixtures/example.log').call }
    it 'should be in a specific format' do
      expect(file).to eq([{ site_ip: '126.318.035.038', site_url: '/help_page/1' },
                          { site_ip: '184.123.665.067', site_url: '/contact' },
                          { site_ip: '722.247.931.582', site_url: '/help_page/1' }])
    end
  end

  context 'returned hash' do
    let(:entry) { ReadFileService.new('./spec/fixtures/example_with_repetition.log').call }
    it 'should have 2 logs, but only 1 entry' do
      expect(entry.count).to eq(2)
    end
    it 'should show the first IP' do
      expect(entry[0][:site_ip]).to eq('126.318.035.038')
    end
  end

  context 'returned hash with empty file' do
    let(:file) { ReadFileService.new('./spec/fixtures/empty_file.log').call }
    it 'should be in a specific format' do
      expect(file).to be_empty
    end
    it 'should have 0 elements' do
      expect(file.count).to eq(0)
    end
  end
end
