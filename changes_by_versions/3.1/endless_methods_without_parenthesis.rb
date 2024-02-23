# Inside “endless” method definitions, method calls without parenthesis are allowed

def log(msg) = puts "#{Time.now}: #{msg}"

# Ensure debugger <code>step into</code> <code>log</code>
log(42) #bp here