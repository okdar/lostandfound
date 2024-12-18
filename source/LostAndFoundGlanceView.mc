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
import Toybox.Lang;
import Toybox.WatchUi;

(:glance)
class LostAndFoundGlanceView extends WatchUi.GlanceView {

    function initialize() {
        GlanceView.initialize();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var font = Graphics.FONT_TINY;
        var fontHeight;

        //clean the glance area
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawText(1, 0, font, "If found, contact:", Graphics.TEXT_JUSTIFY_LEFT);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        font = Graphics.FONT_XTINY;
        fontHeight = dc.getFontHeight(font) + Graphics.getFontDescent(font) + 2;
        dc.drawText(1, fontHeight, font, Application.getApp().getProperty("phone"), Graphics.TEXT_JUSTIFY_LEFT);

        fontHeight += dc.getFontHeight(font);
        dc.drawText(1, fontHeight, font, Application.getApp().getProperty("email"), Graphics.TEXT_JUSTIFY_LEFT);
    }

}
