wget -i filters.txt
chmod +x ruleset_converter filters.txt
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=adguard.txt,annoyances.txt,tracking.txt,abpvn-ext.txt,spyware.txt,social_filters.txt \
                    --output_file=filters.dat
