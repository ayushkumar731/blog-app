class ApplicationPresenter
  def initialize(model, view)
    @model, @view = model, view
    super(@model)
  end


  def h
    @template
  end
end