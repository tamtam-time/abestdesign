class PostForm
  include ActiveModel::Model

  attr_accessor(
    :title, :file_name, :image,
    :id, :user_id,
    :tag_name
   )

   with_options presence: true do
    validates :title
    validates :file_name
    validates :image
  end

      def save
        ActiveRecord::Base.transaction do
          design = Design.create!(title: title, file_name: file_name, image: image, user_id: user_id)
          tag = Tag.where(tag_name: tag_name).first_or_initialize
          tag.save!
          PostTagRelation.create!(design_id: design.id, tag_id: tag.id)
        end
    
        return true
      rescue
        return false
      end

      def self.search(search)
        if search != ""
          Tag.where('tag_name LIKE(?)', "%#{search}%")
        else
          PostTagRelation.all
        end
      end





end
