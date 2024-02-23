# Ensure debugger stepping works correctly with exceptions control statements
class Exceptions
  def test_rescue_clause
    result = nil #bp here
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    ex.message
    result
  end

  def test_ensure_clause
    result = nil #bp here
    begin
      fail "Oops"
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    result
  end

end

exceptions = Exceptions.new
exceptions.test_rescue_clause
exceptions.test_ensure_clause