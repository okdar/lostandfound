/*
    This file is part of Lost and Found widget.
    https://github.com/okdar/lostandfound

    Lost and Found is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Lost and Found is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Lost and Found. If not, see <https://www.gnu.org/licenses/gpl.html>.
*/

import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class LostAndFoundApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new LostAndFoundView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as LostAndFoundApp {
    return Application.getApp() as LostAndFoundApp;
}