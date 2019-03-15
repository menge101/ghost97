# frozen_string_literal: true

class ParsedJson
  INVALID_KEYS = %i[]
  def initialize(**kwargs)
    kwargs.each do |name, value|
      instance_variable_set(normalize_key(name), value)
      self.class.attr_accessor name.to_sym
    end
  end

  def normalize_key(key)
    ('@' + key.to_s).to_sym
  end
end