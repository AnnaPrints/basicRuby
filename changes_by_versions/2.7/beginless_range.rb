# Ensure debugger <code>step into</code> correctly with beginless range
creation_time = Time.now.to_i
case creation_time #bp here
when ...(Time.now.to_i - 1) then puts 'ancient'
when Time.now.to_i... then puts 'new'
end

r = ..10
# Ensure beginless range is visible in Tool Window
r.begin #bp here

