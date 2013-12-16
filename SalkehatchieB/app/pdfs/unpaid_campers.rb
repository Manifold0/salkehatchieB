class UnpaidCampersPdf < Prawn::Document

  def initialize(form)
    super(top_margin:50)
    @form = form
    body
  end

  def body
    text "Test text"
  end




end
