require "./murder.rb"
require "./text.rb"

$killer_identified = false
$location_identified = false
$weapon_identified = false

class Murder
  include Commit_Murder
  attr_accessor :victim, :location, :suspects, :killer, :weapon, :locations, :weapons

  def initialize
    @victim = choose_victim
    @location = choose_location
    @suspects = choose_suspects(@victim)
    @killer = choose_killer(@suspects)
    @weapon = choose_weapon(@killer)

    @locations = List_of_locations
    @weapons = List_of_weapons
  end

  def display_crime
      puts "#{@victim["Firstname"]} #{@victim["Surname"]} was murdered by #{@killer["Firstname"]} #{@killer["Surname"]} at #{@location} using a #{@weapon}."
  end
end

class Scene
  include Text

  def enter
    puts "This scene is not yet configured. Subclass it and implement enter."
    exit(1)
  end
end

class StartGame < Scene
  include StartGameText

  def enter
    put_text(TITLE_SCREEN)
    action = put_menu(TITLE_SCREEN_MENU)

    case action
    when 1 then "PoliceStation"
    when 2 then exit
    end

  end

end

class PoliceStation < Scene
  include PoliceStationText

  def enter
    put_text(POLICE_STATION_MAIN_SCREEN)
    put_menu

    put_text(POLICE_STATION_S1_SCREEN)
    put_menu

    put_text(POLICE_STATION_S2_SCREEN)
    put_menu

    put_text(POLICE_STATION_S3_SCREEN)
    put_menu

    put_text(POLICE_STATION_S4_SCREEN)
    put_menu(["Press enter to head to the riverside..."])

    "RiverSide"
  end
end

class RiverSide < Scene
  include RiverSideText

  def enter
    put_text(RIVERSIDE_MAIN_SCREEN)
    put_menu
    self.examine_body
    "City"
  end

  def examine_body
    case $crime.weapon
    when "Poison"
      put_text(RIVERSIDE_POISON_SCREEN)
      put_menu
    when "Pistol"
      put_text(RIVERSIDE_PISTOL_SCREEN)
      put_menu
    when "SMG"
      put_text(RIVERSIDE_SMG_SCREEN)
      put_menu
    when "Dagger"
      put_text(RIVERSIDE_DAGGER_SCREEN)
      put_menu
    when "Axe"
      put_text(RIVERSIDE_AXE_SCREEN)
      put_menu
    when "Bare hands"
      put_text(RIVERSIDE_BAREHANDS_SCREEN)
      put_menu
    when "Rope"
      put_text(RIVERSIDE_ROPE_SCREEN)
      put_menu
    when "Acid"
      put_text(RIVERSIDE_ACID_SCREEN)
      put_menu
    else put_text("dunno lol")
    end
  end

end

class Forensics < Scene
  include ForensicsText

  def enter
    case $crime.killer["Firstname"]
    when "Herman"
      put_text(FORENSICS_HERMAN)
      put_menu(["Press enter to return to the crime scene..."])
      return $crime.location
    when "Stuart"
      put_text(FORENSICS_STUART)
      put_menu(["Press enter to return to the crime scene..."])
      return $crime.location
    when "Winton"
      put_text(FORENSICS_WINTON)
      put_menu(["Press enter to return to the crime scene..."])
      return $crime.location
    when "Gwyn"
      put_text(FORENSICS_GWYN)
      put_menu(["Press enter to return to the crime scene..."])
      return $crime.location
    when "Emmaline"
      put_text(FORENSICS_EMMALINE)
      put_menu(["Press enter to return to the crime scene..."])
      return $crime.location
    when "Ranald"
      put_text(FORENSICS_RANALD)
      put_menu(["Press enter to return to the crime scene..."])
      return $crime.location
    else puts "dunno lol"
    end
  end
end

class City < Scene
  include CityText

  def enter
    put_text(CITY_MAIN_SCREEN)
    action = put_menu(CITY_SCREEN_MENU)

    case action
    when 1 then "Hotel"
    when 2 then "Bar"
    when 3 then "Back alley"
    when 4 then "Soho"
    when 5 then "Offices"
    when 6 then "Shop"
    when 7 then "RiverSide"
    when 8 then "PoliceStation"
    when 9 then "Report"
    else "City"
    end
  end

