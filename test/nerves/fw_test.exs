defmodule Nerves.FwTest do
  use NervesTest.Case

  test "Produce an fw image" do
    in_fixture "simple_app", fn ->
      packages =
        ~w(system toolchain system_platform toolchain_platform)
        |> Enum.sort
      _ = load_env(packages)

      Nerves.Fw.build
    end
  end

  test "Squashfs merge" do
    
  end
end
