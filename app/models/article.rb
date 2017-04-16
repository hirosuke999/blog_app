class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :tags
  accepts_nested_attributes_for :tags
end
