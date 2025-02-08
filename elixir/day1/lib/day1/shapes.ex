defmodule Day1.Shapes do
  @type point :: {x :: float(), y :: float()}
  @type line :: {start :: point(), stop :: point()}
  @type circle :: {centre :: point(), radius :: float()}
  @type polygon() :: [point() | [point() | [point()]]]
  @type triangle() :: {point(), point(), point()}

  def hypoteneuse(width, height) do
    Float.pow(Float.pow(width, 2) + Float.pow(height, 2), 0.5)
  end
end
