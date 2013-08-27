class PostEditType < Post
  include ApplicationType

  permit :title, :text, :state_event, :picture, :picture_cache
  validates :title, presence: true,
                    length: { minimum: 5 }
end
