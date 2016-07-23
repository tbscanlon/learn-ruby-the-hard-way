class ParserError < Exception
end

class Sentence

  def initialize(subject, verb, object)
    @subject = subject[1]
    @verb = verb[1]
    @object = object[1]
  end

  attr_reader :subject, :verb, :object

end

class Parse
  def peek(word_list)
    word = word_list[0]
    word[0] rescue nil
  end

  def match(word_list, expecting)
    if word_list
      word = word_list.shift

      if word[0] == expecting
        word
      else
        nil
      end
    else
      nil
    end
  end

  def skip(word_list, word_type)
    while peek(word_list) == word_type
      match(word_list, word_type)
    end
  end

  def parse_verb(word_list)
    skip(word_list, "stop")

    if peek(word_list) == "verb"
      return match(word_list, "verb")
    else
      raise ParserError.new("Expected a verb next.")
    end
  end

  def parse_object(word_list)
    skip(word_list, "stop")
    next_word = peek(word_list)

    if next_word == "noun"
      match(word_list, "noun")
    elsif next_word == "direction"
      match(word_list, "direction")
    else
      raise ParserError.new("Expected a noun or direction next.")
    end
  end

  def parse_subject(word_list)
    skip(word_list, "stop")
    next_word = peek(word_list)

    if next_word == "noun"
      match(word_list, "noun")
    elsif next_word == "verb"
      ["noun", "player"]
    else
      raise ParserError.new("Expected a verb next.")
    end
  end

  def parse_sentence(word_list)
    subject = parse_subject(word_list)
    verb = parse_verb(word_list)
    object = parse_object(word_list)

    Sentence.new(subject, verb, object)
  end

end
