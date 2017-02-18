# Using LibGRss on Vala
LibGRss or libgrss is a 'library for easy management of RSS/Atom/Pie feeds.' (from [wiki.gnome.org](https://wiki.gnome.org/Projects/Libgrss)).

I wanted to use this glib library on Vala but there is/was no VAPI file and no reference on Valadoc. 

## Generating VAPI file for libgrss-0.7 (Fedora23-25)
From the Vala documentation, on generating VAPI files, we will need the GObject Introspection file (gir).

Install libgrss-0.7 runtime and devel packages. The GIR (GObject Introspection) will also be installed .

Then, from the console, issue the command:

	  vapigen --pkg glib-2.0 --pkg libsoup-2.4 --library Grss /usr/share/gir-1.0/Grss-0.7.gir

The resulting VAPI file will be located on the same folder where the shell command was issued, with the name defined on the --library switch, in this case Grss.vapi.

## Correct the VAPI file
For some reason i did not dig in detail, the VAPI file references libxml2 xmlDocPtr instead of Xml.Doc. Another needed change is replacing 'Grss-0.7.h' to 'libgrss/libgrss.h'. This last issue probably can be avoided by better naming of the Grss.vapi library switch... whatever...

## Last but not least
The VAPI file should be copied into valac VAPI folder and use the -X switch to indicate the library.
C code works ok with pkg-config and valac can generate C code that will compile but to compile directly from valac, we must use '-X -lgrss' (this can be solved, probably, but needs more time)

### References:
[libgrss at github](https://github.com/GNOME/libgrss)  
[libgrss at GNOME](https://wiki.gnome.org/Projects/Libgrss)  
[Online API reference](http://gtk.mplat.es/libgrss/documentation/0.6/)  

