#ifndef $INCLUDE_GUARD$
#define $INCLUDE_GUARD$

#include <$PARENT_CLASS$>

namespace $NAMESPACE$ {
QT_BEGIN_NAMESPACE
namespace Ui { class $NAME$; }
QT_END_NAMESPACE

class $NAME$ : public $PARENT_CLASS$ {
Q_OBJECT

public:
    explicit $NAME$(QWidget *parent = nullptr);
    ~$NAME$() override;

private:
    Ui::$NAME$ *ui;
};
}

#endif
