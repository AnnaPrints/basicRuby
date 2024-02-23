class Modules
  module Nameable
    def set_name(new_name)
      @name = new_name
    end

    def here
      :in_module
    end
  end

  class Dog
    include Nameable

    attr_reader :name

    def initialize
      @name = "Fido"
    end

    def bark
      "WOOF"
    end

    def here
      :in_object
    end
  end

  # Ensure debugger <code>step into</code> <code>Dog#here</code>
  def test_classes_can_override_module_methods
    fido = Dog.new
    fido.here #bp here
  end

  # Ensure debugger <code>step into</code> <code>Nameable#set_name</code>
  def test_module_methods_can_affect_instance_variables_in_the_object
    fido = Dog.new
    fido.set_name("Rover") #bp here
  end
end

modules = Modules.new
modules.test_module_methods_can_affect_instance_variables_in_the_object
modules.test_classes_can_override_module_methods
