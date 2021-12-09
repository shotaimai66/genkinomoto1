class Reservation < ApplicationRecord
  belongs_to :guest, class_name: 'User'
  # reservation: trueを記述する事でreservation_validator.rbのバリデーションを有効にする
  validates :start_time, presence: true, reservation: true
  validates :end_time, reservation: true
  validates :course, presence: true
  validates :guest_id, presence: true
  # validates :treatment_menu, presence: true
  # validates :treatment_time_menu, presence: true
  # validates :charge_menu, presence: true
  validates :comment, length: { maximum: 200 }
  # validate :day_after_today
  validate :in_working_time
  validate :end_time_is_invalid_without_a_start_time
  # validate :end_time_is_invalid_earlier_than_a_start_time
  

  # def day_after_today
  #   errors.add(:start_time, 'は、明日以降の日時を入力して下さい。') if start_time < Date.tomorrow
  # end

  def in_working_time
    errors.add(:start_time, 'は、19時以前の日時を入力して下さい。') if start_time.hour > 19
    errors.add(:start_time, 'は、10時以降の日時を入力して下さい。') if start_time.hour < 10
  end

  # start_timeが無い状態でend_timeが存在してはならない
  def end_time_is_invalid_without_a_start_time
    errors.add(:start_time, "が必要です") if start_time.blank? && end_time.present?
  end

  # start_timeより早い時間のend_timeが存在してはならない
  # def end_time_is_invalid_earlier_than_a_start_time
  #   errors.add(:start_time, "が無効です") if start_time >= end_time
  # end

  enum status: {
    status_default: 0, #未設定
    on_request: 1, #申込中
    on_reserve: 2, #予約確定
    completed: 3, #施術完了
  }

  #reservations_controller.rbのcreateアクションで使用
  def apply!(menu_time)
    end_time = start_time + menu_time
    self.assign_attributes(
      end_time: end_time,
      status: :on_request,
      title_for_guest: "仮予約",
      title_for_staff: "仮予約"
    )
  end

  #reservations_controller.rbのupdate_reserveアクションで使用
  def apply_update!(menu_time)
    end_time = start_time + menu_time
    self.update(
      end_time: end_time
    )
  end

  #reservations_controller.rbのreservation_management_createアクションで使用
  def apply_management!(menu_time)
    end_time = start_time + menu_time
    title_for_staff_comment = "予約確定 #{self.guest.name}様　#{self.treatment_menu}"
    self.update(
      end_time: end_time,
      title_for_guest: "予約確定",
      title_for_staff: title_for_staff_comment
    )
  end

  scope :from_today, -> () {
    where('start_time >= ?', Time.zone.now)
  }

  # #指定された配列日付のデータを抽出
  # scope :in_selected_days, -> (days) {
  #   where(arel_table[:treatment_day].in(days))
  # }

  # #指定された日付のデータを抽出
  # scope :in_selected_day, -> (day) {
  #   where(arel_table[:treatment_day].eq(day))
  # }

end
