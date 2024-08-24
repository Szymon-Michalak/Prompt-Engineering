import os
from tqdm import tqdm

# Directories
markdown_dir = 'markdown'
text_dir = 'text'
output_file = 'templates.txt'

# Create text directory if it doesn't exist
os.makedirs(text_dir, exist_ok=True)

# Clear the output file
with open(output_file, 'w') as f:
    pass

# Process each .md file
for md_file in tqdm(os.listdir(markdown_dir)):
    if md_file.endswith('.md'):
        filename = os.path.splitext(md_file)[0]
        txt_filename = f"{filename}.md.txt"
        txt_file_path = os.path.join(text_dir, txt_filename)

        # Read the content of the markdown file
        with open(os.path.join(markdown_dir, md_file), 'r') as f:
            content = f.read()

        # Write the content to the .txt file in the text directory
        with open(txt_file_path, 'w') as f:
            f.write(content)

        # Append to the templates.txt file
        with open(output_file, 'a') as f:
            f.write(f"# {filename.capitalize()} (from {filename}.md)\n")
            f.write(content)
            f.write("\n\n")

print(f"Processing complete. Files saved in {text_dir} and templates.txt created.")
