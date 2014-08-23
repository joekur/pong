require 'gosu'

class PongWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)

    @ball = Ball.new
  end

  def update
  end

  def draw
    @ball.draw(self)
  end
end

class Ball
  COLOR = Gosu::Color::WHITE
  WIDTH = 10

  def initialize
    @x = PongWindow::WIDTH / 2
    @y = PongWindow::HEIGHT / 2
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
