# Refinements work in string interpolations
module Ref
  refine Time do
    def to_s
      "#{hour}:#{min} at #{month}/#{day}/#{year}"
    end
  end
end

using Ref


# Ensure debugger <code>step into</code> <code>to_s</code>
"Now is #{Time.now}" #bp here
