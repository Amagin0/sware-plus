class Customers::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  before_action :move_to_signed_in

  # ログイン失敗時の遷移先
  def failed
    redirect_to new_customer_registration_path
  end

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

  # ログイン失敗時にsession_pathに遷移してしまうのを修正
  # デフォルトの設定からauth_optionsをオーバーライドする
  def auth_options
    { scope: resource_name, recall: "#{controller_path}#failed" }
  end

  # サインインしていないユーザーは新規登録画面へ遷移
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_registration_path
    end
  end

end
