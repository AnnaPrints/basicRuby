# Various verifications related to classes
# Ensure, that debugger goes to `end` on step into

class ClassMethods
  class Dog
  end

  # Ensure debugger <code>step into</code> <code>wag</code>
  def test_you_can_define_methods_on_individual_objects
    fido = Dog.new

    def fido.wag
      :fidos_wag
    end

    fido.wag #bp here
  end

  # ------------------------------------------------------------------

  class Dog2
  end

  def Dog2.wag
    :class_level_wag
  end

  # Ensure debugger <code>step into</code> <code>wag</code>
  def test_since_classes_are_objects_you_can_define_singleton_methods_on_them_too
    Dog2.wag #bp here
  end

  # ------------------------------------------------------------------

  class Dog
    def Dog.a_class_method
      :dogs_class_method
    end

    def self.class_method2
      :another_way_to_write_class_methods
    end

    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  # Ensure debugger <code>step into</code> <code>a_class_method</code>
  def test_you_can_define_class_methods_inside_the_class
    Dog.a_class_method #bp here
  end

  # Ensure debugger <code>step into</code> <code>class_method2</code>
  def test_you_can_use_self_instead_of_an_explicit_reference_to_dog
    Dog.class_method2 #bp here
  end

  # Ensure debugger <code>step into</code> <code>another_class_method</code>
  def test_heres_still_another_way_to_write_class_methods
    Dog.another_class_method #bp here
  end
end

class_methods = ClassMethods.new
class_methods.test_you_can_define_methods_on_individual_objects
class_methods.test_since_classes_are_objects_you_can_define_singleton_methods_on_them_too
class_methods.test_you_can_define_class_methods_inside_the_class
class_methods.test_you_can_use_self_instead_of_an_explicit_reference_to_dog
class_methods.test_heres_still_another_way_to_write_class_methods