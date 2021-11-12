module ReservationsHelper
  def color(date)
    if date == "6"
      "table-blue"
    elsif date == "7"
      "table-red"
    end
  end
end
