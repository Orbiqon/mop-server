# frozen_string_literal: true

module CustomTokenResponse
  def body
    user = User.find(@token.resource_owner_id)
    super.merge({
                  user: user,
                  subscription: user.subscriptions.any?
                })
  end
end
