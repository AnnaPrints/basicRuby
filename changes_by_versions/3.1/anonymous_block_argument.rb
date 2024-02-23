# If method uses its block argument only to pass to another method, it can be marked by anonymous &.

def filter(data, &)
  block = proc(&)
  p block, block.call(5)
  data.filter(&)
end

# Ensure debugger <code>step into</code> <code>filter</code>
filter(1..10, &:odd?) #bp here

