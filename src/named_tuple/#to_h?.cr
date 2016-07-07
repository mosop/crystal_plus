struct NamedTuple
  def to_h?
    {% unless T.empty? %}
      to_h
    {% end %}
  end
end
