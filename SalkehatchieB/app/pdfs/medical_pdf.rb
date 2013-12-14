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
    text "<u><b>PLEASE BE AWARE:</u> SALKEHATCHIE SUMMER SERVICE INVOLVES EXPERIENCES WHICH HAVE CERTAIN RISKS AND" +
             "HAZARDS ASSOCIATED WITH IT. THESE RISKS INCLUDE BUT ARE NOT LIMITED TO, THE USE OF POWER AND HAND TOOLS," +
             " BUILDING REPAIR HAZARDS, NORMAL HOUSEHOLD HAZARDS, AND INFECTIOUS DISEASES.</b>", :inline_format => true, :align => :center
    move_down(15)
    text "<u>CONSENT FOR PARTICIPATION, RELEASE OF LIABILITY, AND INDEMNIFICATION AGREEMENT</u>", :inline_format => true, :align => :center
  end

  def name
    move_down(10)
    text "    I/we hereby give approval for"  +
             " #{@form.user.first_name}" + " #{@form.user.last_name} (Participant Signature) to attend and participate in" +
             "\n Salkehatchie Summer Service during 2013. In consideration for me or my youth participant being"+
             "\n allowed to attend and participate in this activity, I/we, for myself/ourselves and on behalf of my/our" +
             " child, KNOWINGLY AND FREELY <b>ASSUME ALL RISKS</b> AND <b>HAZARDS</b> related to the Salkehatchie" +
             " Summer Service activities including, but not limited to, transportation to and from the" +
             " Salkehatchie Summer Service camp and service sites, <b>EVEN</b> IF <b>ARISING FROM</b> THE" +
             " <b>NEGLIGENCE</b> OF <b>THOSE ENTITIES</b> AND <b>PERSONS RELEASED FROM</b> LIABILITY BELOW," +
             " and <b>ASSUME</b> FULL RESPONSIBILITY FOR PARTICIPATION in Salkehatchie Summer Service;" +
             " further, I/we, for myself/ourselves and on behalf of our child and my/our heirs do <b>HEREBY</b>" +
             "<b> RELEASE, DISCHARGE,</b> AND <b>HOLD HARMLESS</b> the South Carolina Conference of The" +
             " United Methodist Church and its trustees, officers, employees, and agents, as well as" +
             " the organizers, sponsors, supervisors, counselors, chaperons, and other support staff persons for " +
             "the Salkehatchie Summer Service (collectively referred to hereinafter as the 'Releasees'), WITH <b>RESPECT</b> TO ANY LOSS,"+
             " INJURY, OR <b>OTHER</b> DAMAGE to me/us and my child arising out of or in any way related to activities at Salkehatchie Summer." +
             " Service 'including, but not limited to, transportation to and from the Service camp and service sites, <b>WHETHER CAUSED BY THE" +
             " NEGLIGENCE OF THE RELEASEES OR OTHERWISE</b> except that which is the result of gross negligence and/or willful or wanton misconduct." +
             " I/we further agree to INDEMNIFY AND HOLD HARMLESS the Releasees from any claims, losses, injuries, or other damages related to or arising " +
             "from the above named participant's attendance or participation in Salkehatchie Summer Service including, but not limited to, any claims"+
             " submitted by or on behalf of the participant. I/WE HAVE READ THIS RELEASE OF LIABILITY AND ASSUMPTION OF RISK AGREEMENT,FULLY UNDERSTAND" +
             " ITS TERMS, UNDERSTAND THAT I/WE HAVE GIVEN UP SUBSTANTIAL RIGHTS BY SIGNING IT, AND SIGN IT FREELY AND VOLUNTARILY WITHOUT ANY INDUCEMENT.",  :inline_format => true
  end

  def random_text
    move_down(15)
    text "<b><u>MEDICAL AUTHORIZATION</b></u>", :inline_format => true, :align => :center
    text " \n TO: THE ATTENDING PHYSICIAN AND/OR HOSPITAL" +
             " \n I/we hereby authorize reasonable and necessary medical care, including, but not limited to, any emergency surgical procedure or" +
             " hospitalization deemed necessary by a qualified and licensed physician for the welfare of the above named participant until such time" +
             " as you are able to reach me/us personally."
    move_down(15)
    text "<b><u>CONSENT TO DISCLOSE MEDICAL INFORMATION</b></u>", :inline_format => true, :align => :center
    text " \n I/we further authorize the Releasees and their authorized representatives to disclose any health-related information of the above named participant to any healthcare provider."
    move_down(15)
    text "<b><u>PUBLICITY RELEASE</b></u>", :inline_format => true, :align => :center
    text " \n In consideration for the participant being allowed to attend and participate in this activity, I/we, for myself/ourselves and our child," +
             " hereby authorize the Releasees to record the participant's picture and voice on or in photographs, films, audiotapes, and/or videotapes" +
             " and to incorporate and use these recordings in any manner of media whatsoever, including unrestricted use of the recordings for" +
             " purposes of publicity and advertising, and hereby release, discharge, and hold harmless the Releasees from any and all claims and" +
             " liability for damages, losses, or expenses of any sort relating to the recordings."
    move_down(15)
  end

  def understanding
    text "<b>I/WE HAVE CAREFULLY READ THIS DOCUMENT AND FULLY UNDERSTAND ITS CONTENTS.</b>", :inline_format => true
    move_down(10)
    text "In witness whereof, I/we have executed this form on the date indicated below."
    move_down(5)
    text "Date" + " #{@form.user_approval_date}"



    text "Participant's Signature"
    fuckingtest = "#{Rails.root}/public/uploads/tmp/1386624377-10776-4594/McHammer-GreatestHits.JPG"
    image fuckingtest, :width => 150

    text "Date" + " #{@form.guardian_approval_date}"
    #text "Signature of Guardian" + " #{form.guardian_signature}"
    #text "Printed Name of Guardian" + " #{form.guardian_printed}"
  end

  def conclusion
    move_down(15)
    text "<b>Completion of this form is necessary for participation in Salkehatchie Summer Service.</b>", :inline_format => true, :align => :center
    move_down(15)
    text "<b>THIS FORM MUST BE SIGNED BY THE PARENT(S) OR GUARDIAN(S) IF THE PARTICIPANT IS A MINOR.</b>", :inline_format => true, :align => :center
  end

end
