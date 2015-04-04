require 'active_support/core_ext/string'

module StructureFlatter
  class ArrayHashStructure
    
    attr_reader :ahs

    # Initializing element
    # passed structure should be a simple or complex structure comprising Hashes and Arrays
    def initialize(array_hash_structure = nil)
      @ahs = array_hash_structure
    end

    # Flattening the given structure
    def flatten_structure!(strt = ahs)
      case strt
        when Array
          strt.each do |array_element|
            flatten_structure!(array_element) if ((array_element.class == Array) || (array_element.class == Hash))
          end
        when Hash
          strt.each do |hash_key, hash_value|
            if hash_value.class == Array
              # trying to flatten the value
              flatten_key_value_pair!(hash_key, hash_value)
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
      strt
    end

    private

    # Trying to flatten the given key value pair
    def flatten_key_value_pair!(key, value)
      if is_key_value_pair_flattable?(key, value)
        value.each_index do |index|
          value[index] = value[index].values.first
        end
      end
      [key, value]
    end

    # Checking if given key value pair is flattable
    def is_key_value_pair_flattable?(key, value)
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
      true
    end
  end
end

