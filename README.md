This works with Rails >= 4.1 and ActiveScaffold >= 3.4.31

Action is enabled by default, you can exclude from any controller, or
exclude with set_defaults and enable on other controllers.

==Overview

A plugin for Active Scaffold that provides phone and tablet detection,
a different UI for them and the ability to choose the column to show
in the scaffold list for phones and tablets.

Two options to define phone and tablet columns:
* phone_columns
* tablet_columns

When row is clicked, some other columns for the row will be displayed
vertically and actions at bottom. Use @extended_columns@ to define them.

Set session[:desktop_version] to disable mobile views, delete :desktop_version
from session (or set to nil) to enable them again.