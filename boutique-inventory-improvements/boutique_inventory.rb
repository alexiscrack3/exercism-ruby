require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) }
  end

  def item_names
    items.map(&:name).sort
  end

  def total_stock
    total = items.sum do |item|
      puts "S = #{item.quantity_by_size}"
      item.quantity_by_size[:s].to_i
    end
    total += items.sum do |item|
      item.quantity_by_size[:m].to_i
    end
    total += items.sum do |item|
      item.quantity_by_size[:l].to_i
    end
    total += items.sum do |item|
      item.quantity_by_size[:xl].to_i
    end
  end
end
