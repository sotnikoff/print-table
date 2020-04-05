require_relative './table_formatter.rb'
require_relative './table_printer.rb'

data = [[1, 'Google'], [2, 'Yandex'], [3, 'Yahoo'], [4, 'Amazon'], [5, 'AOL'], [6, 'Facebook']]
header = ['ID', 'Company']

TablePrinter.print(data, header, '$', TableFormatter)
