require 'rails_helper'

RSpec.describe RecepiController, type: :controller do
  let(:recepi) {attributes_for(:recepi)}
  let(:recepi_ingredient) {attributes_for(:recepi_ingredient)}
  let(:how_to_make) {attributes_for(:how_to_make)}

  describe '正常系の機能' do
    context 'レシピの作成' do
      it '#new' do
        get :new
        expect(response).to have_http_status(200)
      end

      # it '#create' do
      #   food["materials_attributes"] = {"0" => material}
      #   menu["foods_attributes"] = {"0" => food}
      #   expect {
      #     post :create, menu: menu
      #   }.to change(Menu, :count).by(1).and change(Food, :count).by(1).and change(Material, :count).by(1)
      # end
    end
  end
end