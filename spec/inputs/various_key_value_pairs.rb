module VariousKeyValuePairs

  def key_value_pair_1
    key = :posts
    value = [
        {post: {name: 'p1', content: 'post one'}},
        {post: {name: 'p2', content: 'post two'}},
        {post: {name: 'p3', content: 'post three'}}
    ]
    return [key, value]
  end

  def key_value_pair_1_result
    key = :posts
    value = [
        {name: 'p1', content: 'post one'},
        {name: 'p2', content: 'post two'},
        {name: 'p3', content: 'post three'}
    ]
    return [key, value]
  end
end