# Ensure <code>hashes</code> are correctly represented in Tool Window
# Don't forget to toggle <code>Key/Value presentation of Hash content</code> at <code>Preferences | Build, Execution, Deployment | Debugger</code>
class Hashes

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    hash #bp here
  end

  def test_default_value_with_block
    hash = Hash.new { |hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    hash[:one]
    hash[:two]
    hash[:three] #bp here
  end

end

hashes = Hashes.new
hashes.test_hash_literals
hashes.test_default_value_with_block