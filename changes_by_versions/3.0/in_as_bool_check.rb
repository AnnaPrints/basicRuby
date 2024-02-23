users = [
  { name: 'John', role: 'user' },
  { name: 'Jane', registered_at: Time.new(2017, 5, 8) },
  { name: 'Barb', role: 'admin' },
  { name: 'Dave', role: 'user' }
]
old_users_range = Time.new(2016)..Time.new(2019)

# Ensure debugger hits breakpoint with <code>in</code>
users.select { |u| u in { role: 'admin' } | { registered_at: ^old_users_range } } #db here

p old_users_range