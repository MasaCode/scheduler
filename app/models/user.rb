class User < ApplicationRecord
  before_save { email.downcase! }

  has_secure_password

  has_many :remember_tokens

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                                    uniqueness: { case_sensitive: false }



end
