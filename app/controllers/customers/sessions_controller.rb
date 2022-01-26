class Customers::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、終了する
    return if !@customer
    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      redirect_to root_path
    end
  end
end
