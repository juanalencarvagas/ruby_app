# frozen_string_literal: true

# This class print a received list/hash
class PrintService
  attr_accessor :site_hash

  def initialize(site_hash)
    @site_hash = site_hash
  end

  def call
    site_hash.each do |key, value|
      print "#{key} #{value} unique views\n"
    end
  end
end
