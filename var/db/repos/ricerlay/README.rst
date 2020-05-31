========
ricerlay
========

-------
Purpose
-------

The main Gentoo package tree doesn't have some crucial packages for ricing.
Some of them do exist but live ebuilds are not present or broken.
This overlay is aimed to fix these issues and promote Gentoo as a favorable distribution for the those who want to customize their desktop.

------------
Installation
------------

::

   layman -a ricerlay
   layman -S
   emerge <package>

----------------
Getting Involved
----------------

Please do contribute!

If you are willing to help there is a TODO list that contains packages needed to be added or updated.
However, you are not limited to only working with it. You are encouraged to add interesting packages related to ricing, customization and workflow improvement.

Example workflow could look like this:

::

   ### Fork this repository
   git clone https://github.com/<your github username>/ricerlay.git
   ### Make changes
   git add <your changes>
   git commit -m "<category>/<package>: <briefly state your changes>"
   git push -f origin master
   ### Create a PR via GitHub's web interface or using your prefered integration tool
