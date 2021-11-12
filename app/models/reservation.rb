class Reservation < ApplicationRecord
  belongs_to :guest, class_name: 'User'
  validates :start_time, presence: true
  # validates :end_time, presence: true
  validates :course, presence: true
  validates :comment, length: { maximum: 200 }
  validate :day_after_today
  validate :in_working_time

  def day_after_today
    errors.add(:start_time, 'は、明日以降の日時を入力して下さい。') if start_time < Date.tomorrow
  end

  def in_working_time
    errors.add(:start_time, 'は、19時以前の日時を入力して下さい。') if start_time.hour > 19
    errors.add(:start_time, 'は、10時以降の日時を入力して下さい。') if start_time.hour < 10
  end

  enum course: {
    course_default: 0, #未設定
    course_foot_40: 1, #フットケア40分
    course_foot_60: 2, #フットケア60分
    course_massage_30: 3, #マッサージ30分
    course_massage_60: 4, #マッサージ60分
    course_massage_80: 5, #マッサージ80分
    course_acupoint_30: 6, #足つぼ30分
    course_acupoint_45: 7 #足つぼ45分
  }

  enum status: {
    status_default: 0, #未設定
    on_request: 1, #申込中
    on_reserve: 2, #予約確定
  }

  def apply!
    end_time = start_time + end_time_calculate
    self.assign_attributes(
      end_time: end_time,
      status: :on_request,
      title_for_guest: "仮予約",
      title_for_staff: "仮予約"
    )
  end

  def apply_reserve!
    end_time = start_time + end_time_calculate
    title_for_staff_comment = "予約確定 #{self.guest.name}様　#{self.course_i18n}"
    self.update(
      end_time: end_time,
      status: :on_reserve,
      title_for_guest: "予約確定",
      title_for_staff: title_for_staff_comment
    )
  end

  def end_time_calculate
    if self.course_default?
      60 * 60
    elsif self.course_foot_40?
      60 * 60
    elsif self.course_foot_60?
      60 * 80
    elsif self.course_massage_30?
      60 * 40
    elsif self.course_massage_60?
      60 * 80
    elsif self.course_massage_80?
      60 * 100
    elsif self.course_acupoint_30?
      60 * 40
    elsif self.course_acupoint_45?
      60 * 65
    else
      60 * 60
    end
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
