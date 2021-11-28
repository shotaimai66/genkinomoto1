# カレンダー用に全ての予約枠を形成する
json.array! @reservations do |reservation|
  json.id reservation.id
  json.title reservation.title_for_guest
  json.start reservation.start_time
  json.end reservation.end_time
  # ログインしているユーザーの場合、自分の予約詳細に遷移できるURLを生成する
  if user_signed_in?
    if current_user.id == reservation.guest_id
      json.url reservation_url(reservation.id)
    end
  end
end
