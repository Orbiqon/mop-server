# frozen_string_literal: true

json.set! :exhibition_styles do
  json.array!(@exhibition_styles, partial: 'api/v1/exhibition_styles/exhibition_style', as: :style)
end
