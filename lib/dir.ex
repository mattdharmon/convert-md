defmodule ConvertMD.Dir do

  alias ConvertMD.PDF

  def parse_dir(dir \\ ".", output \\ ".") do
    mkdir output

    dir
    |> File.ls!
    |> Enum.filter(&(&1 != "pdf"))
    |> Enum.map(&is_file?(&1, dir, output))
    |> List.flatten
  end
  
  def parse_dir_name (dir) do
    dir 
    |> Path.split
    |> join_path
  end

  defp is_file?(file, dir, output) do
    fname = "#{dir}/#{file}"

    case File.dir? fname do
      true -> parse_dir fname, "#{output}/#{file}"
      false -> %PDF{fname: fname, output_dir: output}
    end
  end

  defp mkdir(dir) do
    if (!File.dir? dir) do
      File.mkdir dir
    end
  end

  defp join_path(dirs) do
    case (List.first(dirs) == "/") do
      true -> add_slash(dirs)
      false -> Enum.join(dirs, "/")
    end
  end

  defp add_slash(dirs) do
    dir = dirs
    |> Enum.filter(&(&1 != "/")) 
    |> Enum.join("/") 

    "/" <> dir
  end
end
