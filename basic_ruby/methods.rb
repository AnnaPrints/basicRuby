class Methods

  def method_with_defaults(a, b = :default_value)
    [a, b]
  end

  # Ensure debugger <code>step into</code> <code>method_with_defaults</code>
  def test_calling_with_default_values
    method_with_defaults(1) #bp here
    method_with_defaults(1, 2) #bp here
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*args)
    args
  end

  # Ensure debugger <code>step into</code> <code>method_with_var_args</code>
  def test_calling_with_variable_arguments
    method_with_var_args(:one, :two) #bp here
  end

  # ------------------------------------------------------------------

  def my_method_in_the_same_class(a, b)
    a * b
  end

  # Ensure debugger <code>step into</code> <code>my_method_in_the_same_class</code>
  def test_calling_methods_in_same_class_with_explicit_receiver
    self.my_method_in_the_same_class(3, 4) #bp here
  end

  # ------------------------------------------------------------------

  def something
    [1, 2, 3, 1]
  end

  # Ensure debugger <code>step into</code> representation for chained called methods
  def test_chained_calls
    something #bp here
      .map { |n| n * n }
      .select { |n| n.even? }
      .map { |x| [x, x * 3] }
      .to_h
  end

  def empty_body

  end

  def empty_body_attr(attr)

  end

  def empty_body_inline; end


  def empty_body_inline_attr(attr); end

  # Ensure debugger <code>step into</code> methods with empty bodies
  def test_empty_bodies
    empty_body #bp here
    empty_body_attr 42 #bp here
    empty_body_inline #bp here
    empty_body_inline_attr 42#bp here
  end

  # ------------------------------------------------------------------

  class Dog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end

    def to_s
      @name
    end
  end

  # Ensure debugger <code>step into</code> <code>to_s</code>
  def test_to_s_is_used_in_string_interpolation
    fido = Dog4.new
    fido.set_name("Fido")
    "My dog is #{fido}" #bp here
  end

end

methods = Methods.new
methods.test_calling_with_default_values
methods.test_calling_with_variable_arguments
methods.test_calling_methods_in_same_class_with_explicit_receiver
methods.test_chained_calls
methods.test_empty_bodies
methods.test_to_s_is_used_in_string_interpolation
methods.test_attr_reader_will_automatically_define_an_accessor