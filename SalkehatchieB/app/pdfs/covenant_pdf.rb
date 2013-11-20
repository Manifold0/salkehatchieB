class CovenantPdf < Prawn::Document
  # To change this template use File | Settings | File Templates.
    def initialize(form)
      super(top_margin: 50)
      @form = form

      text "Name: \##{@form.user}"
    end
end