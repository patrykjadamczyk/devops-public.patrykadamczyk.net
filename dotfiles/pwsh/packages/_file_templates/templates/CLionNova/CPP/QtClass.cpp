#include "$HEADER_FILENAME$"
#include "$UI_HEADER_FILENAME$"

namespace $NAMESPACE$ {
    $NAME$::$NAME$(QWidget *parent) :
        $PARENT_CLASS$(parent), ui(new Ui::$NAME$) {
        ui->setupUi(this);
    }

    $NAME$::~$NAME$() {
        delete ui;
    }
}
