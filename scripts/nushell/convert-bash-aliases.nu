
# open .bash_aliases-test | lines |
#     where { |line| not ($line | str starts-with "#") } |
#     each {  |line| 
#         let parts = ($line | split row "=")
#         let alias_name = $parts.0 | split row " "
#
#         if ($alias_name.0 != "") {
#             let name = $alias_name | get 1
#             let alias_command = $parts.1
#
#             alias ($name) = $alias_command
#         }
#     }


open -r ~/.bash_aliases
| lines
| parse -r "^[ \t]*alias (?P<from>[^=]+)=(?P<to>[\"'](?P<quoted>.*?)[\"'])$"
| each {|i| $"alias ($i.from) = do \{ ($i.quoted) \}"}
| prepend "export-env {"
| append "}"
| str join "\n"
| save -rf /tmp/bash_alias_export_to.nu
