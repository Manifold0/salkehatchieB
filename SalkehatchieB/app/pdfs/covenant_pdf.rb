class CovenantPdf < Prawn::Document
  # To change this template use File | Settings | File Templates.
    def initialize(form)
      super(top_margin: 50)
      @form = form

      text "Name: \##{@form.user}"
      header
      intro
    end

    def header
      move_down(5)
      text "\##{@form.year} Salkehatchie Summer Service Covenant Statement Required by All", style: :bold
    end

    def intro
      move_down(5)
    text "Salkehatchie Summer Service is committed to providing a safe and secure environment for all children,
youth, vulnerable adults, and volunteers who participate in its ministries. The following policy statements reflect my
committment to preserving Salkehatchie Summer Service as a holy place of safety and protection for all who would
participate and as a place in which all people can experience the love of God through relationships with others."
    end

    def statements
      text "No adults who have been convicted of child abuse (either sexual abuse, physical abuse, or emotional abuse)
should volunteer to work with Salkehatchie Summer Service"
      move_down(10)
      text "Volunteers shall observe the 'Two-Adult Rule' at all times so that no adult is ever alone with youth."
      move_down(10)
      text "Volunteers shall attend regular training and educational events provided by the camp directors(s) to keep
informed of policies and state lawes regarding child abuse"
      move_down(10)
      text "Volunteers shall immediately report any behavior that seems abusive or inappropriate to the camp director."
    end

  def questions
    move_down(10)
    text "Please answer each of the following questions"
    move_down(5)
    #store response here
    text "As a volunteer, do you agree to observe and abide by all policies regarding working in ministires with children
and youth"
    move_down(5)
    text "As a volunteer, do you agree to observe the 'Two-Adult Rule' at all times?"
    move_down(5)
    text "As a volunteer, do you agree to participate in training and education events related to your volunteer
assignment if required?"
    move_down(5)
    text "As a volunteer, do you agree to promptly report abusive or inappropriate behavior to the camp director?"
    move_down(5)
    text "As a volunteer, do you agree to inform the camp director if you have ever been convicted of child abuse?"
  end

  def signature
     move_down(5)
     text "\##{@form.user_signature}"
  end

  def date
    move_down(5)
    text "\##{@form.signature_date}"
  end



end