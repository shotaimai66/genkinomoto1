class UserMailer < ApplicationMailer
  #申込したゲストへのメール
  def request_reservation(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: @user.email,
         subject: "ゲンキノモト予約申込みメール")
  end

  #スタッフへのメール
  def request_reservation_staff(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: ENV["LOGIN_NAME"],
         subject: "予約申込みメール")
  end

  #スタッフへのメール
  def reservation_confirm(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: @user.email,
         subject: "ゲンキノモト予約確定メール")
  end
end
