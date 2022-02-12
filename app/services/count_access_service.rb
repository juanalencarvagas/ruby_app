# frozen_string_literal: true

# This class receive a hash of IPs and return the counting
class CountAccessService
  attr_accessor :hash

  def initialize(hash)
    @hash = hash
  end

  def call
    ip_count = hash.uniq.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:site_url]] += 1 }
    ip_count.sort_by { |_k, v| v }.reverse
  end
end
