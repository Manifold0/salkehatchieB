class MedicalPdf < Prawn::Document

  def initialize(form)
    super(top_margin: 10)
    @form = form
    #stroke_horizontal_rule
    heading
    name
    random_text
    understanding
    conclusion
  end

  def heading
    text "PLEASE BE AWARE: SALKEHATCHIE SUMMER SERVICE INVOLVES EXPERIENCES WHICH HAVE" +
    " CERTAIN RISKS AND HAZARDS ASSOCIATED WITH IT. THESE RISKS INCLUDE BUT ARE NOT" +
	  " LIMITED TO, THE USE OF POWER AND HAND TOOLS, BUILDING REPAIR HAZARDS, NORMAL" +
	  " HOUSEHOLD HAZARDS, AND INFECTIOUS DISEASES."
    move_down(5)
    text "CONSENT FOR PARTICIPATION, RELEASE OF LIABILITY, AND INDEMNIFICATION AGREEMENT"
  end

  def name
    move_down(5)
    text "I/we hereby give approval for"  +
    #insert name here
    " #{@form.user.first_name}" + " #{@form.user.last_name} to attend and" +
	 " participate in Salkehatchie Summer Service during 2013. In consideration for me or my youth participant being allowed to attend and" +
    " participate in this activity, I/we, for myself/ourselves and on behalf of my/our child, KNOWINGLY AND FREELY ASSUME ALL" +
    " RISKS AND HAZARDS related to the Salkehatchie Summer Service activities including, but not limited to, transportation to and" +
    " from the Salkehatchie Summer Service camp and service sites, EVEN IF ARISING FROM THE NEGLIGENCE OF THOSE" +
    " ENTITIES AND PERSONS RELEASED FROM LIABILITY BELOW, and ASSUME FULL RESPONSIBILITY FOR" +
    " PARTICIPATION in Salkehatchie Summer Service; further, I/we, for myself/ourselves and on behalf of our child and my/our heirs," +
    " do HEREBY RELEASE, DISCHARGE, AND HOLD HARMLESS the South Carolina Conference of The United Methodist" +
    " Church and its trustees, officers, employees, and agents, as well as the organizers, sponsors, supervisors, counselors, chaperons, and" +
    " other support staff persons for the Salkehatchie Summer Service (collectively referred to hereinafter as the 'Releasees'), WITH " +
    " RESPECT TO ANY LOSS, INJURY, OR OTHER DAMAGE to me/us and my child arising out of or in any way related to" +
    " activities at Salkehatchie Summer. Service 'including, but not limited to, transportation to and from the '"+
    " Service camp and service sites, WHETHER CAUSED BY THE NEGLIGENCE OF THE RELEASEES OR OTHERWISE," +
    " except that which is the result of gross negligence and/or willful or wanton misconduct. I/we further agree to INDEMNIFY AND" +
    " HOLD HARMLESS the Releasees from any claims, losses, injuries, or other damages related to or arising from the above named" +
    " participant's attendance or participation in Salkehatchie Summer Service including, but not limited to, any claims submitted by or on" +
    " behalf of the participant. I/WE HAVE READ THIS RELEASE OF LIABILITY AND ASSUMPTION OF RISK AGREEMENT," +
    " FULLY UNDERSTAND ITS TERMS, UNDERSTAND THAT I/WE HAVE GIVEN UP SUBSTANTIAL RIGHTS BY" +
    " SIGNING IT, AND SIGN IT FREELY AND VOLUNTARILY WITHOUT ANY INDUCEMENT."
  end

  def random_text
    move_down(15)
    text "MEDICAL AUTHORIZATION" +
    " \n TO: THE ATTENDING PHYSICIAN AND/OR HOSPITAL" +
    " \n I/we hereby authorize reasonable and necessary medical care, including, but not limited to, any emergency surgical procedure or" +
    " hospitalization deemed necessary by a qualified and licensed physician for the welfare of the above named participant until such time" +
    " as you are able to reach me/us personally."
    move_down(15)
    text "CONSENT TO DISCLOSE MEDICAL INFORMATION" +
    " \n I/we further authorize the Releasees and their authorized representatives to disclose any health-related information of the above" +
    " named participant to any healthcare provider."
    move_down(15)
    text "PUBLICITY RELEASE" +
    " \n In consideration for the participant being allowed to attend and participate in this activity, I/we, for myself/ourselves and our child," +
    " hereby authorize the Releasees to record the participant's picture and voice on or in photographs, films, audiotapes, and/or videotapes" +
    " and to incorporate and use these recordings in any manner of media whatsoever, including unrestricted use of the recordings for" +
    " purposes of publicity and advertising, and hereby release, discharge, and hold harmless the Releasees from any and all claims and" +
    " liability for damages, losses, or expenses of any sort relating to the recordings."
    move_down(5)
  end

  def understanding
    text "I/WE HAVE CAREFULLY READ THIS DOCUMENT AND FULLY UNDERSTAND ITS CONTENTS."
    move_down(5)
    text "In witness whereof, I/we have executed this form on the date indicated below.
	  Date"
    #insert date
    text "Participant's Signature"
    #insert signature
    text "Date"
    #insert date
    text "Signature of Father/Guardian"
    #insert guardian
    text "Printed Name of Father/Guardian"
    #insert printed name
    text "Date"
    #insert date
    text "Signature of Mother/Guardian"
    #insert guardian
    text "Printed Name of Mother/Guardian"
    #insert printed name
  end

  def conclusion
    move_down(5)
    text "Completion of this form is necessary for participation in Salkehatchie Summer Service."
    move_down(5)
    text "THIS FORM MUST BE SIGNED BY THE PARENT(S) OR GUARDIAN(S) IF THE PARTICIPANT IS A MINOR."
  end

end
