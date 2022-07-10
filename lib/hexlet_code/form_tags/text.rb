# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  class Text
    def initialize(model, key, kwargs = {})
      @model = model
      @key = key
      @kwargs = kwargs
      # @default_params = { cols: 20, rows: 40 }
      # @class = kwargs[:class] || nil
      # @options = {}
      # byebug
    end

    def label
      HexletCode::Tag.build('label', { for: @key }) { @key.capitalize }
    end

    def input
      [HexletCode::Tag.build('textarea', { name: @key }.merge(@kwargs)) { @model[@key] }]
    end

    def build
      [label, input]
    end
  end
end
