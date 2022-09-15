# FluffyArt
Project 2 - SEiR 61 (Building Your First Full-stack Application) 

[Heroku live deploy](https://fluffyart.herokuapp.com/)

![A Screenshot of the FluffyArt front page, showing a mostly green site and a dark green banner. Saying "welcome"](https://files.treblesketch.com/2022/09/21a3482a3378202a_2022-09-15.png)

Introduction
---

Built between the 13th of September to the 15th of September, learning about how to build a CRUD app based off knowledge learnt through the past 2 weeks of the course within Ruby and Sinatra.

Technology used
---

* Ruby
* Sinatra
* Heroku
* Cloudinary (backend image handling)
* Visual Studio Code (IDE)
* Paint.NET (favicon)

Development
---

[Early Sketches](https://github.com/Titus-Huang/FluffyArt/blob/main/_concept-doodles/layouts.png), playing around with what the layout is envisoned to be.

Looking around for inspirations like deviantART, FurAffinity, pixiv, Tumblr, etc did help with helping me grasp what an art website should roughly have at a foundamental level.

While this project won't come close to any of those sites, I plan to at least have a decent amount of BASE funtionality by the time of this project's completion.

Due to the limitations of Sinatra's erb function, it did take some help from the instructor for a solution to be implemented. Stitching together different erbs within the `layout.erb` file!

Programming approach
---

As with the previous project, I once agian took an analytical approproach to the project with webpage structure/layout/definitions standarisation/data structure/etc.

Thanks to the dynamic nature of Ruby/Sinatra, was able to segment out different aspects of the website into their respective parts (Users, Contents, and then how to effectively display the data) and how to integrate data handling with security & user interactability in mind.

Also was the first time that a more complex API was used in both class/project setting, Cloudinary has been used by a few friends to handle how their site manage images and I've been recommended to give it a try. So I thought it was the perfect opportunity to give it a go.


Workarounds
---

There were several workarounds, namely the Cloudinary image transformation API, as I didn't have enough time to work through their video tutorials.

So I could only skim the text tutorials over the course of the Wednesday as I spent most of Monday and Tuesday planning and setting up the base structure and funtionality of the site.

Bugs & problems
---

There were plenty of bugs and problems along the way, especially as mentioned in the "Development" section.

Otherwise, one MAJOR problem would be that this site is not mobile-focused. It is built to be a desktop-only app, but there were some work for some mobile done. Tho won't be implemented in time for the project's presentation, but will hopefully be worked on in the coming week or... eventually!

---

Licenced under the MIT Licence
**FluffyArt** by *Titus Huang* &copy; 2022