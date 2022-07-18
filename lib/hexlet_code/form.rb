# frozen_string_literal: true

require_relative 'tag'
require_relative 'form_tags/input'
require_relative 'form_tags/text'

module HexletCode
  class Error < StandardError; end

  class Form
    def initialize(model, options)
      @model = model
      @url = options[:url] || '#'
      @options = options
      @result = []
    end

    def input(key, **kwargs)
      type = kwargs[:as] || :input
      @result << (HexletCode.const_get type.capitalize).new(@model, key, kwargs).build
    end

    def submit(value = 'Save')
      @result << HexletCode::Tag.build('input', { name: 'commit', type: 'submit', value: value })
    end

    def build_form
      HexletCode::Tag.build('form', { action: @url, method: 'post' }.merge(@options.except(:url))) { @result.join }
    end
  end
end
