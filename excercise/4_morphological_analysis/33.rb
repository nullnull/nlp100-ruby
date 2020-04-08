# frozen_string_literal: true

require_relative './mecab_wrapper'

File.open(__dir__ + '/neko.txt').readlines.each do |sentence|
  matched_morphs = MecabWrapper.new.parse(sentence).each_cons(3).select do |morphs|
    morphs[0].noun? && morphs[1].surface == 'の' && morphs[2].noun?
  end

  p matched_morphs.map { |morphs| morphs.map(&:surface).join('') }.join(',')
end
