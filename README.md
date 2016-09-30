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

## Index

* [Dir](#dir)
  * [.tmp](#dir.tmp) : makes a uniquely-named and temporary directory
* [NamedTuple](#named_tuple)
  * [#to_h?](#named_tuple#to_h?) : is a safe to_h
  * [#merge](#naemd_tuple#merge) : merges two named tuples
* [String](#string)
  * [#empty_to_nil](#string#empty_to_nil) : returns nil if empty

## Dir

<a name="dir"></a>

### .tmp

<a name="dir.tmp"></a>

Makes a uniquely-named directory and yields a passed block with the directory's path. The directory is to be deleted before this method returns.

```crystal
Dir.tmp do |dir|
  # The dir argument points to a new temporary directory.
end
# The directory is already deleted here.
```

#### Parameters

* base : a base directory's path whose a temporary directory will be created (default: `"/tmp"`)
* cleanup : whether to delete a created temporary directory before .tmp returns (default: `true`)

## NamedTuple

<a name="named_tuple"></a>

### #to_h?

<a name="naemd_tuple#to_h?"></a>

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

<a name="named_tuple#merge"></a>

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

merge(smile)          # => {face: ":)"}
merge(smile, **frown) # => {face: ":("}
merge(smile, **other) # => ArgumentError
reverse_merge(smile)  # => ArgumentError
```

## String

<a name="string"></a>

### #empty_to_nil

<a name="string#empty_to_nil"></a>

Returns nil if self is empty. Otherwise, self.

```crystal
require "cyrstal_plus/string/#empty_to_nil"

"abc".empty_to_nil # => "abc"
"".empty_to_nil # => nil
```

## Release Notes

* v0.1.2
  * String#empty_to_nil
* v0.1.1
  * Dir.tmp

## Contributing

1. Fork it ( https://github.com/mosop/crystal_plus/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [mosop](https://github.com/mosop) - creator, maintainer
