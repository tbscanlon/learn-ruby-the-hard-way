module Text

  LINE_WIDTH = 79

  def put_text(text, victim=$crime.victim, location=$crime.location, suspects=$crime.suspects, killer=$crime.killer, weapon=$crime.weapon)

    # Substitute victim's details
    text.gsub! "[v_firstname]", victim["Firstname"]
    text.gsub! "[v_surname]", victim["Surname"]
    text.gsub! "[v_age]", victim["Age"].to_s
    text.gsub! "[v_title]", victim["Title"]
    text.gsub! "[v_occupation]", victim["Occupation"]
    text.gsub! "[v_reason]", victim["Reason"]

    # Substitute killer's details
    text.gsub! "[k_firstname]", killer["Firstname"]
    text.gsub! "[k_surname]", killer["Surname"]
    text.gsub! "[k_age]", killer["Age"].to_s
    text.gsub! "[k_motivation]", killer["Motivation"]
    text.gsub! "[k_weapons]", killer["Weapons"]

    # Substitute suspects' details
    text.gsub! "[s1_firstname]", suspects[0]["Firstname"]
    text.gsub! "[s1_surname]", suspects[0]["Surname"]
    text.gsub! "[s1_age]", suspects[0]["Age"].to_s
    text.gsub! "[s1_motivation]", suspects[0]["Motivation"]
    text.gsub! "[s1_weapons]", suspects[0]["Weapons"]

    text.gsub! "[s2_firstname]", suspects[1]["Firstname"]
    text.gsub! "[s2_surname]", suspects[1]["Surname"]
    text.gsub! "[s2_age]", suspects[1]["Age"].to_s
    text.gsub! "[s2_motivation]", suspects[1]["Motivation"]
    text.gsub! "[s2_weapons]", suspects[1]["Weapons"]

    text.gsub! "[s3_firstname]", suspects[2]["Firstname"]
    text.gsub! "[s3_surname]", suspects[2]["Surname"]
    text.gsub! "[s3_age]", suspects[2]["Age"].to_s
    text.gsub! "[s3_motivation]", suspects[2]["Motivation"]
    text.gsub! "[s3_weapons]", suspects[2]["Weapons"]

    text.gsub! "[s4_firstname]", suspects[3]["Firstname"]
    text.gsub! "[s4_surname]", suspects[3]["Surname"]
    text.gsub! "[s4_age]", suspects[3]["Age"].to_s
    text.gsub! "[s4_motivation]", suspects[3]["Motivation"]
    text.gsub! "[s4_weapons]", suspects[3]["Weapons"]

    system "clear" or system "cls"
    puts text
  end

  def put_menu(text=["Press enter to continue..."])
    puts text
    # puts "Valid selections: #{text.length}"

    if text.length == 1
      gets.chomp
      return nil
    end

    is_valid = false

    while !is_valid
      print "Enter your selection: "
      choice = Integer(gets.chomp) rescue -1 # convert to int if player enters something stupid

      if choice.between?(1, text.length)
        is_valid = true
        return choice
      else
        puts "Please enter a valid selection."
      end

    end
  end

  module StartGameText

    TITLE_SCREEN = """
    ===================
    MURDER MYSTERY GAME
    ===================

    Greetings, detective.

    A murder was committed last night on the streets of London. The victim is a
    high-profile individual and the public are calling for justice to be meted
    out swiftly and decisively.

    We must move fast. The public are already in a state of unrest from other
    recent events. If we do not resolve this quickly we face a state of emergency.
    Many more lives will be needlessly lost in the subsequent riots.

    The victim is [v_firstname] [v_surname], the [v_age] year old [v_occupation].

    We have prepared a shortlist of suspects for you. We believe that one of them
    is responsible.

    You will need to examine their body to determine how they were killed, then
    search some nearby locations and canvas witnesses to determine who killed them
    and where.

    There's a lot at stake and a lot of pressure on your shoulders, detective.
    However, we're confident you can bring the killer to justice.

    Good luck.
    """

    TITLE_SCREEN_MENU = [
      "1. Begin the investigation",
      "2. Exit"
    ]

  end

  module PoliceStationText

    POLICE_STATION_MAIN_SCREEN = """
    ==============
    POLICE STATION
    ==============

    VICTIM
    ------
    First Name: [v_firstname]
    Surname: [v_surname]
    Age: [v_age]
    Occupation: [v_occupation]
    Reason for Murder: [v_reason]
    -----

    [v_firstname] [v_surname] appears to have been murdered early this morning.
    Their body was fished out of the River Thames after we received an anonymous
    tip.

    We have taken the liberty of preparing a shortlist of suspects for you. All
    of our identified suspects have a valid motivation for performing the killing.

    We recommend that you peruse the suspects' dossiers, then immediately head
    to the riverside where the body is being held before it becomes contaminated.
    """

    POLICE_STATION_S1_SCREEN = """
    ==========
    SUSPECT #1
    ==========

    SUSPECT
    -------
    First Name: [s1_firstname]
    Surname: [s1_surname]
    Age: [s1_age]
    Suspected weapons: [s1_weapons]

    Motivation: [s1_motivation]
    -------
    """

    POLICE_STATION_S2_SCREEN = """
    ==========
    SUSPECT #2
    ==========

    SUSPECT
    -------
    First Name: [s2_firstname]
    Surname: [s2_surname]
    Age: [s2_age]
    Suspected weapons: [s2_weapons]

    Motivation: [s2_motivation]
    -------
    """

    POLICE_STATION_S3_SCREEN = """
    ==========
    SUSPECT #3
    ==========

    SUSPECT
    -------
    First Name: [s3_firstname]
    Surname: [s3_surname]
    Age: [s3_age]
    Suspected weapons: [s3_weapons]

    Motivation: [s3_motivation]
    -------
    """

    POLICE_STATION_S4_SCREEN = """
    ==========
    SUSPECT #4
    ==========

    SUSPECT
    -------
    First Name: [s4_firstname]
    Surname: [s4_surname]
    Age: [s4_age]
    Suspected weapons: [s4_weapons]

    Motivation: [s4_motivation]
    -------
    """
  end

  module RiverSideText

    RIVERSIDE_MAIN_SCREEN = """
    =========
    RIVERSIDE
    =========

    The body of [v_firstname] [v_surname] has been pulled out of the river by
    some officers, who stand guard nearby to keep the public away.

    The body has clearly been in the river for a few hours, and it is difficult
    to perform any sort of forensic analysis due to waterlogging. However, upon
    close inspection you do notice the following:

    """

    RIVERSIDE_POISON_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was poisoned.
    """

    RIVERSIDE_PISTOL_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was pistolled.
    """

    RIVERSIDE_SMG_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was SMG'ed.
    """

    RIVERSIDE_DAGGER_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was stabbed.
    """

    RIVERSIDE_AXE_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was aksed a quiestion.
    """

    RIVERSIDE_BAREHANDS_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was bear handsed.
    """

    RIVERSIDE_ROPE_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was strangled.
    """

    RIVERSIDE_ACID_SCREEN = """
    =========
    RIVERSIDE
    =========

    The victim was acided.
    """
  end

  module CityText
    CITY_MAIN_SCREEN = """
    ==============
    CITY OF LONDON
    ==============

    A map of the city will go here.

    Select a location below to investigate:
    """

    CITY_SCREEN_MENU = [
      "1. The Royal Horseguards Hotel",
      "2. St. Stephen's Tavern",
      "3. Back Alley",
      "4. Soho",
      "5. Offices",
      "6. Shop",
      "7. Examine the body again.",
      "8. Examine the case files again.",
      "9. Submit your report."
    ]
  end

  module HotelText
    HOTEL_MAIN_SCREEN = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    The hotel is busy as always.

    [v_firstname] [v_surname] was known to visit here regularly. If they were
    here recently, one of the members of staff would know.
    """

    HOTEL_NOT_LOCATION_SCREEN = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    Preliminary questioning by police officers revealed that [v_firstname] [v_surname]
    was not here yesterday. You double check their guest list and talk
    to the staff to ensure that is indeed the case.

    It is safe to assume that the murder didn't happen here. Time to move on.
    """

    HOTEL_LOCATION_SCREEN = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    Preliminary questioning by police officers releaved that [v_firstname] [v_surname]
    had checked in two days ago and was due to check out later today. A cursory
    glance at the guest list confirms this fact. After informing the staff about
    the murder, they give you the key to [v_title] [v_surname]\'s room and advise
    you to talk to the doorman - he was on duty early this morning and might have
    seen something.
    """

    HOTEL_LOCATION_SCREEN_MENU = [
      "1. Investigate the room.",
      "2. Talk to the doorman.",
      "3. Return to the City map."
    ]

    HOTEL_WITNESS_SCREEN = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    WITNESS: Doorman
    ----------------

    The doorman states that he saw [v_title] [v_surname] return early this
    morning, at around 2 A.M. When asked about anything that might be suspicious,
    he mentioned a second person quickly walk into the hotel lobby while he was
    taking a cigarette break. He did not see either [v_title] [v_surname] or the
    other figure leave.
    """

    HOTEL_ROOM_SCREEN_POISON = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    The room appears relatively untouched upon an initial inspection. There are
    no signs of any kind of struggle or altercation. Aside from the conscpicuous
    absence of the victim's body there would be no evidence to suggest anything
    happened in the room at all.

    You call in forensics officers to search the room. They find traces of blood
    and vomit in the bathroom and numerous marks on the bathroom door - presumably
    scratch marks of some kind. Somebody tried to clean up the room to hide the
    victim's death.

    From the evidence, it is clear the victim died slowly and painfully.
    """

    HOTEL_ROOM_SCREEN_PISTOL = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    There is evidence of an altercation in the room. The shards of a smashed lamp
    litter the floor, and there are remains of blood marks on the floor and walls
    that were hastily scrubbed off. It would appear the victim was executed in
    the room and their body taken away to be disposed of in the river.

    You call in forensics officers to search the room, who find the blood of the
    victim and traces of somebody else's blood. They also find two empty bullet
    casings under the bed. The killer tried to hide their tracks, but were in
    too much of a hurry.

    From the evidence, it is clear that the victim was executed at gunpoint after
    a brief struggle.
    """

    HOTEL_ROOM_SCREEN_SMG = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    There is evidence of a killing taking place in the room. Bullet holes litter
    the walls and there are multiple bullet casings littering the floor. Many
    bloodstains can be found on the walls, along with a trail of blood leading
    out of the room. The lock on the door leading into the room is damaged.

    You call in forensics officers, who determine that the killer kicked the door
    in and unloaded a full magazine from their gun at the victim.
    """

    HOTEL_ROOM_SCREEN_DAGGER = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    Interestingly, the lock on the room door is damaged and isn't functioning.

    The room itself is pungent with the stench of blood. The bedsheets are
    saturated with blood, and a long trail leads from there to the room door.
    One of the pillows on the bed appears to have been sliced open.

    You call in forensics officers, who determine that - consistent with the body -
    the victim's throat was sliced while they were sleeping.

    From the evidence, it is clear that the victim died from blood loss and their
    body was dragged elsewhere after they died.
    """

    HOTEL_ROOM_SCREEN_AXE = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    The hotel room looks like a scene from a massacre. Blood stains and weapon marks
    cover the walls. The marks on the wall seem to be from a bludgeoning or
    cutting implement.

    You call in forensics officers, who determine that the victim wasbrutally
    hacked to death in the room in a prolonged struggle, before the dead body
    was dragged away from the crime scene.
    """

    HOTEL_ROOM_SCREEN_BAREHANDS = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    The lock on the room's door is damaged and the room is in an upturned state.
    The mirrors are shattered, furniture is damaged and the walls are dented.

    There is evidence of a prolonged struggle, but no telltale signs of a weapon
    being used. You call in forensics officers to help determine what happened.

    They find traces of the victim's saliva in various locations throughout the
    room.

    From the evidence, it would seem that the victim was perhaps strangled and
    incapacitated in the room before their body was taken elsewhere.
    """

    HOTEL_ROOM_SCREEN_ROPE = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    The lock on the room's door is damaged and the room is in an upturned state.
    The mirrors are shattered, furniture is damaged and the walls are dented.

    There is evidence of a prolonged struggle, but no telltale signs of a weapon
    being used. You call in forensics officers to help determine what happened.

    They find traces of the victim's saliva in various locations throughout the
    room. Curiously, they also uncover a few loose strands of nylon.

    From the evidence, it would seem that the victim was perhaps strangled and
    incapacitated in the room before their body was taken elsewhere.
    """

    HOTEL_ROOM_SCREEN_ACID = """
    ===========================
    THE ROYAL HORSEGUARDS HOTEL
    ===========================

    [v_firstname] [v_surname]\'s Room
    ---------------------------------

    A chemical stench fills the air of the room as you enter. The doorlock is
    extensively damaged, as if it was melted.

    The room itself appears normal, but the bathroom is another story. There
    is extensive corrosive damage to the ceramic of the sink and toilet.

    You call in forensics officers, who find traces of the victim's blood left
    on the bathroom floor. They're able to determine that the bathroom was damaged
    by a chemical of some kind, but would need to take samples to determine exactly
    what was used.

    From the evidence, it is clear that the victim was attacked in the bathroom
    using the substance, and died painfully.
    """
  end

  module ForensicsText
    FORENSICS_HERMAN = """
    =================
    FORENSICS OFFICER
    =================

    After thorough investigation of the crime scene, the officers have found
    something that might be of interest to you.

    They found some dead skin cells that are not from the victim, and a lone
    strand of hair.

    This strand is rather long, and its composition suggests that it is body
    hair - likely beard, chest or pubic hair.

    This may help conslusively identify the suspect.
    """

    FORENSICS_STUART = """
    =================
    FORENSICS OFFICER
    =================

    After thorough investigation of the crime scene, the officers have found
    something that might be of interest to you.

    An empty spray paint can was found thrown on the ground nearby. On the wall
    by where the can was left was grafitti. The composition of the paint on the
    wall suggests that the grafitti tag was painted there at almost the exact
    same time as the murder.

    You have seen these tags before on prison walls. Your detective instincts tell
    you that whoever committed the murder wanted people to know it was a gang hit.

    This may help conclusively identify the suspect.
    """

    FORENSICS_WINTON = """
    =================
    FORENSICS OFFICER
    =================

    After thorough investigation of the crime scene, the officers have found
    something that might be of interest to you.

    There was a distinct lack of fingerprints at the crime scene, aside from one
    key area. Whoever the killer is, they slipped up by neglecting to remove all
    of their fingerprints.

    Only an experienced criminal would know to scrub a crime scene of forensic
    evidence, but in their haste they forgot to completely sanitise the scene.

    This mistake may help conclusively identify the suspect.
    """

    FORENSICS_GWYN = """
    =================
    FORENSICS OFFICER
    =================

    After thorough investigation of the crime scene, the officers have found
    something that might be of interest to you.

    They found a marking painted on a bin near the scene, but they are not sure
    what it is. Analysis of the paint's composition reveals that it had only
    been there for a few hours - probably placed just after the murder.

    Upon inspection, you note that the marking on the bin curiously resembles
    the flag of the Russian Federation.

    This may help conslusively identify the suspect.
    """

    FORENSICS_EMMALINE = """
    =================
    FORENSICS OFFICER
    =================

    After thorough investigation of the crime scene, the officers have found
    something that might be of interest to you.

    They found a few strands of long hair that do not belong to the victim.

    The composition of the hair suggests that it is from someone's head. Strangely,
    the colour of the strands seems to be an artifical pink.

    This may help conclusively identify the suspect.
    """

    FORENSICS_RANALD = """
    =================
    FORENSICS OFFICER
    =================

    After thorough investigation of the crime scene, the officers have not found
    anything that might be of interest to you.

    The scene and body have been scrubbed clean of any forensic evidence, and
    there is nothing to indicate which suspect could have committed the murder.

    The lack of evidence does not make it any easier to identify a suspect, but
    it is a noteworthy point in itself. Only an experienced and hardened murderer
    would know how to clean a crime scene of any trace that could lead law
    enforcement to them.
    """
  end

  module BarText

    BAR_MAIN_SCREEN = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    This bar is a regular dive of politicians and high society.

    [v_firstname] [v_surname] was a known patron of the tavern. If they were
    here recently, the barman would know of it.
    """

    BAR_NOT_LOCATION_SCREEN = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    A quick discussion with bar staff reveals that [v_firstname] [v_surname]
    was not here yesterday. You double check their transactions register and
    CCTV footage to confirm.

    It is safe to assume that the murder didn't happen here. Time to move on.
    """

    BAR_LOCATION_SCREEN = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Preliminary questioning with bar staff reveal that [v_firstname] [v_surname]
    had visited the bar and had stayed until closing time. After informing them
    of the murder, they offer to help in any way they can.

    They call in the barkeeper who was on duty last night, who is willing to talk
    with you.

    Police officers scout the local area for you, and uncover a crime scene in
    the shadow of the Winston Churchill statue in Parliament Square Garden.
    """

    BAR_LOCATION_SCREEN_MENU = [
      "1. Investigate the crime scene.",
      "2. Talk to the barkeeper.",
      "3. Return to the City map."
    ]

    BAR_WITNESS_SCREEN = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    WITNESS: Barkeeper
    ------------------

    The barkeeper confirms that [v_title] [v_surname] had spent most of the evening
    in the bar, only leaving about an hour after last orders were called. It was
    a quiet night yesterday evening; there were no more than ten customers at
    the busiest moments.

    [v_title] [v_surname] was the second last person to leave the bar. Shortly
    after, another hooded figure quickly followed. The barkeeper thought nothing
    of it and closed up for the night after that.
    """

    BAR_SCREEN_POISON = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    The area around the statue appears inconspicuous upon an initial inspection.
    There are no signs of any kind of struggle or altercation. Unusually, there
    are some traces of blood and vomit by the foot of the statue. This must be
    why the officers cordoned off a crime scene here.

    You call in forensics officers to examine the blood and vomit. They confirm
    that it is the victim's, and also note traces of bleach at the scene. The
    killer tried to wash away all evidence, but must have been in a hurry in
    such a public place and missed a few spots. They believe that the victim
    choked to death, and the body was dumped in the nearby river.

    From the evidence, it is clear the victim died slowly and painfully.
    """

    BAR_SCREEN_PISTOL = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    It is clear why the police officers cordoned off a crime scene here and called
    you over. There are numerous bloodstains on the grass - highly unusual in
    such a public location.

    When examing the scene, you find two bullet casings under a stone. The locations
    of the bloodstains confirm that the victim was shot twice - likely executed
    before the body was picked up and dumped in the river.

    Believing that there is more to be found here, you call in forensics officers
    to examine the scene further.
    """

    BAR_SCREEN_SMG = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    It is clear why the police officers cordoned off a crime scene here and called
    you over. In the shadow of the statue there are many bloodstains and markings
    from gunpowder. Bullet holes cover the base of the statue. Something definitely
    happened here.

    You call in forensics officers, who confirm that the blood is that of the
    victim's. It would seem that the victim was gunned down here after leaving
    St. Stephen's Tavern.

    Believing that there is more to be found here, you decide to speak with
    the forensics officers some more.
    """

    BAR_SCREEN_DAGGER = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    Something definitely happened here recently. The footprints on the grass
    suggest an altercation of some kind, and bloodstains at the base of the
    statue show that whatever happened ended badly.

    You call in forensics officers to help figure out what happened. One set
    of footprints match the shoes the victim was wearing, and the blood on the
    statue match the victim's. On both sides of the bloodstain are what seem
    to be incisions into the statue's case.

    The other set of footprints are unknown, but it is safe to assume that they
    belong to the killer.

    From the evidence, it would appear that the killer grabbed the victim, dragged
    them into relative privacy at the statue's base, and then sliced their throat.
    """

    BAR_SCREEN_AXE = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    Something definitely happened here recently. The footprints on the grass
    suggest an altercation of some kind, and the pool of blood at the base of
    the statue show that whatever happened ended badly.

    The many incisions at the base of the statue suggest that the killer followed
    the victim here, and then cornered and attacked them. Consistent with the
    victim's body, they were hacked at multiple times before succumbing to their
    wounds. The killer then took their body to the nearby river and threw it in.

    From the evidence, it is clear that the [v_title] [v_surname] was the victim
    of a brutal attack.
    """

    BAR_SCREEN_BAREHANDS = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    You're not sure why police officers cordoned off the area as a crime scene.
    There isn't initally anything to suggest that something happened here.

    However, a bright young officer points out sets of footprints in the grass,
    one of which matches the shoes that [v_title] [v_surname] was wearing. There's
    another set of footprints that follow, and also hand marks in the grass.

    There is no blood to be found, so you call in forensics officers to try and
    find anything that might help elucidate what happened here. They find many
    traces of the victim's saliva near the footprints and hand marks. They surmise
    that the victim was ambushed and strangled to death here.
    """

    BAR_SCREEN_ROPE = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    You're not sure why police officers cordoned off the area as a crime scene.
    There isn't initally anything to suggest that something happened here.

    However, a bright young officer points out sets of footprints in the grass,
    one of which matches the shoes that [v_title] [v_surname] was wearing. There's
    another set of footprints that follow, and also hand marks in the grass.

    There is no blood to be found, so you call in forensics officers to try and
    find anything that might help elucidate what happened here. They find many
    traces of the victim's saliva near the footprints and hand marks. Curiously,
    they also find a few strands of nylon near where the saliva traces were found.

    From the evidence, it would seem that the killer ambushed the victim here, and
    strangled them to death using something.
    """

    BAR_SCREEN_ACID = """
    ===================
    ST STEPHEN'S TAVERN
    ===================

    Crime Scene at Churchill's Statue
    ---------------------------------

    Police officers noticed unusual stains at the base of the tower and patches
    of missing grass nearby. Remembering the coroner's report on [v_title]
    [v_surname]\'s death, they decided to cordon off a crime scene and call you
    over.

    With the assistance of forensics officers, you determine that the stains are
    unnatural corrosion from a chemical and the missing grass patches are from
    the same chemical. It would seem that the victim was attacked here with
    something after leaving the bar, and their body was dragged away and thrown
    in the river while they were dying from their wounds.
    """

  end

  module BackalleyText

    BACKALLEY_MAIN_SCREEN = """
    ==========
    BACK ALLEY
    ==========

    A back alley near locations where [v_firstname] [v_surname] was known to
    frequent.

    Many homeless people come by this alley often to scavenge for food and to
    find somewhere safe to sleep for the night. If [v_title] [v_surname] had gone
    through here yesterday, one of them would know.
    """

    BACKALLEY_NOT_LOCATION_SCREEN = """
    ==========
    BACK ALLEY
    ==========

    You round up some of the vagrants and convince them to talk to you. None
    of them claim to have seen [v_firstname] [v_surname] come through here
    yesterday. Their stories all seem to match up.

    It is safe to assume that the murder didn't happen here. Time to move on.
    """

    BACKALLEY_LOCATION_SCREEN = """
    ==========
    BACK ALLEY
    ==========

    You round up some of the vagrants and convince them to talk to you. Some of
    them claim that they did see [v_firstname] [v_surname] come through here
    yesterday evening. They advise you to speak with another homeless person
    taking shelter at the far end of the alley - he received some money from
    [v_title] [v_surname] when they passed through and might be more willing
    to talk.
    """

    BACKALLEY_LOCATION_SCREEN_MENU = [
      "1. Investigate the nearby alleys.",
      "2. Talk to the homeless person.",
      "3. Return to the City map."
    ]

    BACKALLEY_WITNESS_SCREEN = """
    ==========
    BACK ALLEY
    ==========

    WITNESS: Homeless Person
    ------------------------

    The homeless person confirms that [v_title] [v_surname] had passed through
    this alley yesterday evening. He had received £5 from them when asking for
    any spare change. He thanked them, and watched as they continued walking down
    into another nearby alley, presumably on their way home.

    Just after [v_title] [v_surname] had walked out of sight, the homeless person
    saw another hooded figure follow them. Trying his luck, he asked that figure
    for any spare change as well, but was completely ignored. He kept his eye
    on that figure as they also quickly walked into the same alley the victim
    had just gone down.
    """

    BACKALLEY_SCREEN_POISON = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was poisoned here.
    """

    BACKALLEY_SCREEN_PISTOL = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was executed with a pistol here.
    """

    BACKALLEY_SCREEN_SMG = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was shot down with an SMG here.
    """

    BACKALLEY_SCREEN_DAGGER = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was stabbed to death here.
    """

    BACKALLEY_SCREEN_AXE = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was executed with a pistol here.
    """

    BACKALLEY_SCREEN_BAREHANDS = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was strangled to death here.
    """

    BACKALLEY_SCREEN_ROPE = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was strangled to death with a rope here.
    """

    BACKALLEY_SCREEN_ACID = """
    ==========
    BACK ALLEY
    ==========

    Nearby Alley
    ------------

    The victim was attacked with acid here.
    """

  end

  module SohoText

    SOHO_MAIN_SCREEN = """
    ====
    SOHO
    ====

    A secluded street in Soho with numerous brothels where [v_firstname] [v_surname]
    was rumoured to frequent.

    The working girls and madams here see many people pass by everyday. One of
    them is bound to know if [v_title] [v_surname] came by here yesterday.
    """

    SOHO_NOT_LOCATION_SCREEN = """
    ====
    SOHO
    ====

    One of the brothel owners speaks under duress after being threatened with
    closure and prosecution. Although what they're doing here is illegal, it's
    not a priority of yours right now.

    Neither they nor any of their girls had seen [v_firstname] [v_surname] here
    yesterday. Their most recent visit was just over a month ago.

    It's safe to assume the murder didn't happen here. Time to move on.
    """

    SOHO_LOCATION_SCREEN = """
    ====
    SOHO
    ====

    One of the brothel owners speaks under duress after being threatened with
    closure and prosecution. Although what they're doing here is illegal, it's
    not a priority of yours right now.

    They admit that [v_title] [v_surname] had visited late yesterday evening, and
    spent an hour with Ewa, one of her working girls. She does not want you to
    talk to her, but allows you to after receiving more threats of fines and
    imprisonment.
    """

    SOHO_LOCATION_SCREEN_MENU = [
      "1. Investigate the brothel.",
      "2. Talk to Ewa.",
      "3. Return to the City map."
    ]

    SOHO_WITNESS_SCREEN = """
    ====
    SOHO
    ====

    WITNESS: Ewa
    ------------

    Ewa confirms that she had spent an hour with [v_firstname] [v_surname] late
    yesterday evening, at around 2 A.M. When she welcomed [v_title] [v_surname]
    into the brothel she noticed a suspicious hooded figure watching from the
    other side of the road, but did not think much of it since it's normal to
    see suspicious characters in her line of work.

    Once her time with [v_title] [v_surname] was up, she escorted them out the
    back door into the garden to avoid any paparazzi or people that might recognise
    them. She then went to lock the front door, and spotted the same hooded figure
    - still watching the brothel's entrance. She was about to call out to them,
    but they had quickly walked off elsewhere.
    """

    SOHO_SCREEN_POISON = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was poisoned here.
    """

    SOHO_SCREEN_PISTOL = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was executed at gunpoint here.
    """

    SOHO_SCREEN_SMG = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was shot down with an SMG here.
    """

    SOHO_SCREEN_DAGGER = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was stabbed to death here.
    """

    SOHO_SCREEN_AXE = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was hacked to death with an axe here.
    """

    SOHO_SCREEN_BAREHANDS = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was strangled to death here.
    """

    SOHO_SCREEN_ROPE = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was strangled to death with a rope here.
    """

    SOHO_SCREEN_ACID = """
    ====
    SOHO
    ====

    Back Garden of the Brothel
    --------------------------

    The victim was attacked with acid here.
    """

  end

  module OfficesText

    OFFICES_MAIN_SCREEN = """
    =======
    OFFICES
    =======

    An office complex in Westminster where [v_firstname] [v_surname] was known
    to visit to do work from time to time.

    The concierge keeps track of the visitors each day. He would know for certain
    if [v_title] [v_surname] was here working yesterday.
    """

    OFFICES_NOT_LOCATION_SCREEN = """
    =======
    OFFICES
    =======

    You inform the concierge about the murder and ask to see the visitor register.
    He states that [v_firstname] [v_surname] had not come by here yesterday. The
    register confirms what he says.

    It's safe to assume the murder didn't happen here. Time to move on.
    """

    OFFICES_LOCATION_SCREEN = """
    =======
    OFFICES
    =======

    You inform the concierge about the murder and ask to see the visitor register.
    He states that [v_firstname] [v_surname] had came in yesterday evening to work
    in one of the rented private offices on the first floor. He is shocked by
    what happened, and offers to help in anyway possible.
    """

    OFFICES_LOCATION_SCREEN_MENU = [
      "1. Investigate the private office.",
      "2. Interrogate the concierge.",
      "3. Return to the City map."
    ]

    OFFICES_WITNESS_SCREEN = """
    =======
    OFFICES
    =======

    WITNESS: Concierge
    ------------------

    As requested, the concierge shows you the visitor register. Sure enough,
    [v_firstname] [v_surname]\'s name is there, along with a check-in time of
    8 P.M. Interestingly, there is no check-out time.

    The concierge thought that [v_title] [v_surname] was still in their private
    office and had been working through the night. It's quite a normal occurence
    here, so he had no reason to be suspicious.

    Nobody else had visited the office that night, aside from one delivery of
    supplies at the service entrance made at about midnight. The concierge shows
    you the delivery register, and you notice something particularly inbteresting.

    The delivery of supplies was made by one \"John Doe\". It would seem that
    the killer had snuck into the building posing as a courier.
    """

    OFFICES_SCREEN_POISON = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was poisoned here.
    """

    OFFICES_SCREEN_PISTOL = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was executed at gunpoint here.
    """

    OFFICES_SCREEN_SMG = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was shot down with an SMG here.
    """

    OFFICES_SCREEN_DAGGER = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was stabbed to death here.
    """

    OFFICES_SCREEN_AXE = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was hacked to death with an axe here.
    """

    OFFICES_SCREEN_BAREHANDS = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was strangled to death here.
    """

    OFFICES_SCREEN_ROPE = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was strangled to death with a rope here.
    """

    OFFICES_SCREEN_ACID = """
    =======
    OFFICES
    =======

    [v_firstname] [v_surname]\'s Private Office
    -------------------------------------------

    The victim was attacked with acid here.
    """

  end

  module ShopText

    SHOP_MAIN_SCREEN = """
    ====
    SHOP
    ====

    A quiet Off-licence in Westminster frequented by politicians and high-society
    for its excellent selection of liquour. [v_firstname] [v_surname] was a regular
    customer here.

    The shopkeeper is a friendly gentleman and is usually willing to help law
    enforcement. He will be willing to share anything he knows about [v_title]
    [v_surname].
    """

    SHOP_NOT_LOCATION_SCREEN = """
    ====
    SHOP
    ====

    You inform the shopkeeper about the murder and ask if he knows anything about
    [v_title] [v_surname]\'s whereabouts yesterday.

    He replies that the last time [v_title] [v_surname] had purchased something
    at his shop was four days ago. You check the register and CCTV to confirm
    that what he is saying is true.

    It's safe to assume the murder didn't happen here. Time to move on.
    """

    SHOP_LOCATION_SCREEN = """
    ====
    SHOP
    ====

    You inform the shopkeeper about the murder and ask if he knows anything about
    [v_title] [v_surname]\'s whereabouts yesterday.

    He replies that [v_title] [v_surname] had purchased something at his shop
    late yesterday evening, about fifteen minutes before he closed up for the night.
    You check the register and CCTV to confirm that what he is saying is true.

    He is shocked by what he has just heard; [v_title] [v_surname] was a regular
    customer of his and they were on good terms. He is willing to go on record
    as a witness to help catch the killer.
    """

    SHOP_LOCATION_SCREEN_MENU = [
      "1. Investigate the area around the shop.",
      "2. Interrogate the shopkeeper.",
      "3. Return to the City map."
    ]

    SHOP_WITNESS_SCREEN = """
    ====
    SHOP
    ====

    WITNESS: Shopkeeper
    -------------------

    You ask to review the CCTV footage from yesterday evening with the shopkeeper's
    insights. He shows you the moment that [v_firstname] [v_surname] entered and
    left. He pauses at a moment about fourty seconds after [v_title] [v_surname]
    had entered the shop, and points out another hooded figure entering the shop
    and promptly walking down to the back, near where the chilled liquours are
    kept in a fridge.

    He found this suspicious, and went to confront the figure just after [v_title]
    [v_surname] had left. He recalls asking the figure if they needed any help
    finding anything, to which they responded by shaking their head dismissively
    before quickly leaving the shop.

    He noted that the figure had turned right after exiting, walking off in the
    same direction as [v_title] [v_surname]. He suspects that it was the killer
    in his shop, who was stalking the victim while waiting for a chance to
    strike.
    """

    SHOP_SCREEN_POISON = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was poisoned here.
    """

    SHOP_SCREEN_PISTOL = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was executed at gunpoint here.
    """

    SHOP_SCREEN_SMG = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was shot down with an SMG here.
    """

    SHOP_SCREEN_DAGGER = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was stabbed to death here.
    """

    SHOP_SCREEN_AXE = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was hacked to death with an axe here.
    """

    SHOP_SCREEN_BAREHANDS = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was strangled to death here.
    """

    SHOP_SCREEN_ROPE = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was strangled to death with a rope here.
    """

    SHOP_SCREEN_ACID = """
    ====
    SHOP
    ====

    Alley near the Shop
    -------------------

    The victim was attacked with acid here.
    """

  end

  module ReportText
    REPORT_MAIN_SCREEN = """
    ==============
    POLICE STATION
    ==============

    Are you ready to submit your report, detective?

    The following need to be identified for a successful indictment:

    - Who the killer was
    - Where the murder took place
    - How the victim died

    Your career and the integrity of the police force rest on this. Do try to
    get it correct for all of our sakes.
    """

    REPORT_MAIN_SCREEN_MENU = [
      "1. Identify the killer",
      "2. Identify where the murder took place",
      "3. Identify the murder weapon",
      "4. Finalise and submit your report",
      "5. Return to the city to continue your investigation"
    ]

    REPORT_KILLER_SCREEN = """
    ==============
    POLICE STATION
    ==============

    Identify the Killer
    -------------------

    Which of the suspects committed the murder?

    SUSPECT 1: [s1_firstname] [s1_surname]
    SUSPECT 2: [s2_firstname] [s2_surname]
    SUSPECT 3: [s3_firstname] [s3_surname]
    SUSPECT 4: [s4_firstname] [s4_surname]

    """

    REPORT_KILLER_SCREEN_MENU = [
      "1. Suspect 1",
      "2. Suspect 2",
      "3. Suspect 3",
      "4. Suspect 4"
    ]

    REPORT_LOCATION_SCREEN = """
    ==============
    POLICE STATION
    ==============

    Identify the Location of the Murder
    -----------------------------------

    Where did the murder take place?
    """

    REPORT_LOCATION_SCREEN_MENU = [
      "1. In a room at The Royal Horseguards Hotel",
      "2. Under the Churchill Statue, near St. Steven\'s Tavern",
      "3. In a back alley",
      "4. In the back garden of a Brothel in Soho",
      "5. In a rented office",
      "6. Behind the shop"
    ]

    REPORT_WEAPON_SCREEN = """
    ==============
    POLICE STATION
    ==============

    Identify the Murder Weapon
    --------------------------

    How was the victim killed?
    """

    REPORT_WEAPON_SCREEN_MENU = [
      "1. The victim was poisoned",
      "2. The victim was shot with a pistol",
      "3. The victim was shot with an SMG",
      "4. The victim's throat was sliced with a dagger",
      "5. The victim was attacked with an axe",
      "6. The killer used their bare hands",
      "7. The victim was strangled with a rope",
      "8. The victim diedfrom their wounds after being attacked by acid"
    ]

    REPORT_FINALISE_SCREEN = """
    ==============
    POLICE STATION
    ==============

    Finalise your Report
    --------------------

    Ensure the details below are correct before submitting your report.
    """

    REPORT_FINALISE_SCREEN_MENU = [
      "1. These details are correct - SUBMIT REPORT",
      "2. These details aren't correct - CHANGE REPORT"
    ]

  end

  module EndGameText

    ENDGAME_MAIN_SCREEN = """
    ======
    RESULT
    ======

    The results of your investigation:

    """

    ENDGAME_0_SCREEN = """
    ======
    RESULT
    ======

    You were unable to conslusively determine any facts surrounding the murder.

    The suspect was brought to trial, but walked free due to a lack of evidence.

    The murder of [v_firstname] [v_surname] and the botched trial has been
    extensively reported in the media. The public calls for your resignation.
    We have no choice but to oblige.

    The details of the murder have also been leaked to the press. There have
    since been a number of copycat killings by others.

    Whoever the killer was, they remain at large.
    """

    ENDGAME_1_SCREEN = """
    ======
    RESULT
    ======

    You were unable to conslusively determine all of the facts surrounding the
    murder.

    The suspect was brought to trial, but we were unable to convict them of first
    degree murder due to a lack of evidence. They were convicted of assault, and
    have been sentenced to nine months in prison.

    The murder of [v_firstname] [v_surname] and the botched trial has been
    extensively reported in the media. The public calls for your resignation.
    We will not fire one of our own detectives - but to sate the public's thirst
    for justice we have no choice but to demote you.

    Starting on Monday, you will be working on the arson desk.

    We have called a state of emergency to try and find the real killer and bring
    them to justice. The emergency powers we have enacted have angered the already
    restless public. We anticipate riots, and more loss of life.

    Whoever the killer was, they remain at large.
    """

    ENDGAME_2_SCREEN = """
    ======
    RESULT
    ======

    You were unable to conslusively determine all of the facts surrounding the
    murder.

    We have no choice but to convict the suspect you indicted. Some evidence was
    fabricated to ensure a conviction. Critics are saying that this trial took
    place in a kangaroo court, but we have done what is necessary to keep the
    public happy.

    Conspiracy theories surrounding the murder have already arisen. Careers have
    been destroyed by the ruthless accusations thrown about by paranoid theorists.
    We expect more lives to be ruined in the coming years.

    There have been no other murders of high profile induviduals since. Whether
    or not we caught the killer is irrelevant. What is important is that the
    public are now safe.

    Good work, detective.
    """

    ENDGAME_3_SCREEN = """
    ======
    RESULT
    ======

    You were able to conclusively determine all the facts surrounding the murder.

    The suspect was brought to trial, and found guilty.

    The murder of [v_firstname] [v_surname] and the trial have been
    extensively reported in the media. The public calls for your promotion for
    your excellent work. We are happy to oblige.

    The killer is no longer at large, and the public is safe once more.

    Good work, detective.
    """
  end

end
