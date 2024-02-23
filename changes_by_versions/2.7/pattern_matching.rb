require 'open-uri'
require 'json'

data = URI.open('https://api.github.com/repos/ruby/ruby/pulls').read
          .then { |body| JSON.parse(body, symbolize_names: true) }

# Ensure debugger works with pattern matching
data in [{ user: { login: }, title:, created_at: }, *] # bp here

p [login, title, created_at] # bp here