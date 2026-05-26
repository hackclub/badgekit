class User < ApplicationRecord
  validates :slack_id, presence: true, uniqueness: true
  validates :redirect_url, format: { with: /\Ahttps:\/\/[^\n]+\z/i, message: "must start with https://" }, allow_blank: true
end
