# frozen_string_literal: true

require 'rails_helper'

  RSpec.describe Recepi, type: :model do
    describe '正常系の機能' do
      context '作成する' do
        it '正しく登録できること  レシピ名：きのこの山' do
          enquete = FactoryBot.build(:recepi_kinoko)
          expect(enquete).to be_valid
          enquete.save
          answered_enquete = Recepi.find(1)

          expect(answered_enquete.customer_id).to eq(1)
          expect(answered_enquete.recepi_title).to eq('きのこの山')
          expect(answered_enquete.recepi_image_id).to eq(1111111)
          expect(answered_enquete.impressions_count).to eq(0)
        end
      end
    end
  end