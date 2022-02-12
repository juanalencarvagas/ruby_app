# frozen_string_literal: true

require_relative '../app/parser'
require 'rspec'

# TODO: include functionalities
RSpec.describe Parser do
  subject { described_class.new(arguments).run }

  let(:arguments) { 'fixtures/example.log' }

  context 'file name' do
    let(:file) { Parser.new('fixtures/example.log') }
    let(:inexistent_file) { Parser.new('fixtures/inexistent_file.log') }
    it 'should not raise error with the right file name' do
      expect { file }.to_not raise_error
    end
  end
end
