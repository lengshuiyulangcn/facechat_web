class UserSerializer < ActiveModel::Serializer
  attributes :id, :image, :email, :nick_name
end
