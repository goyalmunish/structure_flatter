require_relative '../spec_helper'

module StructureFlatter
  describe ArrayHashStructure do # EXAMPLE GROUP

    include VariousKeyValuePairs
    include VariousStructures

    describe '.is_root_flattable?' do
      it 'returns true for simple flattable key-value pair' do
        ArrayHashStructure.is_key_value_pair_flattable?(*key_value_pair_1).should be_true
      end

      it 'returns false for non-flattable nil value' do
        array = [:key, nil]
        ArrayHashStructure.is_key_value_pair_flattable?(*array).should be_false
      end

      it 'returns false for non-flattable empty array as value' do
        array = [:key, []]
        ArrayHashStructure.is_key_value_pair_flattable?(*array).should be_false
      end

      it 'returns false for non-flattable empty hash as value' do
        array = [:key, {}]
        ArrayHashStructure.is_key_value_pair_flattable?(*array).should be_false
      end

      it 'returns false for non-flattable key-value pair' do
        ArrayHashStructure.is_key_value_pair_flattable?(*key_value_pair_1_result).should be_false
      end
    end

    describe '.flatten_root!' do
      it 'flattens flattable key-value pair' do
        ArrayHashStructure.flatten_key_value_pair!(*key_value_pair_1).should == key_value_pair_1_result
      end

      it 'does not affect non-flattable key-value pair' do
        ArrayHashStructure.flatten_key_value_pair!(*key_value_pair_1_result).should == key_value_pair_1_result
      end

      it 'does not affect non-flattable key-value pair with nil value' do
        array = [:key, nil]
        ArrayHashStructure.flatten_key_value_pair!(*array).should == array
      end

      it 'does not affect non-flattable key-value pair with empty array as value' do
        array = [:key, []]
        ArrayHashStructure.flatten_key_value_pair!(*array).should == array
      end

      it 'does not affect non-flattable key-value pair with empty hash as value' do
        array = [:key, {}]
        ArrayHashStructure.flatten_key_value_pair!(*array).should == array
      end
    end

    describe '#flatten_structure!' do
      it 'returns nil structure as it is' do
        str = ArrayHashStructure.new(nil_structure).flatten_structure!
        str.should == nil_structure
      end
      it 'returns empty hash as it is' do
        str = ArrayHashStructure.new(empty_hash_structure).flatten_structure!
        str.should == empty_hash_structure
      end
      it 'returns empty array as it is' do
        str = ArrayHashStructure.new(empty_array_structure).flatten_structure!
        str.should == empty_array_structure
      end
      it 'flattens simple Hash structure' do
        str = ArrayHashStructure.new(simple_hash_structure).flatten_structure!
        str.should == simple_hash_structure_result
      end
      it 'flattens complex Hash structure' do
        str = ArrayHashStructure.new(complex_hash_structure).flatten_structure!
        str.should == complex_hash_structure_result
      end
      it 'flattens complex Hash with mixed string and keys structure' do
        str = ArrayHashStructure.new(complex_hash_with_mixed_string_and_keys_structure).flatten_structure!
        str.should == complex_hash_with_mixed_string_and_keys_structure_result
      end
      it 'flattens complex Array structure' do
        str = ArrayHashStructure.new(complex_array_structure).flatten_structure!
        str.should == complex_array_structure_result
      end
      it 'flattens complex nested structure' do
        str = ArrayHashStructure.new(complex_nested_structure).flatten_structure!
        #ap VariousStructures.structure4
        #ap VariousStructures.structure4_result
        #ap str
        str.should == complex_nested_structure_result
      end
    end

  end
end