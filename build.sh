wget -i filters.txt
chmod +x ruleset_converter filters.txt
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=2_optimized.txt \
                    --output_file=filters.dat
