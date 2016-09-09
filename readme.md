### SelectWhere

Simple select helpers with standalone or extension APIs. Specify target values with simple values or Procs.

##### Install

Add the following line to your Gemfile:

```ruby
gem 'select_where'
```

##### Standalone

```ruby
require 'select_where'

arr = [{ a: 1 }, { a: 2 }]
SelectWhere.select(arr, { a: 2 }) # => [{ a: 2}]
SelectWhere.detect(arr, { a: 2 }) # => { a: 2}
SelectWhere.select(arr, { a: ->(v) { v > 0 } }) # => [{ a: 1 }, { a: 2 }]
```

##### As an extension

```ruby
require 'select_where/core_ext/array'

arr = [{ a: 1 }, { a: 2 }]
arr.select_where({ a: 2 }) # => [{ a: 2}]
arr.detect_where({ a: 2 }) # => { a: 2}
arr.select_where({ a: ->(v) { v > 0 } }) # => [{ a: 1 }, { a: 2 }]
```
