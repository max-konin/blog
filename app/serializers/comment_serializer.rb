class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text

  embed :ids

  has_one :article
end
