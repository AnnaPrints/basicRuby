# Various verifications related to constants
# Ensure, that constants visible in debugger tool window
# Inspect constants in evaluate expression

class AboutConstants
  TOP_LEVEL = 42

  class Animal
    LEGS = 4

    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  # Ensure debugger <code>step into</code> <code>legs_in_nested_animal</code>
  # and constants are visible in Tool Window
  def test_nested_classes_inherit_constants_from_enclosing_classes
    Animal::NestedAnimal.new.legs_in_nested_animal #bp here
  end
end

about_constants = AboutConstants.new
about_constants.test_nested_classes_inherit_constants_from_enclosing_classes