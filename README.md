# Crystal Plus

An extension of the Crystal standard library.

[![Build Status](https://travis-ci.org/mosop/crystal_plus.svg?branch=master)](https://travis-ci.org/mosop/crystal_plus)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crystal_plus:
    github: mosop/crystal_plus
```

## NamedTuple

### #to_h?

```crystal
def test_to_h(**options)
  options.to_h
end

test_to_h # compile error
```

```crystal
require "cyrstal_plus/named_tuple/#to_h?"

def test_to_h?(**options)
  options.to_h?
end

test_to_h? # => nil
```

## #merge

```crystal
require "cyrstal_plus/named_tuple/#merge"

def merge(tuple, **options)
  tuple.merge(options)
end

def reverse_merge(tuple, **options)
  options.merge(tuple)
end

smile = {face: ":)"}
frown = {face: ":("}
other = {other: ":P"}

merge(smile).should   # => {face: ":)"}
merge(smile, **frown) # => {face: ":("}
merge(smile, **other) # => ArgumentError
reverse_merge(smile)  # => ArgumentError
```

## Contributing

1. Fork it ( https://github.com/mosop/crystal_plus/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [mosop](https://github.com/mosop) - creator, maintainer
