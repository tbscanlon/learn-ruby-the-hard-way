require "ex48/lexicon.rb"
require "test/unit"

class TestLexicon < Test::Unit::TestCase

  def test_directions
    assert_equal(Lexicon.scan("north"), [['direction', 'north']])
    result = Lexicon.scan("north south east west up down back")

    assert_equal(result, [["direction", "north"],
    ["direction", "south"],
    ["direction", "east"],
    ["direction", "west"],
    ["direction", "up"],
    ["direction", "down"],
    ["direction", "back"]])
  end

  def test_verbs
    assert_equal(Lexicon.scan("go"), [["verb", "go"]])
    result = Lexicon.scan("go kill eat stop")

    assert_equal(result, [["verb", "go"],
    ["verb", "kill"],
    ["verb", "eat"],
    ["verb", "stop"]])
  end

  def test_stops
    assert_equal(Lexicon.scan("the"), [["stop", "the"]])
    result = Lexicon.scan("the in of from at it")

    assert_equal(result, [["stop", "the"],
    ["stop", "in"],
    ["stop", "of"],
    ["stop", "from"],
    ["stop", "at"],
    ["stop", "it"]])
  end

  def test_nouns
    assert_equal(Lexicon.scan("bear"), [["noun", "bear"]])
    result = Lexicon.scan("bear princess door cabinet")

    assert_equal(result, [["noun", "bear"],
    ["noun", "princess"],
    ["noun", "door"],
    ["noun", "cabinet"]])
  end

  def test_numbers
    assert_equal(Lexicon.scan("1234"), [["number", 1234]])
    result = Lexicon.scan("3 91234 65 77 192 7562")

    assert_equal(result, [["number", 3],
    ["number", 91234],
    ["number", 65],
    ["number", 77],
    ["number", 192],
    ["number", 7562]])
  end

  def test_error
    assert_equal(Lexicon.scan("ASDFADFASDF"), [["error", "asdfadfasdf"]])
    result = Lexicon.scan("bear IAS princess durr")

    assert_equal(result, [["noun", "bear"],
    ["error", "ias"],
    ["noun", "princess"],
    ["error", "durr"]])
  end

  def test_all
    result = Lexicon.scan("go left up back right kill princess eat in bear")
    assert_equal(result, [["verb", "go"],
    ["direction", "left"],
    ["direction", "up"],
    ["direction", "back"],
    ["direction", "right"],
    ["verb", "kill"],
    ["noun", "princess"],
    ["verb", "eat"],
    ["stop", "in"],
    ["noun", "bear"]])
  end
end
