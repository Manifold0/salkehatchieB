class CovenantPdf < Prawn::Document
  # To change this template use File | Settings | File Templates.
    def initialize(form)
      super(top_margin: 10)
      @form = form

      text "Name: #{@form.user.first_name}" + " #{@form.user.last_name}"
      #stroke_horizontal_rule
      header
      intro
      statements
      questions
      agreement
    end

    def header
      move_down(10)
      text "#{DateTime.now.year} Salkehatchie Summer Service Covenant Statement Required by All", style: :bold
      move_down(5)
    end

    def intro
      move_down(5)
      text "Salkehatchie Summer Service is committed to providing a safe and secure environment for all children, youth, vulnerable adults, and volunteers who participate in its ministries. The following policy statements reflect my committment to preserving Salkehatchie Summer Service as a holy place of safety and protection for all who would participate and as a place in which all people can experience the love of God through relationships with others.", size: 12
    end

    def statements
      move_down(5)
      text "No adults who have been convicted of child abuse (either sexual abuse, physical abuse, or emotional abuse)
should volunteer to work with Salkehatchie Summer Service" + " \n \n Volunteers shall observe the 'Two-Adult Rule' at all times so that no adult is ever alone with youth." +
  "\n \n Volunteers shall attend regular training and educational events provided by the camp directors(s) to keep
informed of policies and state lawes regarding child abuse"     +
     "\n \n Volunteers shall immediately report any behavior that seems abusive or inappropriate to the camp director.", size: 10, style: :bold_italic
    end

  def questions
    move_down(10)
    text "As a volunteer, do you agree to observe and abide by all policies regarding working in ministries with children and youth?" +" #{@form.policy}"
    text "As a volunteer, do you agree to observe the 'Two-Adult' rule at all times?" +" #{@form.two_adult}"
    text "As a volunteer, do you agree to participate in training and education events related to your volunteer assignment if required?" +" #{@form.training}"
    text "As a volunteer, do you agree to promptly report abusive or inappropriate behavior to the camp director?" +" #{@form.report_abuse}"
    text "As a volunteer, do you agree to inform the camp direcot if you have ever been convicted of child abuse?" +" #{@form.child_abuse}"
  end

  def agreement
    move_down(20)
    text "I have read this Participant Covenant, and I agree to observe and abide by the policies set forth above."
    text ""
  end

end