wget -i resources
chmod +x ruleset_converter filters.txt
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=2_optimized.txt,14_optimized.txt,17_optimized.txt,abpvn-ext.txt,3_optimized.txt,4_optimized.txt \
                    --output_file=filters.dat
