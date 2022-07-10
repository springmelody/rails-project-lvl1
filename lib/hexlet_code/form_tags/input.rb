# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  class Input
    def initialize(model, key, kwargs)
      @model = model
      @key = key
      @class = kwargs[:class] || nil
      @kwargs = kwargs
      # byebug
      # value empty?
    end

    def label
      HexletCode::Tag.build('label', { for: @key }) { @key.capitalize }
    end

    def input
      HexletCode::Tag.build('input', { name: @key, type: 'text', value: @model[@key] }.merge(@kwargs))
    end

    def build
      [label, input]
    end
  end
end
