# frozen_string_literal: true

# This class read a file and return a hash
class ReadFileService
  attr_accessor :file, :site_list

  def initialize(file)
    @file = file
    @site_list = []
  end

  def call
    read_and_split
  end

  private

  def read_and_split
    raise StandardError, 'Errno::ENOENT: File not found' unless File.exist?(file)

    File.open(file, 'r') do |file|
      file.each_line do |line|
        site_list << split_log(line)
      end
      file.close
    end
    site_list
  end

  def split_log(line)
      item = line.split
      { site_url: item[0], site_ip: item[1] }
  end
end
