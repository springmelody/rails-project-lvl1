# frozen_string_literal: true

require_relative 'tag'
require_relative 'form_tags/input'
require_relative 'form_tags/text'

module HexletCode
  class Error < StandardError; end

  class Form
    def initialize(model, url)
      @model = model
      @url = url
      @result = []
    end

    def form_wrapper
      HexletCode::Tag.build('form', { action: @url, method: 'post' })
    end

    def input(key, **kwargs)
      type = kwargs.empty? ? :input : kwargs[:as]
      @result << (HexletCode.const_get type.capitalize).new(@model, key).build
    end

    def submit
      @result << HexletCode::Tag.build('input', { name: 'commit', type: 'submit', value: 'Save' })
    end

    def build_form
      form_tag_start, form_tag_end = form_wrapper.split('><')
      "#{form_tag_start}>#{@result.join}<#{form_tag_end}"
    end
  end
end
