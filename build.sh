wget -i resources
chmod +x ruleset_converter filters.txt
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=2_optimized.txt,filter.txt,17_optimized.txt,abpvn-ext.txt,filter.txt.1,filter.txt.2 \
                    --output_file=filters.dat
