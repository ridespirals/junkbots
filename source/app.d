module main;

import dsfml.graphics;
import dsfml.system;

/+
dmd source\app.d -I%DSFML%\src\ -L+%DSFMLC%\lib\ -L+%DSFML%\lib\ dsfml-graphics.lib dsfml-window.lib dsfml-system.lib dsfmlc-graphics.lib dsfmlc-window.lib dsfmlc-system.lib


"lflags" : ["+%DSFMLC%\\lib\\", "+%DSFML%\\lib\\"],
+/

void main(string[] args) {
	auto window = new RenderWindow(VideoMode(WIDTH, HEIGHT), "junkbots :: dsfml");
	auto clock = new Clock();

	while (window.isOpen()) {
		Event event;
		auto elapsed = clock.restart();

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

		window.clear();

		drawMandelbrot(window, elapsed);

		window.display();
	}
}

const int WIDTH = 1200;
const int HEIGHT = 675;
const int _scale = 10;

int _totalTime = 0;

void drawMandelbrot(RenderWindow window, Duration elapsed) {
	_totalTime += elapsed.total!"msecs";

	auto cols = WIDTH / _scale;

	for (auto x = 0; x < cols; x++) {
		auto q = new RectangleShape(Vector2f(_scale, HEIGHT));
		ubyte c = cast(ubyte)(elapsed.total!"msecs" % 255L);
		q.fillColor = Color(c, c, c);
		q.position = Vector2f(x * _scale, 0);
		window.draw(q);
		// for (y = 0; y < window.height; y++) {
		//
		// }
	}
}
