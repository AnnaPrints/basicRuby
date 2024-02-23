class ClassReopen
  class ::Integer
    def answer_to_life_universe_and_everything?
      self == 42
    end
  end

  # Ensure debugger <code>step into</code> <code>answer_to_life_universe_and_everything?</code>
  def test_even_existing_built_in_classes_can_be_reopened
    1.answer_to_life_universe_and_everything? #bp here
    42.answer_to_life_universe_and_everything? #bp here
  end

  # ------------------------------------------------------------------

  class Dog
    def bark
      "WOOF"
    end
  end

  class Dog
    def wag
      "HAPPY"
    end
  end

  # Ensure debugger <code>step into</code> <code>wag</code> & <code>bark</code>
  def test_after_reopening_dogs_can_both_wag_and_bark
    fido = Dog.new
    fido.wag #bp here
    fido.bark #bp here
  end
end

class_reopen = ClassReopen.new
class_reopen.test_even_existing_built_in_classes_can_be_reopened
class_reopen.test_after_reopening_dogs_can_both_wag_and_bark