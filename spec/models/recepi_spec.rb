# frozen_string_literal: true

require 'rails_helper'

  RSpec.describe Recepi, type: :model do
    describe '正常系の機能' do
      context '作成する' do
        it "正しく登録できること" do
          customer = Customer.create(name: "tanaka", email: "hoge@gmail.com", password: "hogehoge", password_confirmation: "hogehoge")
          params = {"recepi_title"=>"aaa","recepi_image_id"=>"111",
                    "recepi_ingredients_attributes"=>{"0"=>{"ingredient"=>"aaa", "_destroy"=>"false"}},
                    # "how_to_makes_attributes"=>{"0"=>{"recepi_make"=>"bbb","how_to_image"=>"{}", "_destroy"=>"false"}},
                    # "tags_attributes"=>{"1"=>{"recepi_id"=>"1", "genre_id"=>"1", "_destroy"=>"false"}}

          }
          recepi = Recepi.new(params)
          recepi.customer_id = customer.id
          expect{recepi.save}.to change{recepi.recepi_ingredients.count}.from(0).to(1)
          # expect{recepi.save}.to change{recepi.how_to_makes.count}.from(0).to(1)
          # and change{recepi.tags.count}.from(0).to(1)
        end
      end
    end
  end