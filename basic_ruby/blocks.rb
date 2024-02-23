# Various verifications related to blocks

class AboutBlocks
  def method_with_block
    yield
  end

  def test_methods_can_take_blocks
    method_with_block { 1 + 2 }
  end

  def method_with_block_arguments
    yield("Jim")
  end

  def test_blocks_can_take_arguments

    method_with_block_arguments do |argument|
      argument
    end
  end

  # Ensure that debugger <code>stop/step into</code> in block, <code>block</code> variables are visible in Tool Window
  def test_stand_alone_blocks_can_be_passed_to_methods_expecting_blocks
    make_upper = lambda { |n| n.upcase } #bp here
    method_with_block_arguments(&make_upper)
  end

  def many_yields
    yield(:peanut)
    yield(:butter)
    yield(:and)
    yield(:jelly)
  end

  # Ensure that debugger stop in <code>blocks</code>, correctly <code>step into</code> several yields
  def test_methods_can_call_yield_many_times
    result = []
    many_yields { |item| result << item } #bp here
    result
  end

  # Ensure <code>block</code> as variable is visible in Tool Window
  def test_blocks_can_be_assigned_to_variables_and_called_explicitly
    add_one = lambda { |n| n + 1 }
    add_one.call(10) #bp here
    add_one_lambda_literal = ->(x) { x + 1 }

    add_one_lambda_literal.call(10) #bp here
    # Alternative calling syntax
    add_one[10] #bp here
  end

  def method_with_explicit_block(&block)
    block.call(10)
  end

  # Ensure that <code>block</code> is visible, when <code>block</code> passed as argument
  def test_methods_can_take_an_explicit_block_argument
    method_with_explicit_block { |n| n * 2 } #bp here
  end

end

about_blocks = AboutBlocks.new
about_blocks.test_blocks_can_take_arguments
about_blocks.test_methods_can_take_blocks
about_blocks.test_stand_alone_blocks_can_be_passed_to_methods_expecting_blocks
about_blocks.test_methods_can_call_yield_many_times
about_blocks.test_blocks_can_be_assigned_to_variables_and_called_explicitly
about_blocks.test_methods_can_take_an_explicit_block_argument