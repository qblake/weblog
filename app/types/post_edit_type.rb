class PostEditType < Post
  include ApplicationType

  validates :title, presence: true,
                    length: { minimum: 5 }
end
