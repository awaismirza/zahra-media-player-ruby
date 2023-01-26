require 'gosu'

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

class RemoteControlWindow < Gosu::Window
  BUTTON_WIDTH = 200
  BUTTON_HEIGHT = 50
  BUTTON_MARGIN = 10

  def initialize(remote)
    super(640, 480)
    @remote = remote
    @buttons = []

    @buttons << Button.new(self, :lock, "Lock Doors", 0, 0, Gosu::Color::RED, Gosu::Color::RED)
    @buttons << Button.new(self, :unlock, "Unlock Doors", 0, BUTTON_HEIGHT + BUTTON_MARGIN, Gosu::Color::BLUE, Gosu::Color::RED)
    @buttons << Button.new(self, :start, "Start Engine", 0, 2 * (BUTTON_HEIGHT + BUTTON_MARGIN), Gosu::Color::GREEN,  Gosu::Color::RED)
    @buttons << Button.new(self, :stop, "Stop Engine", 0, 3 * (BUTTON_HEIGHT + BUTTON_MARGIN), Gosu::Color::YELLOW,  Gosu::Color::RED)
    @buttons << Button.new(self, :honk, "Honk Horn", 0, 4 * (BUTTON_HEIGHT + BUTTON_MARGIN), Gosu::Color::CYAN,  Gosu::Color::RED)
    @buttons << Button.new(self, :lights_on, "Turn Lights On", 0, 5 * (BUTTON_HEIGHT + BUTTON_MARGIN), Gosu::Color::RED,  Gosu::Color::RED)
    @buttons << Button.new(self, :lights_off, "Turn Lights Off", 0, 6 * (BUTTON_HEIGHT + BUTTON_MARGIN), Gosu::Color::WHITE,  Gosu::Color::RED)

  end

  def update
    @buttons.each(&:update)
  end

  def draw
    @buttons.each(&:draw)
  end

  def button_down(id)
    @buttons.each { |button| button.click if button.hovering? }
  end

  class Button
    attr_reader :x, :y, :width, :height

    def initialize(window, action, text, x, y, color, font_color)
      @window = window
      @action = action
      @text = text
      @x = x
      @y = y
      @width = BUTTON_WIDTH
      @height = BUTTON_HEIGHT
      @font = Gosu::Font.new(20)
      @color = color
      @font_color = font_color
    end

    def update
      @hovering = hovering?
    end

    def draw
        color = @hovering ? Gosu::Color::YELLOW : @color
        @window.draw_quad(x1, y1, color, x2, y1, color, x2, y2, color, x1, y2, color)
        @font.draw_text(@text, x + 10, y + 10, 0, 1, 1, @font_color)
    end

    def click
      @window.instance_variable_get(:@remote).press_button(@action)
    end

    def hovering?
      @window.mouse_x.between?(x1, x2) && @window.mouse_y.between?(y1, y2)
    end

    private

    def x1
      x
    end

    def x2
      x + width
    end

    def y1
      y
    end

    def y2
      y + height
    end
  end
end

remote = RemoteControlWindow.new(Car.new)
window = RemoteControlWindow.new(remote)
window.show

