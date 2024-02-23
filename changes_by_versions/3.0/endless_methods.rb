def dbg = puts("DBG: #{caller.first}")

# Ensure debugger <code>step into</code> <code>dbg</code>
dbg #bp here

def dbg_args(a, b=1, c:, d: 6, &block) = puts("Args passed: #{[a, b, c, d, block.call]}")

# Ensure debugger <code>step into</code> <code>dbg_args</code>
dbg_args(0, c: 5) { 7 } #bp here