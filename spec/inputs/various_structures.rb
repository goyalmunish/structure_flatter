module VariousStructures

  def nil_structure
    nil
  end

  def empty_hash_structure
    {}
  end

  def empty_array_structure
    []
  end

  def very_simple_hash_structure
    {:key1 => :value1, :key2 => :value2, :key => :value3}
  end

  def very_simple_array_structure
    %w(value1, value2, value3)
  end

  def simple_hash_structure
    {
        posts: [
            {post: {name: 'p1', content: 'post one'}},
            {post: {name: 'p2', content: 'post two'}},
            {post: {name: 'p3', content: 'post three'}}
        ]
    }
  end

  def simple_hash_structure_result
    {
        posts: [
            {name: 'p1', content: 'post one'},
            {name: 'p2', content: 'post two'},
            {name: 'p3', content: 'post three'}
        ]
    }
  end

  def complex_hash_structure
    {
        attribute_one: 'foo',
        posts: [
            {post: {name: 'p1', content: 'post one'}},
            {post: {name: 'p2', content: 'post two'}},
            {post: {name: 'p3', content: 'post three'}}
        ]
    }
  end

  def complex_hash_structure_result
    {
        attribute_one: 'foo',
        posts: [
            {name: 'p1', content: 'post one'},
            {name: 'p2', content: 'post two'},
            {name: 'p3', content: 'post three'}
        ]
    }
  end

  def complex_hash_with_mixed_string_and_keys_structure
    {
        :attribute_one =>  'foo',
        posts: [
            {'post' =>  {'name' =>  'p1', content: 'post one'}},
            {:post => {name: 'p2', content: 'post two'}},
            {post: {name: 'p3', content: 'post three'}}
        ]
    }
  end

  def complex_hash_with_mixed_string_and_keys_structure_result
    {
        attribute_one: 'foo',
        posts: [
            {'name' => 'p1', content: 'post one'},
            {name: 'p2', content: 'post two'},
            {name: 'p3', content: 'post three'}
        ]
    }
  end

  def complex_array_structure
    ['first_element',
     {
         attribute_one: 'foo',
         cars: [
             {car: {name: 'p1', content: 'car one'}},
             {car: {name: 'p2', content: 'car two'}},
             {car: {name: 'p3', content: 'car three'}}
         ]
     }]
  end

  def complex_array_structure_result
    ['first_element',
     {
         attribute_one: 'foo',
         cars: [
             {name: 'p1', content: 'car one'},
             {name: 'p2', content: 'car two'},
             {name: 'p3', content: 'car three'}
         ]
     }]
  end

  def complex_nested_structure
    {
        attribute_one: 'foo',
        posts: [
            {post: {name: 'p1', content: 'post one'}},
            {post: {name: 'p2', content: 'post two'}},
            {post: {name: 'p3', content: 'post three'}}
        ],
        cars: [
            {car: {name: 'p1', content: 'car one'}},
            {car: {name: 'p2', content: 'car two'}},
            {car: {name: 'p3', content: 'car three'}}
        ],
        attribute_three: [1, 2,
                          {
                              attribute_one: 'foo',
                              cars: [
                                  {car: {name: 'p1', content: 'car one'}},
                                  {car: {name: 'p2', content: 'car two'}},
                                  {car: {name: 'p3', content: 'car three'}}
                              ]
                          }]
    }
  end

  def complex_nested_structure_result
    {
        attribute_one: 'foo',
        posts: [
            {name: 'p1', content: 'post one'},
            {name: 'p2', content: 'post two'},
            {name: 'p3', content: 'post three'}
        ],
        cars: [
            {name: 'p1', content: 'car one'},
            {name: 'p2', content: 'car two'},
            {name: 'p3', content: 'car three'}
        ],
        attribute_three: [1, 2,
                          {
                              attribute_one: 'foo',
                              cars: [
                                  {name: 'p1', content: 'car one'},
                                  {name: 'p2', content: 'car two'},
                                  {name: 'p3', content: 'car three'}
                              ]
                          }]
    }
  end
end