require 'LRU_cache'
require 'rspec'

describe LRUCache do

  describe '#initialize' do
    it 'creates a contents array to hold the items added'
  end

  describe '#count' do
    it 'returns the number of elements in contents'
  end

  describe '#add' do
    context 'the added element is not already in the array' do
      it 'adds the element to contents'
      it 'removes the oldest element if contents is full'
    end

    context 'the added element already exists in the array' do
      it 'moves the element to the end of contents'
    end
  end

  describe '#show' do
    it 'returns a string with the contents'
  end
end
