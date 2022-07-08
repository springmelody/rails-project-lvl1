# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, :gender, keyword_init: true)

class HexletCodeTest < Minitest::Test
  # def test_empty_form
  #   user = User.new name: 'rob'
  #   expected = File.read("#{File.dirname(__FILE__)}/fixtures/empty_form.html").strip
  #   result = HexletCode.form_for user do |f|
  #   end
  #   assert { expected == result }
  # end

  # def test_empty_form_url
  #   user = User.new name: 'rob'
  #   expected = File.read("#{File.dirname(__FILE__)}/fixtures/empty_form_url.html").strip
  #   result = HexletCode.form_for user, url: '/users' do |f|
  #   end
  #   assert { expected == result }
  # end

  def test_form
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    expected = File.read("#{File.dirname(__FILE__)}/fixtures/form.html").strip
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert { expected == result }
  end

  # def test_form_simple
  #   user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  #   expected = File.read("#{File.dirname(__FILE__)}/fixtures/form_simple.html").strip
  #   result = HexletCode.form_for user do |f|
  #     f.input :name
  #   end
  #   assert { expected == result }
  # end
end
