# frozen_string_literal: true

module HexletCode
  autoload :Form, 'hexlet_code/form'
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(model, options = {})
    form = Form.new(model)
    yield(form) if block_given?

    structure = form.generate_structure
    Form.convert(structure, options)
  end
end
