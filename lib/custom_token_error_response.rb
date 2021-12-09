# frozen_string_literal: true

module CustomTokenErrorResponse
  def body
    {
      title: 'Invalid Credentials',
      detail: 'Invalid password'
    }
  end

  def status
    :unauthorized
  end
end
