require_relative '../spec_helper'

module StructureFlatter
  describe ArrayHashStructure do # EXAMPLE GROUP

    include VariousKeyValuePairs
    include VariousStructures
    
    describe '#flatten_structure!' do
      it 'returns nil structure as it is' do
        str = ArrayHashStructure.new(nil_structure).flatten_structure!
        expect(str).to eq(nil_structure)
      end
      it 'returns empty hash as it is' do
        str = ArrayHashStructure.new(empty_hash_structure).flatten_structure!
        expect(str).to eq(empty_hash_structure)
      end
      it 'returns empty array as it is' do
        str = ArrayHashStructure.new(empty_array_structure).flatten_structure!
        expect(str).to eq(empty_array_structure)
      end
      it 'flattens simple Hash structure' do
        str = ArrayHashStructure.new(simple_hash_structure).flatten_structure!
        expect(str).to eq(simple_hash_structure_result)
      end
      it 'flattens complex Hash structure' do
        str = ArrayHashStructure.new(complex_hash_structure).flatten_structure!
        expect(str).to eq(complex_hash_structure_result)
      end
      it 'flattens complex Hash with mixed string and keys structure' do
        str = ArrayHashStructure.new(complex_hash_with_mixed_string_and_keys_structure).flatten_structure!
        expect(str).to eq(complex_hash_with_mixed_string_and_keys_structure_result)
      end
      it 'flattens complex Array structure' do
        str = ArrayHashStructure.new(complex_array_structure).flatten_structure!
        expect(str).to eq(complex_array_structure_result)
      end
      it 'flattens complex nested structure' do
        str = ArrayHashStructure.new(complex_nested_structure).flatten_structure!
        expect(str).to eq(complex_nested_structure_result)
      end
    end

    # For developer
    describe 'PRIVATE_INTERFACE' do
      describe '#is_key_value_pair_flattable?' do
        it 'returns true for simple flattable key-value pair' do
          expect(ArrayHashStructure.new.send(:is_key_value_pair_flattable?, *key_value_pair_1)).to be true
        end

        it 'returns false for non-flattable nil value' do
          array = [:key, nil]
          expect(ArrayHashStructure.new.send(:is_key_value_pair_flattable?, *array)).to be false
        end

        it 'returns false for non-flattable empty array as value' do
          array = [:key, []]
          expect(ArrayHashStructure.new.send(:is_key_value_pair_flattable?, *array)).to be false
        end

        it 'returns false for non-flattable empty hash as value' do
          array = [:key, {}]
          expect(ArrayHashStructure.new.send(:is_key_value_pair_flattable?, *array)).to be false
        end

        it 'returns false for non-flattable key-value pair' do
          expect(ArrayHashStructure.new.send(:is_key_value_pair_flattable?, *key_value_pair_1_result)).to be false
        end
      end

      describe '#flatten_key_value_pair!' do
        it 'flattens flattable key-value pair' do
          expect(ArrayHashStructure.new.send(:flatten_key_value_pair!, *key_value_pair_1)).to eq(key_value_pair_1_result)
        end

        it 'does not affect non-flattable key-value pair' do
          expect(ArrayHashStructure.new.send(:flatten_key_value_pair!, *key_value_pair_1_result)).to eq(key_value_pair_1_result)
        end

        it 'does not affect non-flattable key-value pair with nil value' do
          array = [:key, nil]
          expect(ArrayHashStructure.new.send(:flatten_key_value_pair!, *array)).to eq(array)
        end

        it 'does not affect non-flattable key-value pair with empty array as value' do
          array = [:key, []]
          expect(ArrayHashStructure.new.send(:flatten_key_value_pair!, *array)).to eq(array)
        end

        it 'does not affect non-flattable key-value pair with empty hash as value' do
          array = [:key, {}]
          expect(ArrayHashStructure.new.send(:flatten_key_value_pair!, *array)).to eq(array)
        end
      end
    end

  end
end
