class Inheritance

  class Dog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      "WOOF"
    end
  end

  class BullDog < Dog
    def bark
      super + ", GROWL"
    end
  end

  # Ensure <code>step into</code> <code>super</code> works
  def test_subclasses_can_invoke_parent_behavior_via_super
    ralph = BullDog.new("Ralph")
    ralph.bark #bp here
  end
end

inheritance = Inheritance.new

inheritance.test_subclasses_can_invoke_parent_behavior_via_super