# ConvertMD

This little app converts all markdown files into pdf documents in a target directory.

## Build
Dependencies:
  - [Elixir 1.5](https://elixir-lang.org/install.html)

Run:
```bash
$ mix deps.get
$ mix escript.build
```

## Run the Binary.
Dependencies:
  - Erlang VM:
    1. You can install [Elixir 1.5](https://elixir-lang.org/install.html)
    2. or you can install [Erlang](https://www.erlang-solutions.com/resources/download.html) itself
  - [pandoc](https://pandoc.org/installing.html)
  - XeteX
    - [Mac or Windows](http://www.texts.io/download/)
    - Ubuntu ```$ sudo apt install texlive, texlive-xetex```

Run
```bash
$ ./convert_md $source_dir -t $optional_target_dir
```

## FAQs
- Is this over engineered?
  - Maybe.
- Then why do it?
  - Why not?
- Shouldn't you being doing work? ~CEO
  - You're not my supervisor!
