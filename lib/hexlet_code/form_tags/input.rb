# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  class Input
    def initialize(model, key, kwargs)
      @model = model
      @key = key
      @class = kwargs[:class] || nil
    end

    def label
      HexletCode::Tag.build('label', { for: @key }) { @key.capitalize }
    end

    def input
      width_class = HexletCode::Tag.build('input', { name: @key, type: 'text', value: @model[@key], class: @class })
      return width_class if @class

      HexletCode::Tag.build('input', { name: @key, type: 'text', value: @model[@key] })
    end

    def build
      [label, input]
    end
  end
end
