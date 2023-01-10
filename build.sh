#!bin/bash/sh
aria2c -i resources
echo *.txt* | xargs cat > merge-file
aria2c https://github.com/bromite/bromite/releases/latest/download/ruleset_converter
chmod +x ruleset_converter
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=merge-file \
                    --output_file=filters.dat
