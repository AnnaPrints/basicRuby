# Ensure debugger hits following breakpoints
{db: {user: 'John', role: 'admin'}} => {db: {user:, role:}} #bp here
p [user, role]

# pattern-matching as a rightward assignment for long experessions:
"a,b,c,d,e,f,g".split(",")
    .map(&:strip)
    .reject(&:empty?)
    .first(10) => lines #bp here

p lines