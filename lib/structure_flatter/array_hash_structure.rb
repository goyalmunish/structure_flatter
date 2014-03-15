require 'active_support/core_ext/string'

module StructureFlatter
  class ArrayHashStructure

    # initializing element
    # passed structure should be a simple or complex structure comprising Hashes and Arrays
    def initialize(array_hash_structure = nil)
      @array_hash_structure = array_hash_structure
    end

    # it flattens the given structure
    def flatten_structure!(array_hash_structure = @array_hash_structure)
      case array_hash_structure
        when Array
          array_hash_structure.each do |array_element|
            flatten_structure!(array_element) if ((array_element.class == Array) || (array_element.class == Hash))
          end
        when Hash
          array_hash_structure.each do |hash_key, hash_value|
            if hash_value.class == Array
              # trying to flatten the value
              ArrayHashStructure.flatten_key_value_pair!(hash_key, hash_value)
              # recursive call
              flatten_structure!(hash_value)
            elsif hash_value.class == Hash
              hash_value.each do |hash_value_key, hash_value_value|
                # recursive call
                flatten_structure!(hash_value_value)
              end
            else
              # do nothing
            end
          end
        else
          # do nothing
      end
      return array_hash_structure
    end

    # it tries to flatten the given key value pair
    def self.flatten_key_value_pair!(key, value)
      if self.is_key_value_pair_flattable?(key, value)
        value.each_index do |index|
          value[index] = value[index].values.first
        end
      end
      return [key, value]
    end

    # check if given key value pair is flattable
    def self.is_key_value_pair_flattable?(key, value)
      # key should be plural
      return false unless key.to_s.pluralize == key.to_s
      # value should be Array
      return false unless value.class == Array
      # checking each element of value (which is Array)
      value.each do |value_element|
        # should be hash
        return false unless value_element.class == Hash
        # it should have only one key-value pair
        return false unless value_element.count == 1
        # its key should be singular form of original key
        return false unless (value_element.keys.first.to_s != key.to_s) && (value_element.keys[0].to_s.pluralize == key.to_s)
      end
      return true
    end
  end
end

