# frozen_string_literal: true

module HexletCode
  autoload(:Form, 'hexlet_code/form')
  autoload(:Tag, 'hexlet_code/tag')

  class Error < StandardError; end

  def self.form_for(model, options = {})
    form = Form.new(model, options)

    yield(form) if block_given?
    form.build_form
  end
end
