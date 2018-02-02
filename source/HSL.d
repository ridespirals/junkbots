module HSL;

import dsfml.graphics;

const double D_EPSILON = 0.00000000000001;

struct HSL {
    double Hue;
    double Saturation;
    double Lightness;

    this(double hue, double saturation, double lightness) {
        Hue = hue;
        Saturation = saturation;
        Lightness = lightness;
    }

    // static Color RGB(double h, double s, double l) {
    //     auto cc = Color(23, 23, 23);
    // }

    // Color ToRGB() {
    //     ubyte r, g, b;
    //     if (Saturation == 0) {
    //         r = g = b = l; // achromatic
    //     } else {
    //         var hue2rgb = 
    //     }
    //     return Color(0, 0, 0);
    // }

private:

}