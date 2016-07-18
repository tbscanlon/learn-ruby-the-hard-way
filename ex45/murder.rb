module Commit_Murder

  List_of_victims = [
    {
      "Firstname" => "Grayson",
      "Surname" => "Irving",
      "Age" => 54,
      "Gender" => "Male",
      "Title" => "Mr.",
      "Occupation" => "Mayor of London",
      "Reason" => "Mr. Irving has been the subject of media investigation into
      allegations of corruption."
    },
    {
      "Firstname" => "Innes",
      "Surname" => "McCracken",
      "Age" => 46,
      "Gender" => "Female",
      "Title" => "Mrs.",
      "Occupation" => "Shadow Foreign Secretary",
      "Reason" => "Ms. McCracken is a known campaigner for laxer immigration controls."
    },
    {
      "Firstname" => "Rudolph",
      "Surname" => "Buchanan",
      "Age" => 49,
      "Gender" => "Male",
      "Title" => "Mr.",
      "Occupation" => "Managing Director for an international retail chain",
      "Reason" => "Mr. Buchanan's company makes extensive use of a child labour
      force. He has been accused of being fully aware of this and turning a
      blind eye to the problem."
    },
    {
      "Firstname" => "Ramona",
      "Surname" => "Blackbourne",
      "Age" => 32,
      "Gender" => "Female",
      "Title" => "Miss",
      "Occupation" => "Journalist",
      "Reason" => "Ms. Blackbourne liaises with and supports numerous high-profile
      whistleblowers that work to uncover governmental corruption."
    },
    {
      "Firstname" => "Russell",
      "Surname" => "Matthews",
      "Age" => 27,
      "Gender" => "Male",
      "Occupation" => "Athlete",
      "Title" => "Mr.",
      "Reason" => "After winning 2 gold medals in the previous Olympic Games,
      Mr. Matthews used his status as a household name to campaign for human
      rights, drawing the ire of various regimes throughout the world."
    },
    {
      "Firstname" => "Lillian",
      "Surname" => "Bush",
      "Age" => 22,
      "Gender" => "Female",
      "Title" => "Miss",
      "Occupation" => "Socialite",
      "Reason" => "Ms. Bush is a regular fixture in the tabloid newspapers after
       winning a modelling reality TV contest. Stories are published regularly
       about her infidelities, her excessive spending of her family's fortune and
       her racist remarks."
    },
    {
      "Firstname" => "Keenan",
      "Surname" => "Moloney",
      "Age" => 38,
      "Gender" => "Male",
      "Title" => "Mr.",
      "Occupation" => "Police Officer",
      "Reason" => "Mr. Moloney shot and killed an armed aggressor during the most
      recent riots. While certain elements believed it to be nothing short of a
      gangland execution, he was found innocent of any wrongdoing. He has since
      been the target of frequent abuse from the Capital's disenfranchised youth."
    },
    {
      "Firstname" => "Theo",
      "Surname" => "Adamson",
      "Age" => 41,
      "Gender" => "Male",
      "Title" => "Mr.",
      "Occupation" => "Senior Advisor",
      "Reason" => "Mr. Adamson is the first openly transgender advisor to serve
      the Prime Minister and work in senior government office. This has drawn ire
      from fundamentalist and religious groups in the past, but it was believed
      this had died down prior to his murder this morning."
    }
  ]

  List_of_suspects = [
    {
      "Firstname" => "Herman",
      "Surname" => "Ellery",
      "Age" => 24,
      "Gender" => "Male",
      "Motivation" => "Convert to Islamic Extremism",
      "Weapons" => "Pistol, Dagger, Axe, Acid"
    },
    {
      "Firstname" => "Stuart",
      "Surname" => "York",
      "Age" => 30,
      "Gender" => "Male",
      "Motivation" => "Member of a prison gang",
      "Suspected" => "Grayson",
      "Weapons" => "Pistol, SMG, Dagger, Rope"
    },
    {
      "Firstname" => "Winton",
      "Surname" => "Snider",
      "Age" => 42,
      "Gender" => "Male",
      "Motivation" => "Career criminal",
      "Weapons" => "Poison, Dagger, Bare hands, Acid"
    },
    {
      "Firstname" => "Gwyn",
      "Surname" => "Mallory",
      "Age" => 37,
      "Gender" => "Male",
      "Motivation" => "Foreign spy",
      "Weapons" => "Poison, Bare hands, Rope, Acid"
    },
    {
      "Firstname" => "Emmaline",
      "Surname" => "Pitts",
      "Age" => 26,
      "Gender" => "Female",
      "Motivation" => "Violent anarchist",
      "Weapons" => "Pistol, SMG, Axe, Bare hands"
    },
    {
      "Firstname" => "Ranald",
      "Surname" => "Pottinger",
      "Age" => 35,
      "Gender" => "Male",
      "Motivation" => "Professional hitman",
      "Weapons" => "Poison, Pistol, SMG, Dagger, Axe, Bare hands, Rope, Acid"
    }
  ]

  List_of_locations = [
    "Hotel",
    "Bar",
    "Back alley",
    "Soho",
    "Offices",
    "Shop"
  ]

  List_of_weapons = [
    "Poison",
    "Pistol",
    "SMG",
    "Dagger",
    "Axe",
    "Bare hands",
    "Rope",
    "Acid"
  ]

  def choose_victim(victims=List_of_victims)
    victim = victims.sample
  end

  def choose_location(locations=List_of_locations)
    location = locations.sample
  end

  def choose_suspects(victim, suspects=List_of_suspects)
    potential_killers =
    case victim["Firstname"]
    when "Grayson"
      suspects.values_at(0, 2, 4, 5)
    when "Innes"
      suspects.values_at(0, 1, 3, 5)
    when "Rudolph"
      suspects.values_at(2, 3, 4, 5)
    when "Ramona"
      suspects.values_at(1, 2, 3, 5)
    when "Russell"
      suspects.values_at(0, 2, 3, 5)
    when "Lillian"
      suspects.values_at(0, 3, 4, 5)
    when "Keenan"
      suspects.values_at(1, 2, 4, 5)
    when "Theo"
      suspects.values_at(1, 3, 4, 5)
    else suspects.values_at(-1)
    end
  end

  def choose_killer(suspects)
    killer = suspects.sample
  end

  def choose_weapon(killer, weapons=List_of_weapons)
  # Choose what weapon was used based on who the killer was
    potential_weapons =
    case killer["Firstname"]
    when "Herman"
      weapons.values_at(1, 3, 4, 7)
    when "Stuart"
      weapons.values_at(1, 2, 3, 6)
    when "Winton"
      weapons.values_at(0, 3, 5, 7)
    when "Gwyn"
      weapons.values_at(0, 5, 6, 7)
    when "Emmaline"
      weapons.values_at(1, 2, 4, 5)
    when "Ranald"
      weapons.values_at(1, 2, 3, 4, 5, 6, 7)
    end
    murder_weapon = potential_weapons.sample
  end

end
