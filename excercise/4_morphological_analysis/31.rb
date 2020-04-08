# frozen_string_literal: true

require_relative './mecab_wrapper'

File.open(__dir__ + '/neko.txt').readlines.each do |sentence|
  p MecabWrapper.new.parse(sentence).select(&:verb?).map(&:surface)
end
