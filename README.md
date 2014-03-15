# StructureFlatter

When transforming data from one format to another, sometimes we end up with structures that have redundant information or a sub-optimal structure.
One type of such structure is an array of hash tables where the hash table has a redundant root element that is the singular version of the attribute on the parent object.

For example,


    {
      attribute_one: "foo",
      cars: [
        { car: { name: "c1", content: "car one" } },
        { car: { name: "c2", content: "car two" } },
        { car: { name: "c3", content: "car three" } }
      ]
    }

The "structure_flatter" library flattens all occurrences of the above type of structure from a given array or hash consisting of other hashes, arrays or attributes to arbitrary depth and complexity.

The result of providing the above example will be:

    {
      attribute_one: "foo",
      cars: [
        { name: "c1", content: "car one" },
        { name: "c2", content: "car two" },
        { name: "c3", content: "car three" }
      ]
    }


## Installation

Add this line to your application's Gemfile:

    gem 'structure_flatter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install structure_flatter

## Usage

Let str holds an array-hash structure that is to be flattened

    str = an_array_hash_structure_to_be_flatten

Use flatten_structure! method of ArrayHashStructure class to flatten the structure

    require 'structure_flatter'
    
    flattened_str = StructureFlatter::ArrayHashStructure.new(str).flatten_structure!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
