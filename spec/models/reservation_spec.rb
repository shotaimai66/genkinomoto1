require 'rails_helper'
RSpec.describe Reservation, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @reservation = @user.reservations.build
  end

  # factory_botが有効かどうかを検査。
  it "has a valid factory of reservation" do
    expect(@reservation).to be_valid
  end

  describe 'バリデーションのテスト' do
    context 'start_timeカラム' do
      it '空欄でないこと' do
        @reservation.start_time = nil
        is_expected.to be_invalid
      end
    end

    context 'end_timeカラム' do
      it '空欄でないこと' do
        @reservation.end_time = nil
        is_expected.to be_invalid
      end
    end

    context 'courseカラム' do
      it '空欄でないこと' do
        @reservation.course = nil
        is_expected.to be_invalid
      end
    end

    context 'guest_idカラム' do
      it '空欄でないこと' do
        @reservation.guest_id = nil
        is_expected.to be_invalid
      end
    end

    context 'commentカラム' do
      it '200文字以下であること' do
        @reservation.comment = "あ" * 201
        expect(@reservation).to be_invalid
      end
    end


    context 'in_working_timeカスタムバリデーションテスト' do
      it 'start_timeは10時以降の登録であること' do
        @reservation.start_time = Time.current.tomorrow.beginning_of_day
        expect(@reservation).to be_invalid
      end
      it 'start_timeは19時以前の登録であること' do
        @reservation.start_time = Time.current.tommorow.end_of_day
        expect(@reservation).to be_invalid
      end
      
    end
  end

end