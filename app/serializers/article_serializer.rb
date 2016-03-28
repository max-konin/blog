class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text

  embed :ids

  has_many :comments
end
