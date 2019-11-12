class Stream
  attr_accessor :callbacks

  def initialize
    @callbacks = []
  end

  def listen(&b)
    callbacks.unshift b
  end

  def consume(data)
    callbacks.each do |c|
      c.call(data)
    end
  end
end

class Sink
  def initialize(controller)
    @controller = controller
  end

  def add(data)
    @controller.notify(data)
  end
end

class StreamController

  attr_reader :stream, :sink

  def initialize
    @stream = Stream.new
    @sink = Sink.new(self)
  end

  def notify(data)
    @stream.consume(data)
  end
end

def main
  controller = StreamController.new

  controller.stream.listen do |data|
    puts "consumer1: #{data}"
  end

  controller.sink.add("data1")

  controller.stream.listen do |data|
    puts "consumer2: #{data}"
  end

  controller.sink.add("data2")
  controller.sink.add("data3")
end

main

