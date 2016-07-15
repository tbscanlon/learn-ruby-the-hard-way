require "./murder.rb"
require "./text.rb"

class Murder
  include Commit_Murder
  attr_accessor :victim, :location, :suspects, :killer, :weapon

  def initialize
    @victim = choose_victim
    # @location = choose_location
    @location = "Hotel"
    @suspects = choose_suspects(@victim)
    @killer = choose_killer(@suspects)
    @weapon = choose_weapon(@killer)
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

class City < Scene
  include CityText

  def enter
    put_text(CITY_MAIN_SCREEN)
    action = put_menu(CITY_SCREEN_MENU)

    case action
    when 1 then "Hotel"
    when 2 then "Bar"
    when 3 then "BackAlley"
    when 4 then "Soho"
    when 5 then "Offices"
    when 6 then "Shop"
    when 7 then "RiverSide"
    when 8 then "PoliceStation"
    when 9 then "EndGame"
    else "City"
    end
  end

end

class Hotel < Scene
  include HotelText

  def enter
    put_text(HOTEL_MAIN_SCREEN)

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
          put_menu
        when "Pistol"
          put_text(HOTEL_ROOM_SCREEN_PISTOL)
          put_menu
        when "SMG"
          put_text(HOTEL_ROOM_SCREEN_SMG)
          put_menu
        when "Dagger"
          put_text(HOTEL_ROOM_SCREEN_DAGGER)
          put_menu
        when "Axe"
          put_text(HOTEL_ROOM_SCREEN_DAGGER)
          put_menu
        when "Bare hands"
          put_text(HOTEL_ROOM_SCREEN_BAREHANDS)
          put_menu
        when "Rope"
          put_text(HOTEL_ROOM_SCREEN_ROPE)
          put_menu
        when "Acid"
          put_text(HOTEL_ROOM_SCREEN_ACID)
          put_menu
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
end

class BackAlley < Scene
end

class Soho < Scene
end

class Offices < Scene
end

class Shop < Scene
end

class EndGame < Scene
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
    "BackAlley" => BackAlley.new,
    "Soho" => Soho.new,
    "Offices" => Offices.new,
    "Shop" => Shop.new,
    "StartGame" => StartGame.new,
    "EndGame" => EndGame.new,
    "PoliceStation" => PoliceStation.new,
    "RiverSide" => RiverSide.new,
    "City" => City.new
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
