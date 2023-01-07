aria2c -i resources
cat *.txt > rules.txt
wget https://github.com/bromite/bromite/releases/latest/download/ruleset_converter
chmod +x ruleset_converter filters.txt
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=rules.txt \
                    --output_file=filters.dat
