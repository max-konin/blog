class Article
  include Mongoid::Document
  field :title, type: String
  field :text, type: String

  has_many :comments, dependent: :destroy

  validates :title, presence: true
end
