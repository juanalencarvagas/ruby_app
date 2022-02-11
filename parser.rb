# frozen_string_literal: true

require_relative 'error'
require_relative 'sort_hash'

class Parser
  attr_accessor :file

  def initialize(args)
    @file = args[0]
  end

  def run
    # if not File.exists?(@file)
    #   raise StandardError.new "Errno::ENOENT: File not found"
    #   return
    # end

    read_file

    raise StandardError, 'File not found' unless File.exist?(@file)
  end

  def read_file
    site_list = {}
    File.open(@file, 'r') do |file|
      file.each_line do |line|
        item = line.split(' ')
        site_url = item[0]
        site_count = replace_point_in_page_views(item[1])

        site_list[site_url] = site_count
      end
      file.close
    end

    sorted_list = SortHash.new(site_list).run

    print_list_url(sorted_list)
  end

  def replace_point_in_page_views(item)
    item.gsub('.', '')
  end

  def print_list_url(site_list)
    site_list.each do |key, value|
      puts "#{key} #{format_number(value)} unique views"
    end
  end

  def format_number(number)
    num_groups = number.to_s.chars.to_a.reverse.each_slice(3)
    num_groups.map(&:join).join('.').reverse
  end
end

print(Parser.new(ARGV).run) if $PROGRAM_NAME == __FILE__
