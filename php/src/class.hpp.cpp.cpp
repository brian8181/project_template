/*
 * @brief create class skeleton
 * @file ccsk.cpp
 * @date Fri Sep 19 08:08:55 CDT 2025
 * @version 0.0.1
 */

#include <iostream>
#include <fstream>
#include <string>
#include <cstring>

const std::string VERSION = "0.0.1";
const std::string INFO = "auto generated with ccsk, create class skeleton";

void generateHeaderFile(const std::string &name, const std::string &baseName);
void generateImplementationFile(const std::string &name, const std::string &baseName);
void generateFileHeader(std::ofstream &file, const std::string &filename);

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        std::cerr << "Usage: " << argv[0] << " <CLASS_NAME> [BASE_CLASS_NAME]" << std::endl;
        return 1;
    }

    std::string name = argv[1];
    std::string baseName = (argc >= 3) ? argv[2] : "";

    // Generate header file
    generateHeaderFile(name, baseName);

    // Generate implementation file
    generateImplementationFile(name, baseName);

    std::cout << "Class skeleton for '" << name << "' generated successfully!" << std::endl;
    if (!baseName.empty())
    {
        std::cout << "Base class: " << baseName << std::endl;
    }

    return 0;
}

void generateHeaderFile(const std::string &name, const std::string &baseName)
{
    std::string headerFilename = name + ".hpp";
    std::ofstream headerFile(headerFilename);

    generateFileHeader(headerFile, headerFilename);

    std::string guardName = name;
    for (char &c : guardName)
    {
        c = std::toupper(c);
    }

    headerFile << "#ifndef _" << guardName << "_HPP_\n";
    headerFile << "#define _" << guardName << "_HPP_\n";
    headerFile << "#include <iostream>\n";

    if (!baseName.empty())
    {
        headerFile << "#include \"" << baseName << ".hpp\"\n";
    }

    headerFile << "\n";
    headerFile << "/**\n";
    headerFile << "  * @brief class " << name << "\n";
    headerFile << "  */\n";
    headerFile << "class " << name;

    if (!baseName.empty())
    {
        headerFile << " : public " << baseName;
    }

    headerFile << "\n";
    headerFile << "{\n";
    headerFile << "public:\n";
    headerFile << "\t/**\n";
    headerFile << "     * @brief : default ctor\n";
    headerFile << "     */\n";
    headerFile << "\t" << name << "();\n";
    headerFile << "\n";
    headerFile << "\t/**\n";
    headerFile << "     * @brief : copy ctor\n";
    headerFile << "     */\n";
    headerFile << "\t" << name << "( const " << name << "& src );\n";
    headerFile << "\n";
    headerFile << "  \t/**\n";
    headerFile << "   \t * @brief : destructor\n";
    headerFile << "   \t */\n";
    headerFile << "\tvirtual ~" << name << "();\n";
    headerFile << "\n";
    headerFile << "\t/**\n";
    headerFile << "\t  * @brief \n";
    headerFile << "\t  * @brief c++ comment ...\n";
    headerFile << "\t  * @brief place future additions here ...\n";
    headerFile << "\t  *\n";
    headerFile << "\t*/\n";
    headerFile << "\n";
    headerFile << "private:\n";
    headerFile << "\n";
    headerFile << "};\n";
    headerFile << "\n";
    headerFile << "#endif\n";

    headerFile.close();
}

void generateImplementationFile(const std::string &name, const std::string &baseName)
{
    std::string implFilename = name + ".cpp";
    std::ofstream implFile(implFilename);

    generateFileHeader(implFile, implFilename);

    implFile << "#include \"" << name << ".hpp\"\n";
    implFile << "\n";
    implFile << "/**\n";
    implFile << " * @brief : default constructor\n";
    implFile << " */\n";
    implFile << name << "::" << name << "()\n";
    if (!baseName.empty())
    {
        implFile << "    : " << baseName << "()\n";
    }
    implFile << "{\n";
    implFile << "    // Implementation\n";
    implFile << "}\n";
    implFile << "\n";
    implFile << "/**\n";
    implFile << " * @brief : copy constructor\n";
    implFile << " */\n";
    implFile << name << "::" << name << "(const " << name << "& src)\n";
    if (!baseName.empty())
    {
        implFile << "    : " << baseName << "(src)\n";
    }
    implFile << "{\n";
    implFile << "    // Copy implementation\n";
    implFile << "}\n";
    implFile << "\n";
    implFile << "/**\n";
    implFile << " * @brief : destructor\n";
    implFile << " */\n";
    implFile << name << "::~" << name << "()\n";
    implFile << "{\n";
    implFile << "    // Cleanup implementation\n";
    implFile << "}\n";

    implFile.close();
}

void generateFileHeader(std::ofstream &file, const std::string &filename)
{
    file << "/*\n";
    file << " * @brief auto generated class\n";
    file << " * @file " << filename << "\n";
    file << " * @date Fri Sep 19 08:08:55 CDT 2025\n";
    file << " * @version " << VERSION << "\n";
    file << " * @note " << INFO << "\n";
    file << " */\n";
    file << "\n";
}
