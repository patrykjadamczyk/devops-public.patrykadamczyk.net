;; cpp
#include "{{_HEADER_FILENAME_}}"
#include "{{_UI_HEADER_FILENAME_}}"

namespace $NAMESPACE$ {
    {{_NAME_}}::{{_NAME_}}(QWidget *parent) :
        {{_PARENT_CLASS_}}(parent), ui(new Ui::{{_NAME_}}) {
        ui->setupUi(this);
    }

    {{_NAME_}}::~{{_NAME_}}() {
        delete ui;
    }
}