end

class Hotel < Scene
  include HotelText
  @@hotel_visited = false

  def enter
    put_text(HOTEL_MAIN_SCREEN)
    put_menu if !@@hotel_visited # Show hotel intro screen only once
    @@hotel_visited = true

    if $crime.location != "Hotel"
      put_text(HOTEL_NOT_LOCATION_SCREEN)
      put_menu
    else
      put_text(HOTEL_LOCATION_SCREEN)
      action = put_menu(HOTEL_LOCATION_SCREEN_MENU)

      case action
      when 1
        case $crime.weapon
        when "Poison"
          put_text(HOTEL_ROOM_SCREEN_POISON)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Pistol"
          put_text(HOTEL_ROOM_SCREEN_PISTOL)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "SMG"
          put_text(HOTEL_ROOM_SCREEN_SMG)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Dagger"
          put_text(HOTEL_ROOM_SCREEN_DAGGER)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Axe"
          put_text(HOTEL_ROOM_SCREEN_AXE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Bare hands"
          put_text(HOTEL_ROOM_SCREEN_BAREHANDS)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Rope"
          put_text(HOTEL_ROOM_SCREEN_ROPE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Acid"
          put_text(HOTEL_ROOM_SCREEN_ACID)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        else
          puts "dunno lol"
        end
      when 2
        put_text(HOTEL_WITNESS_SCREEN)
        put_menu
        return "Hotel"
      when 3
        "City"
      end
    end
    "City"
  end
end

class Bar < Scene
  include BarText
  @@bar_visited = false

  def enter
    put_text(BAR_MAIN_SCREEN)
    put_menu if !@@bar_visited # Show hotel intro screen only once
    @@bar_visited = true

    if $crime.location != "Bar"
      put_text(BAR_NOT_LOCATION_SCREEN)
      put_menu
    else
      put_text(BAR_LOCATION_SCREEN)
      action = put_menu(BAR_LOCATION_SCREEN_MENU)

      case action
      when 1
        case $crime.weapon
        when "Poison"
          put_text(BAR_SCREEN_POISON)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Pistol"
          put_text(BAR_SCREEN_PISTOL)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "SMG"
          put_text(BAR_SCREEN_SMG)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Dagger"
          put_text(BAR_SCREEN_DAGGER)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Axe"
          put_text(BAR_SCREEN_AXE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Bare hands"
          put_text(BAR_SCREEN_BAREHANDS)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Rope"
          put_text(BAR_SCREEN_ROPE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Acid"
          put_text(BAR_SCREEN_ACID)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        else
          puts "dunno lol"
        end
      when 2
        put_text(BAR_WITNESS_SCREEN)
        put_menu
        return "Bar"
      when 3
        "City"
      end
    end
    "City"
  end
end

class BackAlley < Scene
  include BackalleyText
  @@backalley_visited = false

  def enter
    put_text(BACKALLEY_MAIN_SCREEN)
    put_menu if !@@backalley_visited # Show hotel intro screen only once
    @@backalley_visited = true

    if $crime.location != "Back alley"
      put_text(BACKALLEY_NOT_LOCATION_SCREEN)
      put_menu
    else
      put_text(BACKALLEY_LOCATION_SCREEN)
      action = put_menu(BACKALLEY_LOCATION_SCREEN_MENU)

      case action
      when 1
        case $crime.weapon
        when "Poison"
          put_text(BACKALLEY_SCREEN_POISON)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Pistol"
          put_text(BACKALLEY_SCREEN_PISTOL)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "SMG"
          put_text(BACKALLEY_SCREEN_SMG)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Dagger"
          put_text(BACKALLEY_SCREEN_DAGGER)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Axe"
          put_text(BACKALLEY_SCREEN_AXE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Bare hands"
          put_text(BACKALLEY_SCREEN_BAREHANDS)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Rope"
          put_text(BACKALLEY_SCREEN_ROPE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Acid"
          put_text(BACKALLEY_SCREEN_ACID)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        else
          puts "dunno lol"
        end
      when 2
        put_text(BACKALLEY_WITNESS_SCREEN)
        put_menu
        return "Back alley"
      when 3
        "City"
      end
    end
    "City"
  end

end

class Soho < Scene
  include SohoText
  @@soho_visited = false

  def enter
    put_text(SOHO_MAIN_SCREEN)
    put_menu if !@@soho_visited # Show hotel intro screen only once
    @@soho_visited = true

    if $crime.location != "Soho"
      put_text(SOHO_NOT_LOCATION_SCREEN)
      put_menu
    else
      put_text(SOHO_LOCATION_SCREEN)
      action = put_menu(SOHO_LOCATION_SCREEN_MENU)

      case action
      when 1
        case $crime.weapon
        when "Poison"
          put_text(SOHO_SCREEN_POISON)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Pistol"
          put_text(SOHO_SCREEN_PISTOL)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "SMG"
          put_text(SOHO_SCREEN_SMG)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Dagger"
          put_text(SOHO_SCREEN_DAGGER)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Axe"
          put_text(SOHO_SCREEN_AXE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Bare hands"
          put_text(SOHO_SCREEN_BAREHANDS)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Rope"
          put_text(SOHO_SCREEN_ROPE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Acid"
          put_text(SOHO_SCREEN_ACID)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        else
          puts "dunno lol"
        end
      when 2
        put_text(SOHO_WITNESS_SCREEN)
        put_menu
        return "Soho"
      when 3
        "City"
      end
    end
    "City"
  end
end

class Offices < Scene
  include OfficesText
  @@offices_visited = false

  def enter
    put_text(OFFICES_MAIN_SCREEN)
    put_menu if !@@offices_visited # Show hotel intro screen only once
    @@offices_visited = true

    if $crime.location != "Offices"
      put_text(OFFICES_NOT_LOCATION_SCREEN)
      put_menu
    else
      put_text(OFFICES_LOCATION_SCREEN)
      action = put_menu(OFFICES_LOCATION_SCREEN_MENU)

      case action
      when 1
        case $crime.weapon
        when "Poison"
          put_text(OFFICES_SCREEN_POISON)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Pistol"
          put_text(OFFICES_SCREEN_PISTOL)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "SMG"
          put_text(OFFICES_SCREEN_SMG)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Dagger"
          put_text(OFFICES_SCREEN_DAGGER)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Axe"
          put_text(OFFICES_SCREEN_AXE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Bare hands"
          put_text(OFFICES_SCREEN_BAREHANDS)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Rope"
          put_text(OFFICES_SCREEN_ROPE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Acid"
          put_text(OFFICES_SCREEN_ACID)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        else
          puts "dunno lol"
        end
      when 2
        put_text(OFFICES_WITNESS_SCREEN)
        put_menu
        return "Offices"
      when 3
        "City"
      end
    end
    "City"
  end

end

class Shop < Scene
  include ShopText
  @@shop_visited = false

  def enter
    put_text(SHOP_MAIN_SCREEN)
    put_menu if !@@shop_visited # Show hotel intro screen only once
    @@shop_visited = true

    if $crime.location != "Shop"
      put_text(SHOP_NOT_LOCATION_SCREEN)
      put_menu
    else
      put_text(SHOP_LOCATION_SCREEN)
      action = put_menu(SHOP_LOCATION_SCREEN_MENU)

      case action
      when 1
        case $crime.weapon
        when "Poison"
          put_text(SHOP_SCREEN_POISON)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Pistol"
          put_text(SHOP_SCREEN_PISTOL)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "SMG"
          put_text(SHOP_SCREEN_SMG)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Dagger"
          put_text(SHOP_SCREEN_DAGGER)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Axe"
          put_text(SHOP_SCREEN_AXE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Bare hands"
          put_text(SHOP_SCREEN_BAREHANDS)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Rope"
          put_text(SHOP_SCREEN_ROPE)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        when "Acid"
          put_text(SHOP_SCREEN_ACID)
          put_menu(["Press enter to talk to the forensics officers..."])
          return "Forensics"
        else
          puts "dunno lol"
        end
      when 2
        put_text(SHOP_WITNESS_SCREEN)
        put_menu
        return "Shop"
      when 3
        "City"
      end
    end
    "City"
  end

end

class Report < Scene
  include ReportText

  @chosen_suspect = "<Suspect not yet chosen>"
  @chosen_location = "<Location not yet chosen>"
  @chosen_weapon = "<Murder weapon not yet chosen>"

  def enter
    put_text(REPORT_MAIN_SCREEN)
    action = put_menu(REPORT_MAIN_SCREEN_MENU)

    case action
    when 1 then identify_killer
    when 2 then identify_location
    when 3 then identify_weapon
    when 4 then finalise_report
    when 5 then "City"
    end
  end

  def identify_killer
    put_text(REPORT_KILLER_SCREEN)
    x = put_menu(REPORT_KILLER_SCREEN_MENU)

    @chosen_suspect = "#{$crime.suspects[x - 1]["Firstname"]} #{$crime.suspects[x - 1]["Surname"]}"
    $killer_identified = true if $crime.suspects[x - 1] == $crime.killer
    "Report"
  end

  def identify_location
    put_text(REPORT_LOCATION_SCREEN)
    x = put_menu(REPORT_LOCATION_SCREEN_MENU)

    @chosen_location = "#{$crime.locations[x - 1]}"
    $location_identified = true if $crime.locations[x - 1] == $crime.location
    "Report"
  end

  def identify_weapon
    put_text(REPORT_WEAPON_SCREEN)
    x = put_menu(REPORT_WEAPON_SCREEN_MENU)

    @chosen_weapon = "#{$crime.weapons[x - 1]}"
    $weapon_identified = true if $crime.weapons[x - 1] == $crime.weapon
    "Report"
  end

  def finalise_report
    put_text(REPORT_FINALISE_SCREEN)
    puts "KILLER: #{@chosen_suspect}"
    puts "LOCATION: #{@chosen_location}"
    puts "WEAPON: #{@chosen_weapon} \n"
    choice = put_menu(REPORT_FINALISE_SCREEN_MENU)

    case choice
    when 1 then "EndGame"
    when 2 then "Report"
    end
  end

  "City"
end

class EndGame < Scene
  include EndGameText
  @@score = 0

  def enter
    put_text(ENDGAME_MAIN_SCREEN)

    if $killer_identified
      puts "You DID identify the killer"
      @@score += 1
    else
      puts "You DID NOT identify the killer"
    end

    if $location_identified
      puts "You DID identify the murder location"
      @@score += 1
    else
      puts "You DID NOT identify the murder location"
    end

    if $weapon_identified
      puts "You DID identify the murder weapon"
      @@score += 1
    else
      puts "You DID NOT identify the murder weapon"
    end

    put_menu

    case @@score
    when 0
      put_text(ENDGAME_0_SCREEN)
    when 1
      put_text(ENDGAME_1_SCREEN)
    when 2
      put_text(ENDGAME_2_SCREEN)
    when 3
      put_text(ENDGAME_3_SCREEN)
    end
    put_menu(["Press enter to conclude..."])
  end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play
    current_scene = @scene_map.opening_scene
    last_scene = @scene_map.next_scene("EndGame")

    while current_scene != last_scene
      next_scene_name = current_scene.enter
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter
  end
end

class Map
  @@scenes = {
    "Hotel" => Hotel.new,
    "Bar" => Bar.new,
    "Back alley" => BackAlley.new,
    "Soho" => Soho.new,
    "Offices" => Offices.new,
    "Shop" => Shop.new,
    "StartGame" => StartGame.new,
    "EndGame" => EndGame.new,
    "PoliceStation" => PoliceStation.new,
    "RiverSide" => RiverSide.new,
    "City" => City.new,
    "Forensics" => Forensics.new,
    "Report" => Report.new
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
  end

  def opening_scene
    next_scene(@start_scene)
  end
end

game_map = Map.new("StartGame")
game_engine = Engine.new(game_map)
$crime = Murder.new
# $crime.display_crime
game_engine.play
