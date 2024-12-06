;; cpp
#ifndef {{_INCLUDE_GUARD_}}
#define {{_INCLUDE_GUARD_}}

#include <{{_PARENT_CLASS_}}>

namespace {{_NAMESPACE_}} {
QT_BEGIN_NAMESPACE
namespace Ui { class {{_NAME_}}; }
QT_END_NAMESPACE

class {{_NAME_}} : public {{_PARENT_CLASS_}} {
Q_OBJECT

public:
    explicit {{_NAME_}}(QWidget *parent = nullptr);
    ~{{_NAME_}}() override;

private:
    Ui::{{_NAME_}} *ui;
};
}

#endif
