defmodule Nerves.SquashfsTest do
  use NervesTest.Case

  test "mksquashfs", context do
    in_tmp context.test, fn ->
      input = tmp_path(context.test)
      output = input <> ".squashfs"
      mk_simple_squashfs(input, "a", output)
      assert File.exists?(output)
    end
  end

  test "merge squashfs", context do
    in_tmp context.test, fn ->
      input = tmp_path(context.test) |> Path.join("a")
      output = input <> ".squashfs"
      mk_simple_squashfs(input, "a", output)

      input = tmp_path(context.test) |> Path.join("b")
      output = input <> ".squashfs"
      mk_simple_squashfs(input, "b", output)

      
    end
  end

  defp mk_simple_squashfs(input, filename, output) do
    Path.join(input, file)
    |> File.touch()

    Nerves.Utils.Squashfs.mksquashfs(input, output)
  end
end
