class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :home_location_code

  has_many :posts
end
