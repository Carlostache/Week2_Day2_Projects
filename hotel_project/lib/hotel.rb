require_relative "room"

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}

    capacities.each do |room_name, capacity|
        @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(str)
    if @rooms.keys.include?(str)
        return true
    else   
        return false
    end
  end

  def check_in(guest, room_name)
    if self.room_exists?(room_name) == false
        puts 'sorry, room does not exist'
    elsif @rooms[room_name].add_occupant(guest) == true
        puts 'check in successful'
    else
        puts 'sorry, room is full'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| room.available_space > 0 }
  end

  def list_rooms
    @rooms.each do |room_name, room_inst|
        puts "#{room_name}  : #{room_inst.available_space}"
    end
  end


end
