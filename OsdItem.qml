/*
 * Copyright 2014 Martin Klapetek <mklapetek@kde.org>
 * Copyright 2019 Kai Uwe Broulik <kde@broulik.de>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.14
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtra
import QtQuick.Window 2.2

Item {
    property QtObject rootItem

    height: Math.min(units.gridUnit * 15, Screen.desktopAvailableHeight / 5)
    width: height

    PlasmaCore.IconItem {
        id: icon
        height: parent.height - Math.max(progressBar.height, label.height)
                              - ((units.smallSpacing/2) * 3) //it's an svg
        width: parent.width
        source: rootItem.icon
    }

    PlasmaComponents3.ProgressBar {
        id: progressBar
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: Math.floor(units.smallSpacing / 2) * 5
         }
        Layout.fillWidth: true
        visible: rootItem.showingProgress
        from: 0
        to: rootItem.osdMaxValue
        value: Number(rootItem.osdValue)
    }

    PlasmaExtra.Heading {
        id: label
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: Math.floor(units.smallSpacing / 2) * 2
         }
        Layout.fillWidth: true
        level: 3
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        textFormat: Text.PlainText
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
        text: !rootItem.showingProgress && rootItem.osdValue ? rootItem.osdValue : ""
        visible: !rootItem.showingProgress
    }
}
