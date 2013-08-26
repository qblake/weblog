class CommentEditType < Post::Comment
  include ApplicationType

  permit :commenter, :body
end
