---
title: CTCT
---

## CTCT

### Galileo

I spent more than four years working at Constant Contact, and for
almost all of that time, I was assigned to a project nicknamed
'Galileo.'

#### Early Days

When I first arrived the CTO had a clear vision for the product, and I
played a supporting role to a lead implementor and architect.

I started off building small pieces while a team was assembled around
us. In a few months we were up to about a half dozen people. It was
initialy Ruby and Rails for backend services and CoffeeScript for
frontend parts. While we ultimately moved toward [Backbone], in the
early days we tried to go forward without a framework. We relied
heavily on jQuery, jQuery widgets, and pure JavaScript.

[Backbone]: http://backbonejs.org/

The frontend of Galileo is built around a component based
architecture, where components like an "Image Editor" or "Text Editor"
collaborate together to build a document. Each component controls a
small part of the page.

One of the first items of consequence I built was an Image Editor that
used a `<canvas/>` to do inline cropping:

<a href="http://www.screencast.com/t/47ztHxvjw">
  <img alt="Canvas Image Editor"
       title="Canvas Image Editor"
       src="/images/canvas-image-editor.png">
</a>

This period was marked with a serious effort to "get testing right,"
and I became intimately familiar with [Capybara] and Selenium
testing. Unfortunately, we did not quite have the hang of unit testing
yet, and we ended up deep into an anti-pattern known as the
[Software Testing Ice Cream Cone][testing-ice-cream-cone].

[Capybara]: https://github.com/jnicklas/capybara
[testing-ice-cream-cone]: http://watirmelon.com/2012/01/31/introducing-the-software-testing-ice-cream-cone/

#### Growing Pains

Time was passing, and to help speed things up we added more people to
the project. We brought in two consultancies ([Bocoup], [Dockyard]),
and added another dozen or so employees to the project.

[Bocoup]: https://bocoup.com/
[Dockyard]: https://dockyard.com/

I spent the next phase of the project focused on making
all of these people successful.

This resulted in:

* Separating the front and backend teams.
* Switching to standard npm based build tools.
* Reducing build times down to a minute or so.
* Creating the mechanism by which static projects could go straight to
  our CDN.
* Simplifying our static app deployments by "switching URLs" from one
  version to another.
* Deploying 3 times a day down from once every 3 weeks.

Galileo was the first application at CTCT to deploy in this manner,
but the groundwork I put in place now serves as the mechanism by which
all of our static apps deploy.

#### Back to the Frontend

While I was doing the work above, I ended up leading the backend team.

However, once we were building and deploying in a reasonable fashion,
it was clear that the frontend team needed some extra support, and so
I switched.

##### Text Editor

Though it wasn't glamorous, I worked on our Text Editor with one other
engineer for the next several months. It was based on an older build
of the [Aloha Text Editor] and our changes were focused on making it
work "more like" Microsoft Word does when it came to formatting
content.

It is extremely nuanced (read: boring), but the following took a
non-trivial amount of effort:

[Aloha Text Editor]: http://www.alohaeditor.org/

<a href="http://www.screencast.com/t/zeZJRVSNKfy3">
  <img alt="Text Editor"
       title="Text Editor"
       src="/images/text-editor.png">
</a>

The highlight is what you do not see: we wrote hundreds of unit tests,
cleaned up untold amounts of old code, and tracked the new behavior to
an increase in the KPIs of our project.

##### Color Picker

More colorfully, we next spent two weeks building out this reusable
color picker:

<a href="http://www.screencast.com/t/8nNhBiw2ft">
  <img alt="Color Picker"
       title="Color Picker"
       src="/images/color-picker.png">
</a>
