import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ImageViewer")

    BusyIndicator {
        id: busy;
        running: true;
        anchors.centerIn: parent;
        z: 2;
    }

    Label {
        id: stateLabel;
        visible: false;
        anchors.centerIn: parent;
        z: 3;
    }

    Image {
        id: imageViewer;
        asynchronous: true;
        cache: false;
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
        onStatusChanged: {
            if (imageViewer.status === Image.Loading){
                busy.running = true;
                stateLabel.visible = false;
            }
            else if (imageViewer.status === Image.Ready){
                busy.running = false;
            }
            else if (imageViewer.status === Image.Error){
                busy.running = false;
                stateLabel.visible = true;
                stateLabel.text = "ERROR";
            }
        }
    }

    Component.onCompleted: {
        //加载网络图片
//            imageViewer.source = "http://preview.quanjing.com/bldrm002/blm018819.jpg";
        //加载本地图片
        imageViewer.source = "qrc:/timg.jpeg";
    }
}
