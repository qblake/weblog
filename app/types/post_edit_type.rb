class PostEditType < Post
  include ApplicationType

  permit :title, :text, :state_event
  validates :title, presence: true,
                    length: { minimum: 5 }
end
