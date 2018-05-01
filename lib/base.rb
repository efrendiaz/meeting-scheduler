
class Base
  # This is to be able to use initialization in this format Object.new(name: "name", test: "test")
  def initialize(*h)
    if h.length == 1 && h.first.kind_of?(Hash)
      h.first.each { |k,v| send("#{k}=",v) }
    end
  end
end