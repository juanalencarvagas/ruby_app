# frozen_string_literal: true

class SortHash
  attr_accessor :hash

  def initialize(hash)
    @hash = hash
  end

  def run
    hash.sort_by { |_k, v| v }.reverse
  end
end
