class RemoteControl
  def initialize(car)
    @car = car
  end

  def press_button(button)
    case button
    when :lock
      @car.lock_doors
    when :unlock
      @car.unlock_doors
    when :start
      @car.start_engine
    when :stop
      @car.stop_engine
    when :honk
      @car.honk_horn
    when :lights_on
      @car.turn_lights_on
    when :lights_off
      @car.turn_lights_off
    end
  end
end

class Car
  def initialize
    @locked = true
    @running = false
    @lights = false
  end

  def lock_doors
    @locked = true
  end

  def unlock_doors
    @locked = false
  end

  def start_engine
    @running = true
  end

  def stop_engine
    @running = false
  end

  def honk_horn
    puts "Honk! Honk!"
  end

  def turn_lights_on
    @lights = true
  end

  def turn_lights_off
    @lights = false
  end
end

car = Car.new
remote = RemoteControl.new(car)

remote.press_button(:unlock)
remote.press_button(:start)
remote.press_button(:lights_on)
remote.press_button(:honk)
remote.press_button(:lights_off)
remote.press_button(:stop)
remote.press_button(:lock)
