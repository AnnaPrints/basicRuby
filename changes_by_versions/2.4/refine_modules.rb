# refine can refine modules, too

module Tests
  refine Enumerable do
    def tally
      each_with_object(Hash.new(0)) { |el, counter| counter[el] += 1 }
    end
  end
end

using Tests
# Ensure debugger <code>step into</code> <code>tally</code>
p [1, 3, 1, 2, 1, 3].tally #bp here