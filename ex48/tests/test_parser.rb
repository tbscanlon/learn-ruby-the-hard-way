require "ex48/parser.rb"
require "test/unit"

class TestLexicon < Test::Unit::TestCase
  @@x = Parse.new

  def test_peek
    assert_equal(@@x.peek([["direction", "north"]]), "direction")
  end

  def test_match
    assert_equal(@@x.match([["noun", "princess"]], "noun"), ["noun", "princess"])
  end

  def test_skip
    assert_equal(@@x.skip([["stop", "the"]], "stop"), nil)
  end

  def test_parse_verb
    assert_equal(@@x.parse_verb([["verb", "run"]]), ["verb", "run"])

    assert_raise ParserError do
      @@x.parse_verb([["noun", "bear"]])
    end
  end

  def test_parse_object
    assert_equal(@@x.parse_object([["noun", "bear"]]), ["noun", "bear"])
    assert_equal(@@x.parse_object([["direction", "up"]]), ["direction", "up"])

    assert_raise ParserError do
      @@x.parse_object([["verb", "run"]])
    end
  end

  def test_parse_subject
    assert_equal(@@x.parse_subject([["noun", "bear"]]), ["noun", "bear"])
    assert_equal(@@x.parse_subject([["verb", "run"]]), ["noun", "player"])

    assert_raise ParserError do
      @@x.parse_subject([["direction", "west"]])
    end
  end

  def test_parse_sentence
    result = @@x.parse_sentence([["noun", "bear"], ["verb", "eat"], ["stop", "the"], ["noun", "honey"]])

    assert_equal(result.subject, "bear")
    assert_equal(result.verb, "eat")
    assert_equal(result.object, "honey")
  end

end
