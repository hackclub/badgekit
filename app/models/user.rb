class User < ApplicationRecord
  validates :slack_id, presence: true, uniqueness: true
  validates :redirect_url, format: { with: /\Ahttps:\/\//i, message: "must start with https://" }, allow_blank: true
end
