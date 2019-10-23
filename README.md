# blog-o-matic by Pablo Iranzo

**Table of contents**
<!-- TOC depthFrom:2 insertAnchor:true orderedList:true updateOnSave:true -->

- [blog-o-matic by Pablo Iranzo](#blog-o-matic-by-pablo-iranzo)
  - [Introduction](#introduction)
  - [Setup](#setup)
  - [Test it](#test-it)
  - [Add file to repository](#add-file-to-repository)
  - [Add file to commit](#add-file-to-commit)
  - [Upload changes to github](#upload-changes-to-github)
  - [WARNING](#warning)
  - [Going the extra mile](#going-the-extra-mile)
  - [Feedback and wrap up](#feedback-and-wrap-up)

<!-- /TOC -->

[![Build Status](https://travis-ci.com/iranzo/blog-o-matic.svg?branch=source)](https://travis-ci.com/iranzo/blog-o-matic)


<a id="markdown-introduction" name="introduction"></a>
## Introduction

The Idea with this repository, is to have an easy an 'automated' setup of a blog on github pages by following some easy instructions.

You'll need to setup several steps manually (sorry, I can't do that for you), but once done, each time you publish a new article (markdown, asciidoc), the blog will be redeployed showing your new one.

Blog will be using:

- Git Hub pages for the hosting of the sources and repository
  - Git Hub token to publish new 'website' once a new article is uploaded
- [travis-ci.org](https://travis-ci.org) for automating the update and generation process
- ['pelican'](https://blog.getpelican.com/) for static rendering of your blog from the markdown or asciidoc articles
- ['Elegant'](https://github.com/Pelican-Elegant/elegant) for the 'Theme'
- [peru](https://github.com/buildinspace/peru) for automating repository upgrades for plugins, etc

<a id="markdown-setup" name="setup"></a>
## Setup

- Fork this repository to your github account, if this is your first 'blog', name it `username.github.io` if not, it will be published as `username.github.io/repository`
  - Visit `settings' on your new cloned repository:
    ![repository settings](2019-01-09-11-35-52.png)
    - Enable GitHub Pages on the 'master' branch:
        ![gh pages enabled](2019-01-09-11-36-48.png)
      - Validate that the URL now works (<https://iranzo.github.io/blog-o-matic/>)
- Generate a [github token](https://github.com/settings/tokens/new) for your account and save securely the value obtained:
  ![Generate token](2019-01-09-11-33-12.png)
- Go to [travis-ci.org](https://travis-ci.org/) and login with your github account.
  - Enable repository builds (in your profile):
      ![Enable travis repository builds](2019-01-09-11-31-13.png)
  - And click on 'settings' once done, and define a new environment variable named `GHTOKEN` with the value obtained in the prior step
      ![Define environment variable](2019-01-09-11-32-18.png)
    - Click on 'ADD' once done:
        ![Add TOKEN value](2019-01-09-11-33-46.png)
      - Token will now be saved and ready for use
- Clone the resulting repository to your system, for example:
  - `git clone https://github.com/iranzo/blog-o-matic.git`
  - change to the `source` branch that will contain the code that we'll be using for updating the website.
    - `git checkout source`

- Edit new articles in `content/` based on the one already provided.

<a id="markdown-test-it" name="test-it"></a>
## Test it

As of this step, your repository should be already published on <https://githubusername.github.io/> with the 'sample' content

You're ready to write a new article, use 'welcome.md' as an example so that you keep useful headers like category, tags, autho, title, publish date, etc (YAML preamble) and save it as 'yourdesiredname.md'.

Once you've written your new article in 'content' folder, perform:

~~~sh
## Add file to repository
git add content/new-article-filename

## Add file to commit
git commit -m "My new article"

## Upload changes to github
git push
~~~

After some seconds, <https://travis-ci.org> will start showing that a new build is in progress, and once it finishes successfully, the resulting webpage will be available via your `username.github.io` domain.

<a id="markdown-warning" name="warning"></a>
## WARNING

- `peru.yaml` is set to use `next` branch of Elegant theme for pelican, as this setup uses pelican 4.0 and current 'master' doesn't work for it (feed slugs related)
  - Remember to update the file or check master blog-o-matic from time to time to see when you should update it <https://github.com/iranzo/blog-o-matic/issues/1>

<a id="markdown-going-the-extra-mile" name="going-the-extra-mile"></a>
## Going the extra mile

- Elegant does generate a sitemap to submit to web crawlers to ease indexing
  - `YOURURL/sitemap.xml` can be submitted
  - [Google Search Console](https://search.google.com/search-console/)
    - Will require you to claim the website as yours, for doing so:
      - Check HEADER method
      - customize `pelicanconf.py` to match the value you received, in the line that says:
        - `CLAIM_GOOGLE = 'XX'`
  - [Bing Webmaster](https://www.bing.com/webmaster/)
      - Check HEADER method
      - customize `pelicanconf.py` to match the value you received, in the line that says:
        - `CLAIM_BING = 'XX'`
- Review other settings in `pelicanconf.py` to customize your blog name, your name, twitter handle, google analytics ID or others, please do check [Pelican-Elegant documentation](https://pelican-elegant.github.io) for more information on what can be done.
- Check <https://iranzo.github.io/tags/#blog-o-matic-ref> for more articles related with blog-o-matic published in my personal blog.

<a id="markdown-feedback-and-wrap-up" name="feedback-and-wrap-up"></a>
## Feedback and wrap up

- For saying thanks: <https://paypal.me/iranzop>
- For issues: <https://github.com/iranzo/blog-o-matic/issues/>
- For other things I've done: <https://iranzo.github.io>
