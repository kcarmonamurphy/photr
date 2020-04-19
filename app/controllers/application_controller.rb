class ApplicationController < JSONAPI::ResourceController
  protect_from_forgery with: :null_session

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :doorkeeper_authorize!

  ROOT_FOLDER = 'root_folder'

  # skipped by default because jsonapi-authorization takes care of these actions
  VERIFY_ACTIONS_TO_SKIP = [
    :index, :show, :create, :update,
    :get_related_resources, :get_related_resource
  ].freeze
  after_action :verify_authorized, except: VERIFY_ACTIONS_TO_SKIP
  after_action :verify_policy_scoped, except: VERIFY_ACTIONS_TO_SKIP

  protected

  def current_resource_owner
    current_user
  end

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    @current_user
  end

  private

  def context
    { user: current_user, params: params }
  end

  def user_not_authorized(exception)
    Rails.logger.info("user_not_authorized: #{exception}")
    head :forbidden
  end
end
