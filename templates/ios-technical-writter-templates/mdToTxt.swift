import Foundation

let fileManager = FileManager.default
let markdownDir = "markdown"
let textDir = "text"
let outputFile = "templates.txt"

do {
    // Create text directory if it doesn't exist
    if !fileManager.fileExists(atPath: textDir) {
        try fileManager.createDirectory(atPath: textDir, withIntermediateDirectories: true)
    }

    // Clear the output file
    try "".write(toFile: outputFile, atomically: true, encoding: .utf8)

    // Process each .md file
    let markdownFiles = try fileManager.contentsOfDirectory(atPath: markdownDir)
    for mdFile in markdownFiles where mdFile.hasSuffix(".md") {
        let filename = (mdFile as NSString).deletingPathExtension
        let txtFilename = "\(filename).md.txt"
        let txtFilePath = "\(textDir)/\(txtFilename)"

        // Read the content of the markdown file
        let content = try String(contentsOfFile: "\(markdownDir)/\(mdFile)")

        // Write the content to the .txt file in the text directory
        try content.write(toFile: txtFilePath, atomically: true, encoding: .utf8)

        // Append to the templates.txt file
        if let fileHandle = FileHandle(forWritingAtPath: outputFile) {
            fileHandle.seekToEndOfFile()
            if let data = "# \(filename.capitalized) (from \(filename).md)\n\(content)\n\n".data(using: .utf8) {
                fileHandle.write(data)
            }
            fileHandle.closeFile()
        }
    }

    print("Processing complete. Files saved in \(textDir) and templates.txt created.")

} catch {
    print("An error occurred: \(error)")
}
