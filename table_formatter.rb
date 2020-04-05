class TableFormatter
  def initialize(data, header, separator)
    @data = data
    @header = header
    @s = separator
  end

  def format
    calculate_amount_of_columns
    calculate_longest_words
    format_header
    format_data
    @data_lines.unshift(@header_text)
  end

  def calculate_longest_words
    @col_lenghts = []
    @col_count.times do |t|
      @col_lenghts << (@data + [@header]).map { |el| el[t].to_s.length }.max
    end
  end

  def calculate_amount_of_columns
    @col_count = (@data + [@header]).map(&:length).min
  end

  def format_header
    @header_text = @s
    @col_lenghts.each_with_index do |l, i|
      remaining_length = l - @header[i].to_s.length
      @header_text += ' ' + @header[i].to_s + (' ' * remaining_length) + " #{@s}"
    end
  end

  def format_data
    @data_lines = @data.map do |d|
      line_text = @s
      @col_lenghts.each_with_index do |l, i|
        remaining_length = l - d[i].to_s.length
        line_text += ' ' + d[i].to_s + (' ' * remaining_length) + " #{@s}"
      end
      line_text
    end
  end

  def self.format(data, header, separator)
    new(data, header, separator).format
  end
end
