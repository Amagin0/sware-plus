# frozen_string_literal: true

require 'rails_helper'

  RSpec.describe Recepi, type: :model do
    describe '正常系の機能' do
      context '作成する' do
        it "正しく登録できること" do
          customer = Customer.create(name: "tanaka", email: "hoge@gma.cc", password: "hogehoge", password_confirmation: "hogehoge")
          params = {"recepi_title"=>"aaa",recepi_image_id: "111",  "recepi_ingredients_attributes"=>{"0"=>{"ingredient"=>"aaa", "_destroy"=>"false"}}}
          recepi = Recepi.new(params)
          recepi.customer_id = customer.id
          expect{recepi.save}.to change{recepi.recepi_ingredients.count}.from(0).to(1)
        end
      end
    end
  end