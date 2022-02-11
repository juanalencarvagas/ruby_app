# frozen_string_literal: true

require_relative '../parser'
require 'rspec'

RSpec.describe Parser do
  subject { described_class.new(arguments).run }

  let(:arguments) { 'fixtures/example.log' }

  context 'file name' do
    let(:file) { Parser.new('fixtures/example.log') }
    let(:inexistent_file) { Parser.new('fixtures/inexistent_file.log') }
    it 'should not raise error with the right file name' do
      expect { file }.to_not raise_error
    end
    # it "should raise an error if file name is not exist" do
    #   #expect { bad_name }.to eq be_a("Errno::ENOENT: File not found")
    #   expect { bad_name }.to raise_error(StandardError)
    # end
  end
end
