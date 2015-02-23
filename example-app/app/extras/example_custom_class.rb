# This class only exists for the purposes of demonstrating a basic example

class ExampleCustomClass

  # Initialize
  #
  # * *Args*    :
  #   - +name+ -> Someone's name
  #   - +age+ -> Someone's age
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Returns someone's name
  def name
    return @name
  end

  # Returns someone's age
  def age
    return @age
  end
end
