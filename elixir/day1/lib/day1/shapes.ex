defmodule Day1.Shapes do
  @type point :: {x :: float(), y :: float()}
  @type line :: {start :: point(), stop :: point()}
  @type circle :: {centre :: point(), radius :: float()}
  @type polygon() :: [point() | [point() | [point()]]]
  @type triangle() :: {point(), point(), point()}
end
