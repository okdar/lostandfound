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

    var msg1;
    var msg2;
    var msg3;
    var recalculateRatio;

    function initialize() {
        View.initialize();
        msg1 = WatchUi.loadResource($.Rez.Strings.msg1);
        msg2 = WatchUi.loadResource($.Rez.Strings.msg2);
        msg3 = WatchUi.loadResource($.Rez.Strings.msg3);
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
        var screenRadius = dc.getWidth() / 2;
        recalculateRatio = dc.getWidth() / 260.0;
        var phone = Application.getApp().getProperty("phone");
        var email = Application.getApp().getProperty("email");

        //clean the screen
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.fillCircle(screenRadius, screenRadius, screenRadius * 2.5);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        if (msg2.equals("")) {
            drawMessage(dc, msg1, screenRadius, recalculateCoordinate(45), recalculateCoordinate(230));
        } else {
            drawMessage(dc, msg1, screenRadius, recalculateCoordinate(30), recalculateCoordinate(210));
            drawMessage(dc, msg2, screenRadius, recalculateCoordinate(58), recalculateCoordinate(240));
        }
        drawMessage(dc, phone, screenRadius, recalculateCoordinate(105), recalculateCoordinate(260));
        drawMessage(dc, email, screenRadius, recalculateCoordinate(138), recalculateCoordinate(260));
        drawMessage(dc, msg3, screenRadius, recalculateCoordinate(205), recalculateCoordinate(220));
    }

    function drawMessage(dc, msg, screenRadius, posY, width) {
        var font = Graphics.FONT_SMALL;
        var textDimension = dc.getTextDimensions(msg, font);

        if (textDimension[0] > width) {
            font = Graphics.FONT_TINY;
            textDimension = dc.getTextDimensions(msg, font);
            if (textDimension[0] > width) {
                font = Graphics.FONT_XTINY;
            }
        }

        dc.drawText(screenRadius, posY, font, msg, Graphics.TEXT_JUSTIFY_CENTER);
    }

    //coordinates are optimized for 260x260 resolution (vivoactive4)
    //this method recalculates coordinates for watches with different resolution
    function recalculateCoordinate(coordinate) {
        return (coordinate * recalculateRatio).toNumber(); //vivoactive4 resolution = 1
    }
    
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
