class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_company!
  protect_from_forgery with: :exception

  private
    # 現在のユーザーを取得する
    # @_current_userが空の場合は、session情報をキーにしてDBから検索する
  def current_company
    @_current_company ||= Company.find_by(id: session[:company_id])
  end
end
