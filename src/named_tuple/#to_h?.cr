struct NamedTuple
  def to_h?
    {% unless T.empty? %}
      {
        {% for key in T %}
          {{key.symbolize}} => self[{{key.symbolize}}],
        {% end %}
      }
    {% end %}
  end
end
