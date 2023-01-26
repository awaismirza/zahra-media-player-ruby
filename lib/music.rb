# frozen_string_literal: true

require 'gosu'
require 'pathname'

class MusicPlayer < Gosu::Window
  def initialize
    super 1280, 720
    self.caption = "Simple Music Player"
    music = Pathname.new(File.expand_path("/Users/awaisjamil/Library/Mobile Documents/com~apple~CloudDocs/code-icloud/zara assignments/music_player_zara/lib/assets/music.mp3"))
    play = Pathname.new(File.expand_path("/Users/awaisjamil/Library/Mobile Documents/com~apple~CloudDocs/code-icloud/zara assignments/music_player_zara/lib/assets/play.png"))
    pause = Pathname.new(File.expand_path("/Users/awaisjamil/Library/Mobile Documents/com~apple~CloudDocs/code-icloud/zara assignments/music_player_zara/lib/assets/pause.png"))
    stop = Pathname.new(File.expand_path("/Users/awaisjamil/Library/Mobile Documents/com~apple~CloudDocs/code-icloud/zara assignments/music_player_zara/lib/assets/stop.png"))

    @background_color = Gosu::Color::WHITE
    @song = Gosu::Song.new(music.to_s)
    @play_button = Gosu::Image.new(play.to_s, :tileable => true , :width => 30, :height => 30)
    @pause_button = Gosu::Image.new(pause.to_s, :tileable => true , :width => 30, :height => 30)
    @stop_button = Gosu::Image.new(stop.to_s, :tileable => true , :width => 30, :height => 30)
    @current_button = :play
  end

  def update
    if @current_button == :play
      @song.play
    elsif @current_button == :pause
      @song.pause
    elsif @current_button == :stop
      @song.stop
    end
  end

  def draw
    Gosu.draw_rect(0, 0, width, height, @background_color)
    @button_width = width / 4
    @button_height = height / 10

    @play_button.draw(@button_width, @button_height, 1, 0.2, 0.2)
    @pause_button.draw(@button_width * 2, @button_height, 1, 0.2, 0.2)
    @stop_button.draw(@button_width * 3, @button_height, 1, 0.2, 0.2)

  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      if Gosu.button_down?(Gosu::MS_LEFT)
        if mouse_x.between?(@button_width, @button_height) && mouse_y.between?(@button_width, @button_height)
          @current_button = :play
        elsif mouse_x.between?(@button_width, @button_height * 2) && mouse_y.between?(@button_width, @button_height)
          @current_button = :pause
        elsif mouse_x.between?(@button_width, @button_height * 3) && mouse_y.between?(@button_width, @button_height)
          @current_button = :stop
        else
          @current_button = :pause
        end
      end
    end
  end

  def show
    super
  end
end

MusicPlayer.new.show
