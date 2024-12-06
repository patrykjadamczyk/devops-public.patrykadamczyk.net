;; xml
<Styles
    xmlns="https://github.com/avaloniaui"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:controls="using:{{_NAMESPACE_}}"
>
    <Design.PreviewWith>
        <controls:{{_CLASS_}} />
    </Design.PreviewWith>

    <Style Selector="controls|{{_CLASS_}}">
        <!-- Set Defaults -->
        <Setter Property="Template">
            <ControlTemplate>
                <TextBlock Text="Templated Control" />
            </ControlTemplate>
        </Setter>
    </Style>
</Styles>
