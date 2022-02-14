class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username, :email

  has_many :products, Serializer: ProductSerializer
end
