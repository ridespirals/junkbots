module main;
import std.string, std.math;

import dsfml.graphics;
import dsfml.system;

import constants;
import HSL;
import perlin;
import colors;

/+
dmd source\app.d -I%DSFML%\src\ -L+%DSFMLC%\lib\ -L+%DSFML%\lib\ dsfml-graphics.lib dsfml-window.lib dsfml-system.lib dsfmlc-graphics.lib dsfmlc-window.lib dsfmlc-system.lib


"lflags" : ["+%DSFMLC%\\lib\\", "+%DSFML%\\lib\\"],
+/
Font interfaceFont;
Colors colorScheme;

void main(string[] args) {
	auto window = new RenderWindow(VideoMode(WIDTH, HEIGHT), "junkbots :: dsfml");
	auto clock = new Clock();
	interfaceFont = new Font();
	colorScheme = Tomorrow;
	if (!interfaceFont.loadFromFile("FiraSans-Regular.ttf")) {
		// error...
		assert(false);
	}

	while (window.isOpen()) {
		Event event;
		auto elapsed = clock.restart();
		auto dt = cast(float)elapsed.total!"msecs";

		while (window.pollEvent(event)) {
			if (event.type == event.EventType.Closed) {
				window.close();
			}
			if (event.type == event.EventType.KeyReleased) {
				auto key = event.key.code;
				if (key == Keyboard.Key.Escape) {
					window.close();
				}
			}
		}

		window.clear(colorScheme.Background);

		drawMandelbrot(window, dt);

		window.display();
	}
}

const int _scale = 10;

float _totalTime = 0;

void drawMandelbrot(RenderWindow window, float dt) {
	import std.stdio;
	
	_totalTime += dt;
	//if (_totalTime > 1000) _totalTime = 0;

	auto cols = WIDTH / _scale;

	for (auto x = 0; x < cols; x++) {
		auto q = new RectangleShape(Vector2f(_scale, HEIGHT));
		ubyte c = cast(ubyte)(map(sin(_totalTime), -1, 1, 0, 255));
		writefln("Current color: %s", c);
		q.fillColor = colorScheme.Background;
		q.position = Vector2f(x * _scale, 0);
		window.draw(q);
		// for (y = 0; y < window.height; y++) {
		//
		// }
	}

	auto text = new Text();
	text.setFont(interfaceFont);
	text.setString(format!"Current time: %s\nTotal time: %s\nsin=%s"(dt, _totalTime, sin(_totalTime) * TWO_PI));
	text.setCharacterSize(18);
	text.setColor(colorScheme.Foreground);
	// text.setColor(Color(0xc8, 0x28, 0x29));
	// text.setPosition(100, 100);
	window.draw(text);
}

T map(T)(T n, T start1, T stop1, T start2, T stop2) {
	return ((n - start1) / (stop1 - start1)) * (stop2 - start2) + start2;
}
