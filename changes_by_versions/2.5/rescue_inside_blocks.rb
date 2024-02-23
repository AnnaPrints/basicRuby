# Ensure debugger steps correctly with rescue inside blocks
(0..5).map do |val| #bp here
  puts 100 / val
rescue ZeroDivisionError
  puts '<undividable>'
end