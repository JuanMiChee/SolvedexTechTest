<H1>#Solvedex Pugs loading tech test</H1>

<H4>#Description</H4>
This is an app created to pass a technical test, we are going to be using MVVM for the design pattern and clean code for the overal architecture.

This project is about loading images from an API and show then in your user screen, with the feature of only loading the images the user is about to see, so we don't fetch an absurd amount of items, while having a infite scroll.
Every item in our main screen contains:

- Heart button for like.
- Counter of likes.
- Fetched image.

<H4>#Responsiveness</H4>
Beeing a completely response app able to work in different environments such as iPads, small devices and even rotating the screen.

<H4>#Frameworks</H4>
<h6>NUKE.</h6>
For this scenario, we are going to be using Nuke, for images cache management and to avoid unnecesary images reload.

LazyImage is designed to be similar to the native AsyncImage, but it uses Nuke for loading images. You can take advantage of all of its features, such as caching, prefetching, task coalescing, smart background decompression, request priorities, and more.
  
