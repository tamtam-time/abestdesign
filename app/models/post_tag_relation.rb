class PostTagRelation < ApplicationRecord
  belongs_to :design
  belongs_to :tag
end
