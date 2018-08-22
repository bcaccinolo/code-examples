
content = <<TEMP
---
case:
  case_reference: "the internal reference"
  comment: "Client comment"
  person_in_charge: "client contact"
  po_number: "Client invoice ref"
  project_name: "Client project name"
  chains:
    -
      changes:
        -
          from: from
          to: to
          type_id: "type id"
      id: 12
      target_jurisdictions: "[patent] List of jurisdictions"
      target_portfolio:
        -
          - fr
          - 12
          - 23
          - 42
      target_publication_number: "[patent] patent number"
      target_type: "patent | portfolio"

TEMP

puts content

require 'yaml'
# Parse a YAML string
YAML.load(content)











