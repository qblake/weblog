class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  state_machine :state, :initial => :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition [:unpublished] => :published
    end
    event :unpublish do
      transition [:published] => :unpublished
    end
  end

end
