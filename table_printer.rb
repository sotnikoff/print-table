class TablePrinter
  def initialize(data, header, separator, formatter)
    @data = data
    @header = header
    @separator = separator
    @formatter = formatter
  end

  def print
    formatted_data = @formatter.format(@data, @header, @separator)
    formatted_data.each { |line| puts line }
  end

  def self.print(data, header, separator, formatter)
    new(data, header, separator, formatter).print
  end
end
