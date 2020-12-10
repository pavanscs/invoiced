class UserSerializer < ActiveModel::Serializer
  attributes :id
  def self.error1(msg)
  	msg
  end
end
