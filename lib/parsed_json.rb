# frozen_string_literal: true

# This class is used to parse arbitrary key values into an object with instance variables
# named with the key name, holding the values.  It should be noted, it does not handle nesting,
# you would just have a nested hash stored
class ParsedJson
  # Initilizes a ParsedJson Object
  # @params [Hash] kwargs Takes an arbitrary hash an parses with the assumption that each key represents a Team
  def initialize(**kwargs)
    kwargs.each do |name, value|
      instance_variable_set(normalize_key(name), value)
      self.class.attr_accessor name.to_sym
    end
  end

  # This method normalizes our key name, to declare an instance variable
  # it must start with '@'
  # @param [Symbol] key - key to normalize
  # @return [Symbol] Normlaized key
  def normalize_key(key)
    ('@' + key.to_s).to_sym
  end
end