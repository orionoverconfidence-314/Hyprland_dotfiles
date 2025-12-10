#include <fstream>
#include <iostream>
#include <string>
#include <array>
#include "/home/orion_siva/.config/rofi/scripts/wallpaper_rofi.h"  // Import file_1 contents

int main() {
    // Read the wallpaper_url from file_1.h
    const std::string url = wallroficpp();

    // Path to the output CSS file
    const std::string rasi_path = "/home/orion_siva/.config/rofi/wallpaper-theme.rasi";


    std::array<std::string,4> black_wall = {
        "/home/orion_siva/Pictures/wallpaper/anime1.jpg",
        "/home/orion_siva/Pictures/wallpaper/anime2.png",
        "/home/orion_siva/Pictures/wallpaper/anime3.jpg",
        "/home/orion_siva/Pictures/wallpaper/spider3.png"};

    std::array<std::string,5> white_wall = {
        "/home/orion_siva/Pictures/wallpaper/Interstellar_blackhole_wall.jpg",
        "/home/orion_siva/Pictures/wallpaper/651486.png",
        "/home/orion_siva/Pictures/wallpaper/chess1.png",
        "/home/orion_siva/Pictures/wallpaper/spider1.png",
        "/home/orion_siva/Pictures/wallpaper/ORIMrxL.jpg"
    };

    //for wallpaper with selected = black, mainbox = tranparent , search = black;
    std::array<std::string,7> con1 = {
        "/home/orion_siva/Pictures/wallpaper/bloom__by_emah11_djfjbjc-fullview.jpg",
        "/home/orion_siva/Pictures/wallpaper/chess2.png",
        "/home/orion_siva/Pictures/wallpaper/gym1.png",
        "/home/orion_siva/Pictures/wallpaper/spacw1.jpg",
        "/home/orion_siva/Pictures/wallpaper/hulk1.png",
        "/home/orion_siva/Pictures/wallpaper/spider4.png",
        "/home/orion_siva/Pictures/wallpaper/spider2.png"

    };

    // Open the CSS file for writing (truncates existing)
    std::ofstream ofs(rasi_path, std::ios::out);
    if (!ofs) {
        return 1;
    };
    


    for (int i = 0; i <= 3; i++ )
    {
        if (url == black_wall[i])
        {
            ofs << "window {\n"
                   "    background-image: url(\""
                << black_wall[i]
                << "\");\n"
                   "}\n"
                   "*{\n"
                   "    textcolor: white\n;"
                   "    inputback: black/30%;\n"
                   "    listback: black/30%;\n"
                   "    select: white/30%;\n"
                   "}";
            ofs.close();
        };
    };
    for (int i = 0; i <= 4; i++ )
    {
        if (url ==white_wall[i])
        {
            ofs <<  "window {\n"
                    "    background-image: url(\""
                <<  white_wall[i]
                <<  "\");\n"
                    "}\n"
                    "*{\n"
                    "    textcolor: black;\n"
                    "    inputback: white/30%;\n"
                    "    listback: white/30%;\n"
                    "    select: black/30%;\n"
                    "}";
        ofs.close();
        };
    };
    for (int i = 0; i <= 6; i++ )
    {
        if (url ==  con1[i])
        {
            ofs <<  "window {\n"
                    "    background-image: url(\""
                <<  con1[i]
                <<  "\");\n"
                    "}\n"
                    "*{\n"
                    "    textcolor: white;\n"
                    "    inputback: black/30%;\n"
                    "    listback: transparent;\n"
                    "    select: black/30%;\n"
                    "}";
        ofs.close();
        };
    };

        std::cout << "Generated " << rasi_path << " for wallpaper: " << url << std::endl;
    return 0;
}
