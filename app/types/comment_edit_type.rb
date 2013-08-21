class CommentEditType < Comment
  include ApplicationType

  permit :commenter, :body
end
