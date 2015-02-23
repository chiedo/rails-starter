module CarsHelper
  # Concatenates two strings. Arguably not even necessary as the function name is obvious. But a good habit to comment.
  #
  # * *Args*    :
  #   - +x+ -> the string that will appear first.
  #   - +y+ -> the string that will appeor second
  # * *Returns* :
  #   - the concatenated string
  def concat_strings(x, y)
    return [x, y].join " "
  end
end
