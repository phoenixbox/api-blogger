class ArticleDecorator < Draper::Decorator
  delegate_all

  def to_json
    context[:role] == :admin ? model.to_json : model.to_json(only: :title)
  end
end
