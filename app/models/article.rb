class Article < ApplicationRecord
  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles
  belongs_to :user

  validates :title, :content, presence: true
end
