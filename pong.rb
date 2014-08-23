require 'gosu'

class PongWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)

    @ball = Ball.new
  end

  def update
    @ball.update
  end

  def draw
    @ball.draw(self)
  end
end

class Ball
  COLOR = Gosu::Color::WHITE
  WIDTH = 10
  SPEED = 6

  def initialize
    @x = PongWindow::WIDTH / 2
    @y = PongWindow::HEIGHT / 2
    @dx = -1
    @dy = 1
  end

  def update
    update_position
    check_for_collisions
  end

  def draw(window)
    window.draw_quad(
      left_coordinate,  top_coordinate,    COLOR,
      right_coordinate, top_coordinate,    COLOR,
      left_coordinate,  bottom_coordinate, COLOR,
      right_coordinate, bottom_coordinate, COLOR
    )
  end

  private

  def update_position
    @x = @x + @dx*SPEED
    @y = @y + @dy*SPEED
  end

  def check_for_collisions
    if top_coordinate <= 0
      @dy = -@dy
      @y = WIDTH/2
    elsif bottom_coordinate >= PongWindow::HEIGHT
      @dy = -@dy
      @y = PongWindow::HEIGHT - WIDTH/2
    elsif left_coordinate <= 0
      @dx = -@dx
      @x = WIDTH/2
    elsif right_coordinate >= PongWindow::WIDTH
      @dx = -@dx
      @x = PongWindow::WIDTH - WIDTH/2
    end
  end 

  def left_coordinate
    @x - WIDTH / 2
  end

  def right_coordinate
    @x + WIDTH / 2
  end

  def top_coordinate
    @y - WIDTH / 2
  end

  def bottom_coordinate
    @y + WIDTH / 2
  end

end


PongWindow.new.show
