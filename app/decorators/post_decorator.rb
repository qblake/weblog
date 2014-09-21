class PostDecorator < ApplicationDecorator
  delegate_all

  def comments_count
    if comments.any?
      h.pluralize(comments.count, h.t('.comment'))
    else
      h.t('.no_comments')
    end
  end
end
