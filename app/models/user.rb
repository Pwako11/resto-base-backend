class User < ApplicationRecord
    has_secure_password

    has_many :products, dependent: :destroy, foreign_key: :user_id
    validates_uniqueness_of :email, :username
    validates_presence_of :name, :username, :email, :password_digest
end
