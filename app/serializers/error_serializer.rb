class ErrorSerializer < ActiveModel::Serializer
  attributes :status, :code, :message

  def self.error1(value)
  	value
  end
end
