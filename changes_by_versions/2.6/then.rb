# Ensure debugger <code>step into</code> works fine with `.then`
"first,second,third".split(',') #bp here
                    .then { |arr| arr.map { |elem| elem.capitalize } }
                    .then { |arr| puts arr }