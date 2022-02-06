class FlattenArray
  def self.flatten(array)
    array.flatten.find_all { |digit| !digit.nil? }
    # array.flatten.compact
  end
end
