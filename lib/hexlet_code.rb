# frozen_string_literal: true

module HexletCode
  autoload(:Form, 'hexlet_code/form')
  autoload(:Parser, 'hexlet_code/parser')

  class Error < StandardError; end

  def self.form_for(model, options = {})
    form = Form.new(model)
    yield(form) if block_given?

    structure = form.generate_structure
    Parser.convert(structure, options)
  end
end
