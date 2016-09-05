require 'spec_helper'
require 'select_where/core_ext/array'

describe Array do

  class ABFieldClass
    attr_accessor :a, :b

    def initialize(a:, b:)
      @a = a
      @b = b
    end

  end

  describe Array.instance_method(:select_where) do

    it 'should filter hashes' do
      arr = [
        { 'a' => 10 },
        { a: 10 },
        { 'a' => 11 },
        { a: 11 },
      ]

      r = arr.select_where(a: 10)

      expect(r.length).to eq(2)
      expect(r[0]).to be(arr[0])
      expect(r[1]).to be(arr[1])
    end

    it 'should filter hashes (with proc)' do
      arr = [
        { a: 10 },
        { a: 11 },
        { a: 12 },
      ]

      r = arr.select_where(a: ->(v) { !v.nil? && v <= 11 })

      expect(r.length).to eq(2)
      expect(r[0]).to be(arr[0])
      expect(r[1]).to be(arr[1])
    end

  end


  describe Array.instance_method(:detect_where) do

    it 'should find an item in an array of hashes' do
      arr = [
        { a: 10, b: 12 },
        { a: 11, b: 13 },
        { a: 12, b: 14 },
      ]

      expect(arr.detect_where(a: 12)).to be(arr[2])
    end

    it 'should ignore non-objects' do
      arr = [
        { a: 10, b: 12 },
        Proc.new { 'hi' },
        { a: 12, b: 14 },
      ]

      expect(arr.detect_where(a: 12)).to be(arr[2])
    end

    it 'should evaluate zero-param methods' do
      arr = [
        { a: 10, b: 12 },
        ABFieldClass.new(a: 11, b: 13),
        { a: 12, b: 14 },
      ]

      expect(arr.detect_where(a: 11)).to be(arr[1])
    end

    it 'should evaluate zero-param methods' do
      arr = [
        { a: 10, b: 12 },
        ABFieldClass.new(a: 11, b: 13),
        { a: 12, b: 14 },
      ]

      expect(arr.detect_where(a: 11)).to be(arr[1])
    end

  end
end
