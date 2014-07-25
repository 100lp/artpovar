class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_locale

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? { locale: nil } : { locale: I18n.locale }
  end
end
