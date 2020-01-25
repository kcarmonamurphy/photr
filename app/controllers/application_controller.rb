class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController

  ROOT_FOLDER = 'root_folder'
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
end
