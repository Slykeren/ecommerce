class User < ApplicationRecord

    has_secure_password
    validates :email, presence: true, format: Devise.email_regexp
    validates :password, presence: true, length: { minimum: 6 }
    validates :password, confirmation: {case_sensitive: true}
    validates :province, presence: true


end
