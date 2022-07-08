# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  class Text
    def initialize(model, key)
      @model = model
      @key = key
      @default_params = { cols: 20, rows: 40 }
    end

    def build
      [HexletCode::Tag.build('textarea', { cols: 20, rows: 40, name: @key }) { @model[@key] }]
    end
  end
end
