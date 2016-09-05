### SelectWhere

Simple select helpers with standalone or extension APIs. Specify target values with simple values or Procs.

##### Standalone

```ruby
require 'select_where'

arr = [{ a: 1 }, { a: 2 }]
SelectWhere.select(arr, { a: 2 }) # => [{ a: 2}]
SelectWhere.detect(arr, { a: 2 }) # => { a: 2}
SelectWhere.select(arr, { a: ->(v) { v > 0 } }) # => [{ a: 1 }, { a: 2 }]
```

##### With extension

```ruby
require 'select_where/core_ext/array'

arr = [{ a: 1 }, { a: 2 }]
arr.select_where(arr, { a: 2 }) # => [{ a: 2}]
arr.detect_where(arr, { a: 2 }) # => { a: 2}
arr.select_where(arr, { a: ->(v) { v > 0 } }) # => [{ a: 1 }, { a: 2 }]
```
