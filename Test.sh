#!/bin/bash
mkdir ruleset_converter
cd ruleset_converter
wget https://filters.adtidy.org/android/filters/2_optimized.txt
     https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_14_Annoyances/filter.txt
     https://filters.adtidy.org/android/filters/17_optimized.txt
     https://github.com/luxysiv/filters/raw/main/abpvn-ext.txt
     https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_3_Spyware/filter.txt
     https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_4_Social/filter.txt
     https://github.com/bromite/bromite/releases/latest/download/ruleset_converter
chmod +x ruleset_converter
./ruleset_converter --input_format=filter-list \
                    --output_format=unindexed-ruleset \
                    --input_files=adguard.txt,annoyances.txt,tracking.txt,abpvn-ext.txt,spyware.txt,social_filters.txt \
                    --output_file=filters.dat
