// ccsk.cpp
// Converted from the original PHP generator to C++
// This program generates a simple C++ class skeleton to stdout.
// Usage: ./ccsk MyClass
//
// Behavior:
// - Reads optional file "cstyle_file_header.php" from the current directory and prints it (with some basic substitutions).
// - Prints:
//     #include "MyClass.hpp"
//
//     /** ... default ctor ... */
//     MyClass::MyClass() { ... }
//     etc.
//
// Produced to mirror the original PHP script behavior as reasonably as possible.

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>

static void replaceAll(std::string &s, const std::string &from, const std::string &to) {
    if (from.empty()) return;
    size_t start = 0;
    while ((start = s.find(from, start)) != std::string::npos) {
        s.replace(start, from.length(), to);
        start += to.length();
    }
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: " << (argc > 0 ? argv[0] : "ccsk") << " <ClassName>\n";
        return 1;
    }

    std::string NAME = argv[1];
    const std::string VERSION = "0.0.1";
    const std::string INFO = "auto generated with ccsk, create class skeleton";

    // Attempt to read and print cstyle_file_header.php if present.
    // We perform a few simple textual substitutions so the included header
    // can reference $NAME, $VERSION, and $INFO in a straightforward way.
    const std::string headerFilename = "cstyle_file_header.php";
    std::ifstream headerFile(headerFilename.c_str());
    if (headerFile) {
        std::ostringstream ss;
        ss << headerFile.rdbuf();
        std::string headerContent = ss.str();

        // Basic cleanup/substitution so common PHP-style placeholders are handled:
        // Remove PHP tags to try to approximate what the original PHP include would output.
        replaceAll(headerContent, "<?php", "");
        replaceAll(headerContent, "?>", "");

        // Replace some common echo patterns and direct variable occurrences.
        // These replacements are simple textual substitutions to emulate the
        // expected outcome of including the PHP header file in the original script.
        replaceAll(headerContent, "<?php echo \"$NAME\"; ?>", NAME);
        replaceAll(headerContent, "<?php echo '$NAME'; ?>", NAME);
        replaceAll(headerContent, "<?php echo $NAME; ?>", NAME);
        replaceAll(headerContent, "$NAME", NAME);

        replaceAll(headerContent, "<?php echo \"$VERSION\"; ?>", VERSION);
        replaceAll(headerContent, "<?php echo '$VERSION'; ?>", VERSION);
        replaceAll(headerContent, "<?php echo $VERSION; ?>", VERSION);
        replaceAll(headerContent, "$VERSION", VERSION);

        replaceAll(headerContent, "<?php echo \"$INFO\"; ?>", INFO);
        replaceAll(headerContent, "<?php echo '$INFO'; ?>", INFO);
        replaceAll(headerContent, "<?php echo $INFO; ?>", INFO);
        replaceAll(headerContent, "$INFO", INFO);

        // Print header content as-is after substitutions.
        std::cout << headerContent;
        // Ensure header ends with a newline for tidy output.
        if (headerContent.empty() || headerContent.back() != '\n') {
            std::cout << '\n';
        }
    }

    // Now print the generated class skeleton, exactly matching the original PHP output style.
    std::cout << "#include \"" << NAME << ".hpp\"\n\n";

    std::cout << "/**\n";
    std::cout << " * @brief : default ctor\n";
    std::cout << " */\n";
    std::cout << NAME << "::" << NAME << "()\n";
    std::cout << "{\n\n";
    std::cout << "}\n\n";

    std::cout << "/**\n";
    std::cout << "  * @brief : copy ctor\n";
    std::cout << "  */\n";
    std::cout << NAME << "::" << NAME << "( const " << NAME << "& src )\n";
    std::cout << "{\n\n";
    std::cout << "}\n\n";

    std::cout << "/**\n";
    std::cout << "  * @brief : destructor\n";
    std::cout << "  */\n";
    std::cout << NAME << "::~" << NAME << "()\n";
    std::cout << "{\n\n";
    std::cout << "}\n";

    return 0;
}
