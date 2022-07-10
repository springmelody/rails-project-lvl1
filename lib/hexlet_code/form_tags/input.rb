# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  class Input
    def initialize(model, key, kwargs = {})
      @key = key
      @kwargs = kwargs
      @value = model.members.include?(@key) ? model[@key] : ''
      # value empty?
    end

    def label
      HexletCode::Tag.build('label', { for: @key }) { @key.capitalize }
    end

    def input
      HexletCode::Tag.build('input', { name: @key, type: 'text', value: @value }.merge(@kwargs))
    end

    def build
      [label, input]
    end
  end
end
