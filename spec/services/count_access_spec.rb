# frozen_string_literal: true

require_relative '../..app/services/count_access_service'
require 'rspec'

RSpec.describe CountAccessService do
  subject { described_class.new(hash).call }

  context 'list of urls' do
    let(:hash) do
      [{ site_url: 'url_1', site_ip: 'ip_1' },
       { site_url: 'url_1', site_ip: 'ip_1' },
       { site_url: 'url_2', site_ip: 'ip_1' },
       { site_url: 'url_2', site_ip: 'ip_2' },
       { site_url: 'url_3', site_ip: 'ip_1' },
       { site_url: 'url_3', site_ip: 'ip_2' },
       { site_url: 'url_3', site_ip: 'ip_3' }]
    end
    it 'should return three groups in descending order of count ' do
      expect(subject).to eq([['url_3', 3], ['url_2', 2], ['url_1', 1]])
    end
  end
end
