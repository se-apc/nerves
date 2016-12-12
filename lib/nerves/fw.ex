defmodule Nerves.Fw do

  @target_erl_path "/srv/erlang"

  @doc """
  Produces a fw image from a release.

  Steps required for producing a firmware bundle
  1. Create a rootfs overlay dir and populate with any additions specified
  2. Scrub the release and copy the output to /src/erlang
  3. Merge the release onto the base system
  4. fwup to produce raw image

  Paths used

  """
  def build() do
    target_path =
      Nerves.Utils.build_path
      |> Path.join("target")

    app_name = Mix.Project.config[:app]

    # Prepare the working dir for assembling the target fw
    File.rm_rf(target_path)
    File.mkdir_p!(target_path)

    # Prepare the target location for the release
    target_erl_path = Path.join(target_path, @target_erl_path)
    File.mkdir_p!(target_erl_path)

    # Copy the release to the target
    File.cp_r!(Nerves.Utils.rel_path, target_erl_path)

    #Scrub unnecessary files from the target release
    scrub_release(target_erl_path)
  end

  def scrub_release(path) do
    # Remove the bin dir
    path
    |> Path.join("bin")
    |> File.rm_rf()

    # Get rid of erts
    erts_dir =
      path
      |> Path.join("erts-*")
      |> Path.wildcard
      |> List.first
    if erts_dir do
      File.rm_rf(erts_dir)
    end

    # Remove empty directories

    # Remove any temp files, release tarballs, etc from the base release directory
    # Nothing is supposed to be there.

    # Clean up the releases dir
    # find $RELEASE_DIR/releases \( -name "*.sh" \
                                    #  -o -name "*.bat" \
                                    #  -o -name "*gz" \
                                    #  -o -name "start.boot" \
                                    #  -o -name "start_clean.boot" \
                                    #  \) -delete
    
  end

end
