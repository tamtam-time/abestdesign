class Design < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations

  validates :title, presence: true
  validates :file_name, presence: true
  validates :image, presence: true

  def self.search(search)
    if search == "perfect_match"
      @design = Design.where("title LIKE?","#{keyword}")
    elsif search == "forward_match"
      @design = Design.where("title LIKE?","#{keyword}%")
    elsif search == "backward_match"
      @design = Design.where("title LIKE?","%#{keyword}")
    elsif search == "partial_match"
      @design = Design.where("title LIKE?","%#{keyword}%")
    else
      @design = Design.all
    end
  end




end
