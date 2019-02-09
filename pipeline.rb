# class Pipeline
#   def initialize(pipes = [])
#     @pipes = pipes
#   end

#   def pipe(pipe)
#     Pipeline.new(@pipes + [pipe])
#   end

#   def call(value)
#     @pipes.reduce(value) { |val, func| func.call(val) }
#   end
# end

# pipeline = Pipeline.new
# pipeline
#   .pipe(->(values) { values.reject(&:empty?) })
#   .pipe(->(values) { values.sort })
#   .pipe(->(values) { values[values.size / 2] })
#   .pipe(->(value) { "#{value}s" })
#   .pipe(->(value) { value.upcase })
#   .pipe(->(value) { puts value })
#   .call(['', 'test', 'oop', '', '', 'jopa', 'huyoop'])

class Main
  def run(files)
    rejected_files = files.reject { |name| check_initial?(name, '.') }.sort
    middle_element = get_middle_element(rejected_files)
    plural_string = pluralize(middle_element)
    upcase_string = plural_string.upcase
    upcase_string
  end

  def check_initial?(string, sym)
    string[0].eql?(sym)
  end

  def get_middle_element(array)
    array[array.size / 2]
  end

  def pluralize(string, sym = 's')
    string[-1].eql?('s') ? string : "#{string}#{sym}"
  end
end

files = Dir.entries('.')
main = Main.new
pp main.run(files)
