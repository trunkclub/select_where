require 'spec_helper'
require 'select_where'

RSpec.describe SelectWhere do

  it 'should implement fetch_map (key)' do
    arr = [{ 'a' => 1 }, { 'a' => 2 }, { 'b' => 3}]

    expect {
      SelectWhere.fetch_map(arr, 'a')
    }.to raise_error(KeyError)
  end

  it 'should implement fetch_map (key, value)' do
    arr = [{ 'a' => 1 }, { 'a' => 2 }, { 'b' => 3}]
    expect(SelectWhere.fetch_map(arr, 'a', 'default')).to eq([1, 2, 'default'])
  end

  it 'should implement fetch_map (key, block)' do
    arr = [{ 'a' => 1 }, { 'a' => 2 }, { 'b' => 3}]
    expect(SelectWhere.fetch_map(arr, 'a') { 'default' }).to eq([1, 2, 'default'])
  end

end
