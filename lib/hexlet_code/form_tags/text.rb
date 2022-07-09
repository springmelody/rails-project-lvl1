# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  class Text
    def initialize(model, key, kwargs)
      @model = model
      @key = key
      @default_params = { cols: 20, rows: 40 }
      @class = kwargs[:class] || nil
    end

    def build
      w_class = [HexletCode::Tag.build('textarea', { cols: 20, rows: 40, name: @key, class: @class }) { @model[@key] }]
      return w_class if @class # rename

      [HexletCode::Tag.build('textarea', { cols: 20, rows: 40, name: @key }) { @model[@key] }]
    end
  end
end
