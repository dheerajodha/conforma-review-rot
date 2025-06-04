#!/bin/bash
set -euo pipefail

authors='[
  "Acepresso",
  "cuipinghuo",
  "dheerajodha",
  "joejstuart",
  "lcarva",
  "robnester-rh",
  "simonbaird",
  "zregvart",
  "ec-automation[bot]"
]'

# Assumes data from stdin!
jq --argjson authors "${authors}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/enterprise-contract/")) or
        (.url | contains("/conforma/")) or
        (.url | contains("/update ec/")) or
        (.title | test("enterprise.contract"; "i"))
    )
]'
