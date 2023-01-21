class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :designs, through: :post_tag_relations
  validates :tag_name,  uniqueness: true
end
