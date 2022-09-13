# frozen_string_literal: true

module CustomTokenResponse
  def body
    user = User.find(@token.resource_owner_id)
    super.merge({
                  user: user,
                  first_name: user&.profile&.first_name&.present? ? user&.profile&.first_name : nil,
                  subscription: user&.subscriptions&.any?
                })
  end
end
