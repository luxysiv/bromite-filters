import os
import subprocess
from libs import requests

RESOURCES = {
    'abpvn.txt': 'https://raw.githubusercontent.com/abpvn/abpvn/master/filter/abpvn.txt',
    'easylist.txt': 'https://easylist.to/easylist/easylist.txt',
    'annoyance.txt': 'https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt',
    'my-rules.txt': 'https://manhduonghn.github.io/custom-filters/my-rules.txt',
    'adguard.txt': 'https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/BaseFilter/sections/adservers.txt'
}
MERGED_FILE = "merged.txt"
OUTPUT_FILE = "filters.dat"

def download_resources():
    for filename, url in RESOURCES.items():
        response = requests.get(url)
        with open(filename, 'wb') as file:
            file.write(response.content)

def merge_files():
    with open(MERGED_FILE, 'w') as merged_file:
        for filename in RESOURCES:
            with open(filename, 'r') as file:
                for line in file:
                    if not line.strip().startswith(("[", "!")):
                        merged_file.write(line)
                        
    lines = open(MERGED_FILE, 'r').readlines()
    lines = sorted(set(lines))
    with open(MERGED_FILE, 'w') as merged_file:
        merged_file.writelines(lines)

def convert_filters():
    subprocess.run(["chmod", "+x", "ruleset_converter"])
    subprocess.run(["./ruleset_converter", 
                    "--input_format=filter-list", 
                    "--output_format=unindexed-ruleset",
                    "--input_files=" + MERGED_FILE, 
                    "--output_file=" + OUTPUT_FILE])

def cleanup():
    for filename in RESOURCES.keys():
        os.remove(filename)
    os.remove(MERGED_FILE)

download_resources()
merge_files()
convert_filters()
cleanup()

os.system(f'git config --global user.email "${{GITHUB_ACTOR_ID}}+${{GITHUB_ACTOR}}@users.noreply.github.com"')
os.system(f'git config --global user.name "$(gh api /users/${{GITHUB_ACTOR}} | jq .name -r)"')
os.system('git add filters.dat || error "Failed to add the filters bromite to repo"')
os.system('git commit -m "Update filters " --author=.')
os.system('git push origin main || error "Failed to push the filters bromite to repo"')
