class Product < ApplicationRecord
    belongs_to :user, required: false

    validates_uniqueness_of :name
    validates_presence_of :name, :price, :description
end
