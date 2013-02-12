module Api
  module V1
    class UsersController < BaseController
      doorkeeper_for :all
      respond_to :json

      def show
        @user = current_user
      end
    end
  end
end
