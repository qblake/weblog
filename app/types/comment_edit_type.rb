class CommentEditType < Post::Comment
  include ApplicationType

  permit :commenter, :body, :parent_id
end
