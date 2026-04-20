#!/usr/bin/env bash

INPUT_DIR="$1"
OUTPUT_DIR="$2"
BASE_NAME="$3"

# 1. Validate inputs
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <input_folder> <output_folder> <base_filename>"
  echo "Example: $0 ./my_notes ./llm_context context_bundle"
  exit 1
fi

if [ ! -d "$INPUT_DIR" ]; then
  echo "Error: Input directory '$INPUT_DIR' does not exist."
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "Processing files from: $INPUT_DIR"
echo "Saving to: $OUTPUT_DIR"

find "$INPUT_DIR" -type f \( -name "*.md" -o -name "*.txt" \) -print0 |
  while IFS= read -r -d '' file; do

    echo "---"
    echo ""

    awk 1 "$file"

    # Print the bottom boundary
    echo ""
    echo "---"
    echo ""

  done | awk -v outdir="$OUTPUT_DIR" -v basename="$BASE_NAME" '
    BEGIN {
      file_num = 1
      line_count = 0
      out_file = outdir "/" basename "-" file_num ".md"
    }
    {
      print $0 > out_file
      line_count++

      if (line_count >= 10000) {
        close(out_file)
        file_num++aw
        line_count = 0
        out_file = outdir "/" basename "-" file_num ".md"
      }
    }
'

echo "Done! Context files have been generated."
