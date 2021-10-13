# encoding: utf-8
require 'helper'

class TestHtml5SerializationMonkeyPatch < Nokogiri::TestCase
  def test_to_xml
    xml = Nokogiri.HTML5('<!DOCTYPE html><source>').to_xml
    assert_match(/\A<\?xml version/, xml)
    assert_match(/<source\s*\/>/, xml)
  end

  def test_html4_fragment
    frag = Nokogiri::HTML.fragment('<span></span>')
    assert frag.is_a?(Nokogiri::HTML::DocumentFragment)
  end
end if Nokogiri.uses_gumbo?
