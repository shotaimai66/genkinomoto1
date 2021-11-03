class UserMailerPreview < ActionMailer::Preview
  #申込したゲストへのメール
  def request_reservation
    @user = User.first
    @reservation = Reservation.first
    UserMailer.request_reservation(@user, @reservation)
  end

  #スタッフへのメール
  def request_reservation_staff
    @user = User.first
    @reservation = Reservation.first
    UserMailer.request_reservation_staff(@user, @reservation)
  end

  #ゲストへの予約確定メール
  def reservation_confirm
    @user = User.first
    @reservation = Reservation.first
    UserMailer.reservation_confirm(@user, @reservation)
  end
end
