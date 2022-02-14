class ProductSerializer
  include JSONAPI::Serializer
  attributes :user_id, :name, :price, :description

  belongs_to :user, Serializer: UserSerializer
end
