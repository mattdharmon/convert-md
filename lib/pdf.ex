defmodule ConvertMD.PDF do
  defstruct [:fname, :output_dir]

  alias ConvertMD.PDF

  def create_pdf(%PDF{:fname => fname, :output_dir => output_dir}) do
    create_pdf(fname, output_dir)
  end

  def create_pdf(fname, output) do
    if (Path.extname(fname) == ".md") do
      output_file = "#{output}/#{Path.basename(fname, ".md")}.pdf"
      System.cmd "pandoc", ["#{fname}", "--latex-engine=xelatex", "-o", output_file]
      IO.puts "File #{output_file} created."
    end
  end
end
