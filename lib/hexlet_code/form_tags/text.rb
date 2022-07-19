# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Text
    def initialize(model, key, kwargs = {})
      @model = model
      @key = key
      @kwargs = kwargs
    end

    def label
      Tag.build('label', { for: @key }) { @key.capitalize }
    end

    def input
      [Tag.build('textarea', { name: @key }.merge(@kwargs)) { @model[@key] }]
    end

    def build
      [label, input]
    end
  end
end
