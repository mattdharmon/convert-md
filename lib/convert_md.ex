defmodule ConvertMD do
  @moduledoc """
  Documentation for Commandline.
  """
  alias ConvertMD.Dir
  alias ConvertMD.PDF

  def main(args) do
    {opts, params, _} = OptionParser.parse args, switches: [target: :string], aliases: [t: :target]

    {input_directory, output_directory} = params
    |> get_input_directory
    |> get_output_directory(opts)

    input_directory
    |> Dir.parse_dir(output_directory)
    |> Enum.each(&PDF.create_pdf(&1))
  end

  defp get_output_directory(directory, opts) do
    case opts[:target] do
      nil -> {directory, "#{directory}/pdf"}
      _ -> {directory, opts[:target] |> Dir.parse_dir_name}
    end
  end

  defp get_input_directory(params) do
    params
    |> List.first
    |> Dir.parse_dir_name
  end
end
