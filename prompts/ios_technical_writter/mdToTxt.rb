require 'fileutils'

# Directories
markdown_dir = 'markdown'
text_dir = 'text'
output_file = 'templates.txt'

# Create text directory if it doesn't exist
Dir.mkdir(text_dir) unless Dir.exist?(text_dir)

# Clear the output file
File.open(output_file, 'w') {}

# Process each .md file
Dir.glob("#{markdown_dir}/*.md") do |md_file|
  filename = File.basename(md_file, '.md')
  txt_filename = "#{filename}.md.txt"
  txt_file_path = File.join(text_dir, txt_filename)

  # Read the content of the markdown file
  content = File.read(md_file)

  # Write the content to the .txt file in the text directory
  File.write(txt_file_path, content)

  # Append to the templates.txt file
  File.open(output_file, 'a') do |file|
    file.puts "# #{filename.capitalize} (from #{filename}.md)"
    file.puts content
    file.puts "\n"
  end
end

puts "Processing complete. Files saved in #{text_dir} and templates.txt created."
