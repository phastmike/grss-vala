all:
	gcc -o async-fetcher-original async-fetcher-original.c `pkg-config --cflags --libs libgrss`
	valac async-fetcher.vala --pkg Grss --pkg glib-2.0 --pkg libsoup-2.4 --pkg libxml-2.0 -X -lgrss
