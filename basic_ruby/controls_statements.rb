# Various verifications related to constants

# Ensure debugger stepping works correctly with control statements
class ControlStatements
  def test_if_then_else_statements
    if 2 + 2 == 5 #bp here
      result = :true_value
    else
      result = :false_value
    end
    result
  end

  def test_ternary_operator
    2 + 2 == 5 ? :true : :false #bp here
  end

  def test_while_statement
    i = 1
    result = 1
    while i <= 10 #bp here
      result = result * i
      i += 1
    end
    result
  end

  def test_break_statement
    i = 1
    result = 1
    while true #bp here
      break unless i <= 10
      result = result * i
      i += 1
    end
    result
  end

  def test_next_statement
    i = 0
    result = []
    while i < 10 #bp here
      i += 1
      next if (i % 2) == 0
      result << i
    end
    result
  end

end

controls_statements = ControlStatements.new

controls_statements.test_if_then_else_statements
controls_statements.test_ternary_operator
controls_statements.test_while_statement
controls_statements.test_break_statement
controls_statements.test_next_statement