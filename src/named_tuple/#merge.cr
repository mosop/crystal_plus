require "./#to_h?"

struct NamedTuple
  def merge(other)
    if h = to_h?
      if other = other.to_h?
        T.from(h.merge(other))
      else
        self
      end
    else
      raise ArgumentError.new("Empty named tuples can't be merged with any non-empty tuples.") if other.to_h?
      self
    end
  end
end
