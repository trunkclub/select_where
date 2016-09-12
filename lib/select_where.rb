require 'select_where/helpers'

module SelectWhere

  def self.detect(array, match_hash)
    array.detect { |i| match_hash.each.all? { |k,v| ::SelectWhere::Helpers.item_matches_target?(i, k, v) }}
  end

  def self.select(array, match_hash)
    array.select { |i| match_hash.each.all? { |k,v| ::SelectWhere::Helpers.item_matches_target?(i, k, v) }}
  end

  def self.fetch_map(array, *args, &block)
    array.map { |i| i.fetch(*args, &block) }
  end

end
