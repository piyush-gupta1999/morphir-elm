module Morphir.Visual.ViewReference exposing (..)

import Element exposing (Element, padding, spacing, text)
import Element.Events exposing (onClick)
import Morphir.IR.FQName exposing (FQName)
import Morphir.Visual.Common exposing (nameToText)
import Morphir.Visual.Config exposing (Config)
import Morphir.Visual.Theme exposing (smallPadding, smallSpacing)
import Morphir.Visual.VisualTypedValue exposing (VisualTypedValue)


view : Config msg -> (VisualTypedValue -> Element msg) -> FQName -> Element msg
view config viewValue (( packageName, moduleName, localName ) as fQName) =
    Element.row
        [ smallPadding config.state.theme |> padding
        , smallSpacing config.state.theme |> spacing
        , onClick (config.handlers.onReferenceClicked fQName False)
        ]
        [ Element.el []
            (text
                (nameToText localName)
            )
        ]
