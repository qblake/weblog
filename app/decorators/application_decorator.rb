class ApplicationDecorator < Draper::Decorator
  delegate :to_s, to: :source

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
