module Api
  module V1
    class UsersController < ApplicationController
      skip_after_action :verify_policy_scoped, only: [
        :me
      ]

      def me
        authorize User
        serialize_user = JSONAPI::ResourceSerializer
          .new(Api::V1::UserResource)
          .serialize_to_hash(Api::V1::UserResource.new(current_user, context))
        render json: serialize_user
      end
    end
  end
end