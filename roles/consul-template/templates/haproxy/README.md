-f <cfgfile|cfgdir> : adds <cfgfile> to the list of configuration files to be
  loaded. If <cfgdir> is a directory, all the files (and only files) it
  contains are added in lexical order (using LC_COLLATE=C) to the list of
  configuration files to be loaded ; only files with ".cfg" extension are
  added, only non hidden files (not prefixed with ".") are added.
  Configuration files are loaded and processed in their declaration order.
  This option may be specified multiple times to load multiple files. See
  also "--". The difference between "--" and "-f" is that one "-f" must be
  placed before each file name, while a single "--" is needed before all file
  names. Both options can be used together, the command line ordering still
  applies. When more than one file is specified, each file must start on a
  section boundary, so the first keyword of each file must be one of
  "global", "defaults", "peers", "listen", "frontend", "backend", and so on.
  A file cannot contain just a server list for example.

渲染子配置文件时，要注意文件排序。