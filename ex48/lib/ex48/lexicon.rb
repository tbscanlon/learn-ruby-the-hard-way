module Lexicon

  DIRECTIONS = [
    "north",  "south",  "east",
    "west",   "down",   "up",
    "left",   "right",  "back"]

  VERBS = ["stop", "go", "kill", "eat"]

  STOP_WORDS = ["the", "in", "of", "from", "at", "it"]

  NOUNS = ["door", "princess", "bear", "cabinet"]

  def Lexicon.convert_to_number(x)
    Integer(x) rescue nil
  end

  def Lexicon.scan(stuff)
    words = stuff.downcase.split
    a = Array.new

    words.each do |word|
      if DIRECTIONS.include? word
        a.push ["direction", "#{word}"]
      elsif VERBS.include? word
        a.push ["verb", "#{word}"]
      elsif STOP_WORDS.include? word
        a.push ["stop", "#{word}"]
      elsif NOUNS.include? word
        a.push ["noun", "#{word}"]
      elsif word =~ /[0-9]/
        a.push ["number", Lexicon.convert_to_number(word)]
      else
        a.push ["error", "#{word}"]
      end
    end
  a
  end

end
