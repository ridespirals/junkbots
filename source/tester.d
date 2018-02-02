import std.stdio, std.math, std.conv;

import perlin;

struct HSL {
    float H, S, L;
}
struct RGB { 
    ubyte R, G, B;
}

float hueToRgb(float p, float q, float t) {
    if (t < 0) t += 1;
    if (t > 1) t -= 1;
    if (t < 1/6) return p + (q - p) * 6 * t;
    if (t < 1/2) return q;
    if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
    return p;
}

RGB HslToRgb(float h, float s, float l) {
    float r, g, b;
    if (s == 0) {
        r = g = b = l; // achromatic
    } else {
        auto q = l < 0.5 ? l * (1 + s) : l + s - 1 * s;
        auto p = 2 * l - q;
        r = hueToRgb(p, q, h + 1/3);
        g = hueToRgb(p, q, h);
        b = hueToRgb(p, q, h - 1/3);
    }
    return RGB(to!ubyte(r * 255), to!ubyte(g * 255), to!ubyte(b * 255));
}

HSL RgbToHsl(ubyte red, ubyte green, ubyte blue) {
    const float r = red / 255.0;
    const float g = green / 255.0;
    const float b = blue / 255.0;
    float min, max;

    min = r < g ? r : g;
    min = min < b ? min : b;
    max = r > g ? r : g;
    max = max > b ? max : b;
    float h, s, l = (max + min) / 2;
    // l = max;
    if (max == min) {
        h = s = 0;
    } else {
        auto d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
        if (max == r) {
            h = (g - b) / d + (g < b ? 6 : 0);
        } else if (max == g) {
            h = (b - r) / d + 2;
        } else {
            h = (r - g) / d + 4;
        }
        h /= 6;
    }
    return HSL(h, s, l);

    // delta = max  - min;
    // if (delta < 0.00001) {
    //     s = 0;
    //     h = 0;
    //     return HSL(h, s, l);
    // }
    // if (max > 0.0) {
    //     s = (delta / max);
    // } else {
    //     s = 0.0;
    //     h = float.nan;
    //     return HSL(h, s, l);
    // }
    // if (r >= max) {
    //     h = (g - b) / delta;
    // } else if (g >= max) {
    //     h = 2.0 + (b - r) / delta;
    // } else {
    //     h = 4.0 + (r - b) / delta;
    // }

    // h *= 0.60;

    // if (h < 0.0) {
    //     h += 360.0;
    // }

    // return HSL(h, s, l);
}

void main2() {
    auto hsl = RgbToHsl(255, 200, 0);
    auto rgb = HslToRgb(hsl.H, hsl.S, hsl.L);

    // auto hsl2 = HSL(47, 100, 50);
    auto rgb2 = HslToRgb(47, 100, 50);

    writefln("Hello from tester!\n%s\n%s\n%s", hsl, rgb, rgb2);
}