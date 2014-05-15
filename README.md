Oracle Apex AJAX Tree
----------------------

This is a region-type plugin for Oracle Apex 4.2+

The default tree component for apex is -still- an ancient version of jstree - namely 0.9.9a2. It suffices, but as it stands it is very, very limited and hard to interact with. Binding events to nodes or implementing extra functionality is not intuitive. In version 1.0.0 this has become a lot better.

Another big, big, big pain with the tree is how it handles its data: static. When the page is rendered, the data is generated as a json payload and put in a global variable on the page. The tree is then initialized with that data. Imagine a big tree with 400 nodes: that is a lot of HTML to be injected in the DOM, and usually a user will not need all that data. Already this means a longer load time, and waiting longer until the page has completed loading. 

This makes the tree painful to use once you start using the built-in link. A common use of the tree is to visualize hierarchical data on a tree in a sidebar, with node links which redirect to different pages to display data relevant to the selected node. For example, take the usual department-employee relationship: selecting a department will open a detail page for the department, while it will open another detail page for the employee. This works perfectly! But is it efficient? A large organizational structure will deliver slow load times, purely because of the tree's static data load. 

How to fix that? Dynamically load the nodes required! Don't do a full data load, just get on-demand. I've experimented with the apex-included version of the tree - but found it an extreme waste of time to try to make it work with ajax and apex, while the solution is simply out there: jstree version 1.0.0.
Furthermore, there is tree interaction. I've written a blog and provided examples regularly on OTN, but it remains a bit itchy, because it also feels rudimentary. This is also remedied by using a newer tree version.

When I set out on this plugin, I selected a version of jstree v1.0.0 where it was still compatible with the jQuery version included with apex 4.2: 1.7.
Link to jstree v1.0.0r2 http://old.jstree.com/

At the time of writing jstree also has released version 3.0. It's my goal to, once this plugin has been tested sufficiently, upgrade the plugin with the newer version and if necessary include the newer jQuery libraries.

Demo
-----
Go to my demo application on apex.oracle.com: https://apex.oracle.com/pls/apex/f?p=69001

Features:
---------
- AJAX loading of nodes
- want static loading? Also possible! You can provide nodes statically with a given depth of the tree. 
- refreshable tree region
- search the tree and open required nodes: the tree data can be searched, and the plugin will collect the necessary nodes to be loaded in and open them up. This is different from the static search which only searched the DOM.
- standard implementation of jstree. All that is custom on the javascript side is the initialization of the tree. If you want interaction with the tree you can simply look at the jstree doc pages and works from there.
- 3 standard themes (default, classic, apple) or jQueryUI theme implementation.

Todo's:
-------
- requires testing by someone other than me!
- requires opinion on some features!
- more docs
- help text on the plugin items
- better implementation of the jqueryui library when custom

Other than that, the plugin works absolutely fine!

Installation
------------
Simply import the region_type_plugin_tp_ajax_jstree_region.sql file to your Oracle Apex application. 
The plugin can be used when creating a new region on a page and selecting the plugin.