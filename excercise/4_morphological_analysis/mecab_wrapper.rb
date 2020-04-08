# frozen_string_literal: true

require 'mecab'

class MecabWrapper
  def initialize
    @tagger = MeCab::Tagger.new
  end

  def parse(sentence)
    @tagger.parse(sentence)
           .split("\n")
           .map { |line| Morph.new(line) }
  end

  class Morph
    attr_reader :attributes
    attr_reader :surface
    attr_reader :pos
    attr_reader :pos_detail
    attr_reader :base

    def initialize(line)
      # 表層形\t品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用型,活用形,原形,読み,発音
      @attributes = line.gsub("\t", ',').split(',')
      @surface = @attributes[0] # 表層形
      @pos = @attributes[1] # 品詞
      @pos_detail = @attributes[2] # 品詞細分類1
      @base = @attributes[7] # 原形
    end

    def verb?
      pos == '動詞'
    end

    def noun?
      pos == '名詞'
    end
  end
end
