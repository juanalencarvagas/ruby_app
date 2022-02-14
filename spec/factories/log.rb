# frozen_string_literal: true

require_relative '../../app/models/log'

FactoryBot.define do
  factory :log do
    register do
      [{ site_url: 'url_1', site_ip: 'ip_1' },
       { site_url: 'url_1', site_ip: 'ip_1' },
       { site_url: 'url_2', site_ip: 'ip_1' },
       { site_url: 'url_2', site_ip: 'ip_2' },
       { site_url: 'url_3', site_ip: 'ip_1' },
       { site_url: 'url_3', site_ip: 'ip_2' },
       { site_url: 'url_3', site_ip: 'ip_3' }]
    end
  end
end
