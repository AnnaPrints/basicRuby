# Ensure <code>numbered parameters</code> are visible in Tool window

# Simplest usage:
[10, 20, 30].map { _1 ** 2 } #bp here

# Multiple block parameters can be accessed as subsequent numbers
[10, 20, 30].zip([40, 50, 60], [70, 80, 90]).map { _1 + _2 + _3 } #bp here

# If only _1 is used for multi-argument block, it contains all arguments
[10, 20, 30].zip([40, 50, 60], [70, 80, 90]).map { _1.join(',') } #bp here