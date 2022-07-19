# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Input, 'hexlet_code/form_tags/input')
  autoload(:Text, 'hexlet_code/form_tags/text')

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
      @result << Tag.build('input', { name: 'commit', type: 'submit', value: value })
    end

    def build_form
      Tag.build('form', { action: @url, method: 'post' }.merge(@options.except(:url))) { @result.join }
    end
  end
end
