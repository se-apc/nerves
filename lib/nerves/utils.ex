defmodule Nerves.Utils do
  @build_dir "nerves"
  @image_dir "images"

  def build_path do
    Mix.Project.build_path
    |> Path.join(@build_dir)
  end

  def image_path do
    build_path()
    |> Path.join()
  end

  def rel_path do
    Mix.Project.build_path
    |> Path.join("rel")
  end

  def expand_paths(paths, path) do

  end
  
end
