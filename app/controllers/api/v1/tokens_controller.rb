# frozen_string_literal: true

module Api
  module V1
    class TokensController < Doorkeeper::TokensController
      before_action :check_if_account_is_registered, only: :create

      def revoke
        # The authorization server responds with HTTP status code 200 if the client
        # submitted an invalid token or the token has been revoked successfully.
        if token.blank?
          render json: {}, status: 200
        # The authorization server validates [...] and whether the token
        # was issued to the client making the revocation request. If this
        # validation fails, the request is refused and the client is informed
        # of the error by the authorization server as described below.
        elsif authorized?
          revoke_token
          render json: {}, status: 200
        else
          render json: revocation_error_response, status: :forbidden
        end
      end

      private

      def check_if_account_is_registered
        user = User.find_by(email: params['email'])
        render json: unregistered_account_error, status: 401 unless user
      end

      def unregistered_account_error
        { title: 'User not registered', detail: 'This user is not registered, please register' }
      end
    end
  end
end
