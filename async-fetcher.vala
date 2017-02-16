/* Adapted from C example, async-fetcher.c */

using Xml;
using GLib;
using Grss;

public class DemoRss : GLib.Object {

    public async void get_titles (Grss.FeedChannel feed) {
        try {
            unowned List<FeedItem> items;
            items = yield feed.fetch_all_async ();
            print ("%s - %s\n", feed.get_title (), feed.get_description ());
            print ("***************************************************************************\n"); 
            items.foreach ((item) => {
                print ("(%s) %s\n", item.get_categories ().data, item.get_title ());
            });
        } catch (GLib.Error e) {
            stderr.printf (e.message);
        } 
        
        return;
    }

    public static int main (string[] args) {
        GLib.MainLoop loop;
        var demo = new DemoRss ();
        loop = new MainLoop ();
        var feed = new Grss.FeedChannel.with_source ("http://rss.slashdot.org/Slashdot/slashdot");
        demo.get_titles (feed);
        loop.run ();
        return 0; 
    }
}
