# frozen_string_literal: true

json.id profile.id
json.email profile.user.email
json.first_name profile&.first_name
json.surname profile&.surname
json.company_name profile&.company_name
json.phone_number profile&.phone_number
json.bio profile&.bio
json.social_account profile&.social_account
json.picture url(profile&.picture)
json.styles profile.styles
