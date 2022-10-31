# json.partial! 'api/v1/artist_settings/artist_setting', setting: @artist_setting

json.id @setting.id
json.subscription current_user&.subscriptions&.last&.package
json.payment_method @setting.payment_method
json.store_currency @setting.store_currency.name
json.self_fullfill_msg @setting.self_fullfill_msg
json.star_review @setting.star_review
json.feedback @setting.feedback
