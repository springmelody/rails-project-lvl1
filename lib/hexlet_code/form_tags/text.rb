# frozen_string_literal: true

module HexletCode
  class Text
    def initialize(model, key, options = {})
      @model = model
      @key = key
      @options = options
    end

    def build
      [
        { tag: 'label', attrs: { for: @key }, content: @key.capitalize },
        { tag: 'textarea', attrs: { name: @key }.merge(@options), content: @model[@key] }
      ]
    end
  end
end
