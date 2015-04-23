class BasePresenter < SimpleDelegator
  def initialize(model, view)
    @model, @view = model, view
    super(@model)
  end

  private
  def h
    @view
  end

  def method_missing(*args, &blk)
    @view.send(args, blk)
  end
end
