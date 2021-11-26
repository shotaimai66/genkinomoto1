class ReservationValidator < ActiveModel::EachValidator
  # record：検証対象のモデルオブジェクト
  # attribute：検証対象のフィールド名
  # value：検証対象の値
  def validate_each(record, attribute, value)
    # 新規登録する期間
    new_start_time = record.start_time
    new_end_time  = record.end_time

    return unless new_start_time.present? && new_end_time.present?

    not_own_periods = Reservation.where('start_time <= ? AND end_time >= ?', new_end_time, new_start_time)

    record.errors.add(attribute, 'に重複があります') if not_own_periods.present?
  end
end