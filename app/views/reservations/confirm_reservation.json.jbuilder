json.array! @reservations do |reservation|
  json.id reservation.id
  json.title reservation.title_for_staff
  json.start reservation.start_time
  json.end reservation.end_time
  if reservation.on_reserve?
    json.url edit_reserve_reservation_url(reservation.id)
  end
end
