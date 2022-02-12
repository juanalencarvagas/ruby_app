# frozen_string_literal: true

require_relative 'services/services'

# This is the main class that receives the file and make the transformation
class Parser
  attr_accessor :file

  def initialize(args)
    @file = args[0]
  end

  def run
    site_list = ReadFileService.new(file).call

    sorted_list = CountAccessService.new(site_list).call

    PrintService.new(sorted_list).call
  end
end

Parser.new(ARGV).run if $PROGRAM_NAME == __FILE__
