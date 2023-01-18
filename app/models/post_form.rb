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


  ActiveRecord::Base.transaction do

    def save
      design = Design.create!(title: title, text: text, image: image, user_id: user_id)
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save!
      PostTagRelation.create!(design_id: design.id, tag_id: tag.id)
    end

    return true

    rescue false
  end
end
