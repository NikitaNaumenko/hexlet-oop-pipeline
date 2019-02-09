class Pipeline
  def initialize(pipes = [])
    @pipes = pipes
  end

  def pipe(pipe)
    Pipeline.new(@pipes + [pipe])
  end

  def call(pipes)
    @pipes.reduce(pipes) { |pipe, memo| memo.call(pipe) }
  end
end

pipeline = Pipeline.new
pipeline
  .pipe(->(values) { values.reject(&:empty?) })
  .pipe(->(values) { values.sort })
  .pipe(->(values) { values[values.size / 2] })
  .pipe(->(value) { "#{value}s" })
  .pipe(->(value) { value.upcase })
  .pipe(->(value) { puts value })
  .call(['', 'test', 'oop', '', '', 'jopa', 'huyoop'])
