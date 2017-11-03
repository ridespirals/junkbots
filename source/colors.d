module colors;
import dsfml.graphics;

// Tomorrow 
// eighties
struct Colors {
    Color Background;
    Color CurrentLine;
    Color Selection;
    Color Foreground;
    Color Commment;

    Color Red;
    Color Orange;
    Color Yellow;
    Color Green;
    Color Aqua;
    Color Blue;
    Color Purple;
}
auto Tomorrow = Colors(
    Color(0xff, 0xff, 0xff),
    Color(0xef, 0xef, 0xef),
    Color(0xd6, 0xd6, 0xd6),
    Color(0x4d, 0x4d, 0x4c),
    Color(0x8e, 0x90, 0x8c),
    Color(0xc8, 0x28, 0x29),
    Color(0xf5, 0x87, 0x1f),
    Color(0xea, 0xb7, 0x00),
    Color(0x3e, 0x99, 0x9f),
    Color(0x42, 0x71, 0xae),
    Color(0x89, 0x59, 0xa8)
);

// base16 schemes
/* 3024 */
struct Base16 {
    Color Base00;
    Color Base09;
}
auto ThirtyTwentyFour = Base16(Color(0x09, 0x03, 0x00), Color(0xe9, 0xbb, 0xd0));
    // const Color Base01 = Color(0x3a, 0x34, 0x32);
    // const Color Base02 = Color(0x09, 0x03, 0x00);
    // const Color Base03 = Color(0x09, 0x03, 0x00);
    // const Color Base04 = Color(0x09, 0x03, 0x00);
    // const Color Base05 = Color(0x09, 0x03, 0x00);
    // const Color Base06 = Color(0x09, 0x03, 0x00);
    // const Color Base07 = Color(0x09, 0x03, 0x00);
    // const Color Base08 = Color(0x09, 0x03, 0x00);
    // const Color Base09 = Color(0xe9, 0xbb, 0xd0);
    // const Color Base10 = Color(0x09, 0x03, 0x00);
    // const Color Base11 = Color(0x09, 0x03, 0x00);
    // const Color Base12 = Color(0x09, 0x03, 0x00);
    // const Color Base13 = Color(0x09, 0x03, 0x00);
    // const Color Base14 = Color(0x09, 0x03, 0x00);
    // const Color Base15 = Color(0x09, 0x03, 0x00);
// };

// enum Color Base163024 = {
//     Base00 = Color(0x09, 0x03, 0x00),\
// };

// {
//   "base00": "#090300",
//   "base01": "#3a3432",
//   "base02": "#4a4543",
//   "base03": "#5c5855",
//   "base04": "#807d7c",
//   "base05": "#a5a2a2",
//   "base06": "#d6d5d4",
//   "base07": "#f7f7f7",
//   "base08": "#db2d20",
//   "base09": "#e8bbd0",
//   "base0A": "#fded02",
//   "base0B": "#01a252",
//   "base0C": "#b5e4f4",
//   "base0D": "#01a0e4",
//   "base0E": "#a16a94",
//   "base0F": "#cdab53"
// }

/* ashes */
// {
//   "base00": "#1C2023",
//   "base01": "#393F45",
//   "base02": "#565E65",
//   "base03": "#747C84",
//   "base04": "#ADB3BA",
//   "base05": "#C7CCD1",
//   "base06": "#DFE2E5",
//   "base07": "#F3F4F5",
//   "base08": "#C7AE95",
//   "base09": "#C7C795",
//   "base0A": "#AEC795",
//   "base0B": "#95C7AE",
//   "base0C": "#95AEC7",
//   "base0D": "#AE95C7",
//   "base0E": "#C795AE",
//   "base0F": "#C79595"
// }