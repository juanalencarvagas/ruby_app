# frozen_string_literal: true

class FileNotFoundException < StandardError
  def initialize(msg = 'My default message')
    super(msg)
  end
end
