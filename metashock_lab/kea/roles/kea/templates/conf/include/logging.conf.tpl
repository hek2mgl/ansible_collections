  "output_options": [
    {
      // Specifies the output file. There are several special values
      // supported:
      // - stdout (prints on standard output)
      // - stderr (prints on standard error)
      // - syslog (logs to syslog)
      // - syslog:name (logs to syslog using specified name)
      // Any other value is considered a name of the file
      "output": "stdout",

       // Shorter log pattern suitable for use with systemd,
       // avoids redundant information
       "pattern": "%-5p %m\n"

       // This governs whether the log output is flushed to disk after
       // every write.
       // "flush": false,

       // This specifies the maximum size of the file before it is
       // rotated.
       // "maxsize": 1048576,

       // This specifies the maximum number of rotated files to keep.
       // "maxver": 8
    }
  ],
  // This specifies the severity of log messages to keep. Supported values
  // are: FATAL, ERROR, WARN, INFO, DEBUG
  "severity": "{{ kea_logging_severity }}",

  // If DEBUG level is specified, this value is used. 0 is least verbose,
  // 99 is most verbose. Be cautious, Kea can generate lots and lots
  // of logs if told to do so.
  "debuglevel": {{ kea_logging_debug_level }}
