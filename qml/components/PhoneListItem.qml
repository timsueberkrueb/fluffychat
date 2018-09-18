import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

ListItem {
    id: listItem
    height: layout.height
    property var thisAddress: name

    ListItemLayout {
        id: layout
        title.text: name
        Icon {
            name: "phone-symbolic"
            color: settings.mainColor
            width: units.gu(4)
            height: units.gu(4)
            SlotsLayout.position: SlotsLayout.Leading
        }
    }

    leadingActions: ListItemActions {
        actions: [
        Action {
            iconName: "edit-delete"
            onTriggered: {
                matrix.post ( "/client/r0/account/3pid/delete", { medium: "msisdn", address: thisAddress }, listItem.destroy )
            }
        }
        ]
    }
}
