defmodule ToyRobot.Robot do
  alias ToyRobot.Robot

  defstruct [north: 0, east: 0, facing: :north]

  @doc """
  Moves the robot forward one space in the direction it is facing.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{north: 0, facing: :north}
      %Robot{north: 0, facing: :north}
      iex> robot |> Robot.move
      %Robot{north: 1, facing: :north}
      iex> robot |> Robot.move |> Robot.move |> Robot.move
      %Robot{north: 3, facing: :north}
  """
  def move(%Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :east -> robot |> move_east
      :west -> robot |> move_west
      :south -> robot |> move_south
    end
  end

  @doc """
  Turns the robot left.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: :north}
      %Robot{facing: :north}
      iex> robot |> Robot.turn_left
      %Robot{facing: :west}
  """
  def turn_left(%Robot{facing: facing} = robot) do
    new_direction = case facing do
		      :north -> :west
		      :east -> :north
		      :west -> :south
		      :south -> :east
		    end
    %Robot{robot | facing: new_direction}
  end

  @doc """
  Turns the robot right.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: :north}
      %Robot{facing: :north}
      iex> robot |> Robot.turn_right
      %Robot{facing: :east}
  """
  def turn_right(%Robot{facing: facing} = robot) do
    new_direction = case facing do
      :north -> :east
      :east -> :south
      :west -> :north
      :south -> :west
		    end

    %Robot{robot | facing: new_direction}
  end

  defp move_east(robot) do
    %Robot{robot | east: robot.east + 1}
  end

  defp move_west(robot) do
    %Robot{robot | east: robot.east - 1}
  end

  defp move_north(robot) do
    %Robot{robot | north: robot.north + 1}
  end

  defp move_south(robot) do
    %Robot{robot | north: robot.north - 1}
  end
end
