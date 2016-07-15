module Text

  LINE_WIDTH = 79

  def put_text(text, victim=$crime.victim, location=$crime.location, suspects=$crime.suspects, killer=$crime.killer, weapon=$crime.weapon)

    # Substitute victim's details
    text.gsub! "[v_firstname]", victim["Firstname"]
    text.gsub! "[v_surname]", victim["Surname"]
    text.gsub! "[v_age]", victim["Age"].to_s
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
    puts "Valid selections: #{text.length}"

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

    The victim is [v_firstname] [v_surname], a [v_age] year old [v_occupation].

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
      "1. Hotel",
      "2. Bar",
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
    =====
    HOTEL
    =====

    The hotel is busy as always.

    [v_firstname] [v_surname] was known to visit here regularly. If they were
    here recently, one of the members of staff would know.
    """

    HOTEL_NOT_LOCATION_SCREEN = """
    =====
    HOTEL
    =====

    Preliminary questioning by police officers revealed that [v_firstname] [v_surname]
    was not here yesterday. You double check their guest list and talk
    to the staff to ensure that is indeed the case.

    It is safe to assume that the murder didn't happen here. Time to move on.
    """

    HOTEL_LOCATION_SCREEN = """
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

    WITNESS: Doorman
    ----------------

    The doorman states that he saw [v_title] [v_surname] return early this
    morning, at around 2 A.M. When asked about anything that might be suspicious,
    he mentioned a second person quickly walk into the hotel lobby while he was
    taking a cigarette break. He did not see either [v_title] [v_surname] or the
    other figure leave.
    """

    HOTEL_ROOM_SCREEN_POISON = """
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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
    =====
    HOTEL
    =====

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

end
