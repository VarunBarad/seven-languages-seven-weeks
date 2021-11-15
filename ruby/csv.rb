class CsvRow
  attr :data

  def initialize(data={})
    @data = data
  end

  def method_missing(symbol, *args)
    @data[symbol.to_s]
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = "#{self.class.to_s.downcase}.csv"
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each(&block)
      @csv_contents.each do |row|
        transformed_array = {}
        row.each_with_index { |value, index| transformed_array[@headers[index]] = value }
        block.call(CsvRow.new(transformed_array))
      end
    end
  end
end

class Test
  include ActsAsCsv
  acts_as_csv
end

m = Test.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.two }
