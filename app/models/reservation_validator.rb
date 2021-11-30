class ReservationValidator < ActiveModel::EachValidator
  # start_timeとend_timeのデータを元に同時刻に予約が重複しないようにバリデーションをかける
  # record：検証対象のモデルオブジェクト
  # attribute：検証対象のフィールド名
  # value：検証対象の値
  def validate_each(record, attribute, value)
    # 新規登録する期間
    new_start_time = record.start_time
    new_end_time  = record.end_time

    return unless new_start_time.present? && new_end_time.present?

    # 重複する期間を検索(編集時は自期間を除いて検索)
    if record.id.present?
      not_own_periods = Reservation.where('id NOT IN (?) AND start_time <= ? AND end_time >= ?', record.id, new_end_time, new_start_time)
    else
      not_own_periods = Reservation.where('start_time <= ? AND end_time >= ?', new_end_time, new_start_time)
    end
    

    record.errors.add(attribute, 'に重複があります') if not_own_periods.present?
  end
end
