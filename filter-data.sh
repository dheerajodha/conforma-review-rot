#!/bin/bash
set -euo pipefail

authors='[
  "Acepresso",
  "cuipinghuo",
  "dheerajodha",
  "joejstuart",
  "robnester-rh",
  "simonbaird",
  "st3penta",
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
