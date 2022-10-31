class ArtistSetting < ApplicationRecord
  belongs_to :user
  belongs_to :store_currency
end
