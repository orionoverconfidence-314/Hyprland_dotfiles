#include <fstream>
#include <iostream>
#include <string>
#include <array>
#include "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/wallpaper.h"  // Import file_1 contents

int main() {
    // Read the wallpaper_url from file_1.h
    const std::string url = wallcpp();

    // Path to the output CSS file
    const std::string css_path = "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/wallpaper_theme.css";

    // Open the CSS file for writing (truncates existing)
    std::ofstream css(css_path);
    if (!css) {
        std::cerr << "Error: Cannot open " << css_path << " for writing\n";
        return 1;
    }
    std::array<std::string,16> all_wall = {
        "/home/orion_siva/Pictures/wallpaper/anime1.jpg",
        "/home/orion_siva/Pictures/wallpaper/651486.png",
        "/home/orion_siva/Pictures/wallpaper/anime2.png",
        "/home/orion_siva/Pictures/wallpaper/anime3.jpg",
        "/home/orion_siva/Pictures/wallpaper/bloom__by_emah11_djfjbjc-fullview.jpg",
        "/home/orion_siva/Pictures/wallpaper/chess1.png",
        "/home/orion_siva/Pictures/wallpaper/chess2.png",
        "/home/orion_siva/Pictures/wallpaper/gym1.png",
        "/home/orion_siva/Pictures/wallpaper/hulk1.png",
        "/home/orion_siva/Pictures/wallpaper/Interstellar_blackhole_wall.jpg",
        "/home/orion_siva/Pictures/wallpaper/ORIMrxL.jpg",
        "/home/orion_siva/Pictures/wallpaper/spacw1.jpg",
        "/home/orion_siva/Pictures/wallpaper/spider1.png",
        "/home/orion_siva/Pictures/wallpaper/spider3.png",
        "/home/orion_siva/Pictures/wallpaper/spider4.png",
        "/home/orion_siva/Pictures/wallpaper/spider2.png"};
    
    // std::array<std::string,16> workspaces                   = {"black",             "white",             "purple",           "black",   "black",  "white","white","white",    "#1f0040",  "white",              "white",          "#483D8B",  "red",  "black","black",    "darkred"};
    // std::array<std::string,16> workspaces_button            = {"black",             "white",             "purple",           "#bd009d", "black",    "white","white","white",    "black",    "white",              "white",          "white",    "red",  "red",  "red",      "red"};
    // std::array<std::string,16> workspaces_button_back       = {"white",             "black",             "white",            "white",   "white",    "black","black","black",    "green",    "black",              "black",          "black",    "black","white","white",    "midnightblue"};
    // std::array<std::string,16> workspaces_buton_hover_back  = {"#c9c9c9",           "#c9c9c9",           "rgb(186, 85, 211)","purple",  "black",    "gray", "gray", "darkgray", "black",    "#c9c9c9",            "lightgray",      "#0000FF",  "white","red",  "lightblue","red"};
    // std::array<std::string,16> workspaces_buton_hover       = {"black",             "black",             "white",            "white",   "white",    "black","black","black",    "black",    "black",              "black",          "black",    "black","white","black",    "blue"};
    // std::array<std::string,16> color_list_left              = {"white",             "black",             "purple",           "#bd009d", "black",    "black","white","black",    "black",    "black",              "black",          "white",    "red",  "red",  "red",      "red"};
    // std::array<std::string,16> color_list_right             = {"black",             "white",             "purple",           "#bd009d", "black",    "black","black","black",    "black",    "white",              "black",          "white",    "red",  "red",  "#ff20ff",  "red"};
    // std::array<std::string,16> keyboard_locked              = {"gray",              "rgba(0, 0, 0, 0.2)","white",            "black",   "gold",     "gray", "gray", "gray",     "black",    "rgba(0, 0, 0, 0.2)", "rgba(0,0,0,0.2)","#0000FF",  "white","red",  "lightblue","blue"};
    // std::array<std::string,16> status_hover_back            = {"rgba(0, 0, 0, 0.2)","black",             "white",            "white",   "black",    "gray", "white","gray",     "black",    "black",              "black",          "white",    "white","red",  "lightblue","blue"};
    // std::array<std::string,16> color_list_left_back         = {"black",             "white",             "white",            "white",   "white",    "white","black","white",    "green",    "white",              "white",          "#483D8B",  "black","white","black",    "midnightblue"};
    // std::array<std::string,16> color_list_right_back        = {"white",             "black",             "white",            "white",   "white",    "white","white","white",    "green",    "black",              "white",          "#483D8B",  "black","white","white",    "midnightblue"};
    // std::array<std::string,16> list_border_left             = {"black",             "white",             "purple",           "black",   "white",  "white","black","black",    "#1f0040",  "white",              "white",          "#00008B",  "red",  "black","red",      "darkred"};
    // std::array<std::string,16> list_border_right            = {"white",             "black",             "purple",           "black",   "white",  "white","white","black",    "#1f0040",  "black",              "white",          "#00008B",  "red",  "black","black",    "darkred"};
    std::array<std::string, 16>  workspaces                     = { "black",                 "white",                 "purple",                "black",                 "black",                 "white",                 "white",                 "white",                 "#1f0040",             "white",                 "white",                 "#483D8B",            "red",                   "black",                 "black",                 "darkred"             };
    std::array<std::string, 16>  workspaces_button              = { "black",                 "white",                 "purple",                "#bd009d",             "black",                 "white",                 "white",                 "white",                 "black",                 "white",                 "white",                 "white",                "red",                   "red",                   "red",                   "red"                 };
    std::array<std::string, 16>  workspaces_button_back         = { "white",                 "black",                 "white",                 "white",                 "white",                 "black",                 "black",                 "black",                 "green",                 "black",                 "black",                 "black",                "black",                 "white",                 "white",                 "midnightblue"        };
    std::array<std::string, 16>  workspaces_buton_hover_back    = { "#c9c9c9",             "#c9c9c9",             "rgb(186, 85, 211)",   "purple",                "black",                 "gray",                  "gray",                  "darkgray",              "black",                 "#c9c9c9",             "lightgray",             "#0000FF",            "white",                 "red",                   "lightblue",             "red"                 };
    std::array<std::string, 16>  workspaces_buton_hover         = { "black",                 "black",                 "white",                 "white",                 "white",                 "black",                 "black",                 "black",                 "black",                 "black",                 "black",                 "black",                "black",                 "white",                 "black",                 "blue"                };
    std::array<std::string, 16>  color_list_left                = { "white",                 "black",                 "purple",                "#bd009d",             "black",                 "black",                 "white",                 "black",                 "black",                 "black",                 "black",                 "white",                "red",                   "red",                   "red",                   "red"                 };
    std::array<std::string, 16>  color_list_right               = { "black",                 "white",                 "purple",                "#bd009d",             "black",                 "black",                 "black",                 "black",                 "black",                 "white",                 "black",                 "white",                "red",                   "red",                   "#ff20ff",             "red"                 };
    std::array<std::string, 16>  keyboard_locked                = { "gray",                  "rgba(0, 0, 0, 0.2)",  "white",                 "black",                 "gold",                  "gray",                  "gray",                  "gray",                  "black",                 "rgba(0, 0, 0, 0.2)",  "rgba(0,0,0,0.2)",     "#0000FF",            "white",                 "red",                   "lightblue",             "blue"                };
    std::array<std::string, 16>  status_hover_back              = { "rgba(0, 0, 0, 0.2)",  "black",                 "white",                 "white",                 "black",                 "gray",                  "white",                 "gray",                  "black",                 "black",                 "black",                 "white",                "white",                 "red",                   "lightblue",             "blue"                };
    std::array<std::string, 16>  color_list_left_back           = { "black",                 "white",                 "white",                 "white",                 "white",                 "white",                 "black",                 "white",                 "green",                 "white",                 "white",                 "#483D8B",            "black",                 "white",                 "black",                 "midnightblue"        };
    std::array<std::string, 16>  color_list_right_back          = { "white",                 "black",                 "white",                 "white",                 "white",                 "white",                 "white",                 "white",                 "green",                 "black",                 "white",                 "#483D8B",            "black",                 "white",                 "white",                 "midnightblue"        };
    std::array<std::string, 16>  list_border_left               = { "black",                 "white",                 "purple",                "black",                 "white",                 "white",                 "black",                 "black",                 "#1f0040",             "white",                 "white",                 "#00008B",            "red",                   "black",                 "red",                   "darkred"             };
    std::array<std::string, 16>  list_border_right              = { "white",                 "black",                 "purple",                "black",                 "white",                 "white",                 "white",                 "black",                 "#1f0040",             "black",                 "white",                 "#00008B",            "red",                   "black",                 "black",                 "darkred"             };


    for (int i = 0; i <= 15; i++ )
    {
        if (url == all_wall[i])
        {
            css << "@define-color workspaces "                  << workspaces[i] << ";" << std::endl;
            css << "@define-color workspaces_button "           << workspaces_button[i] << ";" << std::endl;
            css << "@define-color workspaces_button_back "      << workspaces_button_back [i] << ";" << std::endl;
            css << "@define-color workspaces_buton_hover_back " << workspaces_buton_hover_back[i] << ";" << std::endl;
            css << "@define-color workspaces_buton_hover "      << workspaces_buton_hover[i] << ";" << std::endl;
            css << "@define-color color_list_left "             << color_list_left[i] << ";" << std::endl;
            css << "@define-color color_list_right "            << color_list_right[i] << ";" << std::endl;
            css << "@define-color keyboard_locked "             << keyboard_locked[i] << ";" << std::endl;
            css << "@define-color status_hover_back "           << status_hover_back[i] << ";" << std::endl;
            css << "@define-color color_list_left_back  "       << color_list_left_back [i] << ";" << std::endl;
            css << "@define-color color_list_right_back "       << color_list_right_back[i] << ";" << std::endl;
            css << "@define-color list_border_left "            << list_border_left[i] << ";" << std::endl;
            css << "@define-color list_border_right "           << list_border_right[i] << ";" << std::endl;

        }
    }

    
    css.close();
    std::cout << "Generated " << css_path << " for wallpaper: " << url << std::endl;
    return 0;
}

