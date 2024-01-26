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

import Toybox.Graphics;
import Toybox.WatchUi;

class LostAndFoundView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var app = Application.getApp();
        var screenRadius = dc.getWidth() / 2;
        var font;

        //TINY font for screen resolution 240 and lower, SMALL for higher resolution
        if (screenRadius <= 120) {
            font = Graphics.FONT_TINY;
        } else {
            font = Graphics.FONT_SMALL;
        }

        var phone = app.getProperty("phone");
        if (phone == null || phone.equals("")) {
            phone = "<missing phone number>";
        }

        var email = app.getProperty("email");
        if (email == null || email.equals("")) {
            email = "<missing email>";
        }

        var hrTextDimension = dc.getTextDimensions(phone, font);

        //clean the screen
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.fillCircle(screenRadius, screenRadius, screenRadius * 2.5);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(screenRadius, screenRadius - (2.8 * hrTextDimension[1]), font, "If found, contact:", Graphics.TEXT_JUSTIFY_CENTER);

        if (hrTextDimension[0] > screenRadius * 2) {
            dc.drawText(screenRadius, screenRadius - (hrTextDimension[1]) - 8, Graphics.FONT_XTINY, phone, Graphics.TEXT_JUSTIFY_CENTER);
        } else {
            dc.drawText(screenRadius, screenRadius - (hrTextDimension[1]) - 8, font, phone, Graphics.TEXT_JUSTIFY_CENTER);
        }

        hrTextDimension = dc.getTextDimensions(email, font);
        if (hrTextDimension[0] > screenRadius * 2) {
            dc.drawText(screenRadius, screenRadius + 8, Graphics.FONT_XTINY, email, Graphics.TEXT_JUSTIFY_CENTER);
        } else {
            dc.drawText(screenRadius, screenRadius + 8, font, email, Graphics.TEXT_JUSTIFY_CENTER);
        }
        
        dc.drawText(screenRadius, screenRadius + (2 * hrTextDimension[1]), font, "Thank you!", Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
