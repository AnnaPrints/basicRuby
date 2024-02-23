# Refinements are supported in Symbol#to_proc and send

module Tests
  refine Numeric do
    def normalize100
      clamp(0, 100)
    end
  end
end

using Tests

# Ensure debugger <code>step into</code> <code>normalize100</code>
p [1, 700, 132].map(&:normalize100) #bp here

# Ensure debugger <code>step into</code> <code>normalize100</code>
p 123.send(:normalize100) #bp here