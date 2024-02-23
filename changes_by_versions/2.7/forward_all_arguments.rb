def bar(...)
  puts(...)
end

def foo(...)
  bar(...)
end

# Ensure debugger <code>step into</code> <code>foo</code> & <code>bar</code>
foo(1, 2, 3)#bp here