class ReferencePdf < Prawn::Document

  def initialize(form)
    super(top_margin: 10)
    @form = form
    #stroke_horizontal_rule
  end





end
