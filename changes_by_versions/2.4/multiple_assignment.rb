# Ensure debugger hit bp
points = [1, 2]
if (x, y = points.first) # bp here
  p [x, y]
end