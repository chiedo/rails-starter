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

  # Returns details about a car as a string. This may not be in the right place, but this is here primarily
  # for educational purposes on mocking.
  #
  # * *Args*    :
  #   - +car+ -> A car
  # * *Returns* :
  #   - the final string
  def car_details(car)
    unless(car.nil?)
      return car.name + " - " + car.description + " - $" + car.price.to_s
    else
      return "No details present"
    end
  end
end
