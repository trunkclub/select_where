require 'spec_helper'
require 'select_where'

RSpec.describe SelectWhere::Helpers do

  describe '::item_matches_target?' do

    it 'should work with a symbol keyed hash' do
      expect(SelectWhere::Helpers.item_matches_target?({ a: 10 }, 'a', 10)).to eq(true)
      expect(SelectWhere::Helpers.item_matches_target?({ a: 10 }, :a, 10)).to eq(true)
    end

    it 'should work with a string keyed hash' do
      expect(SelectWhere::Helpers.item_matches_target?({ 'a' => 10 }, 'a', 10)).to eq(true)
      expect(SelectWhere::Helpers.item_matches_target?({ 'a' => 10 }, :a, 10)).to eq(true)
    end

    it 'should return false for a non-object or proc' do
      expect(SelectWhere::Helpers.item_matches_target?(->() { 10 }, 'a', 10)).to eq(false)
      expect(SelectWhere::Helpers.item_matches_target?(Proc.new { 10 }, 'a', 10)).to eq(false)
    end

    context 'value is a Proc' do

      it 'call the proc with the found value' do
        test_proc = ->(a) { a == 10 }
        expect(SelectWhere::Helpers.item_matches_target?({ a: 10 }, 'a', test_proc)).to eq(true)
        expect(SelectWhere::Helpers.item_matches_target?({ 'a' => 10 }, 'a', test_proc)).to eq(true)
      end

    end

  end

  describe '::value_matches_target?' do

    it 'should work with simple equality' do
      expect(SelectWhere::Helpers.value_matches_target?('a', 'a')).to eq(true)
    end

    it 'should work with proc values' do
      value = -> (v) { v == 'a' }
      expect(SelectWhere::Helpers.value_matches_target?('a', value)).to eq(true)
    end

    it 'should raise an exception if ' do
      value = -> (v) { v == 'a' }
      expect(SelectWhere::Helpers.value_matches_target?('a', value)).to eq(true)
    end

  end

end
