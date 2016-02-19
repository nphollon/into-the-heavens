window.onload = function () {
    "use strict";

    var app = Elm.embed(
        Elm.Main,
        document.getElementById("app"),
        { hasFocus : true
        , seed:
          [ Math.floor(Math.random()*0xFFFFFFFF)
          , Math.floor(Math.random()*0xFFFFFFFF)
          ]
        }
    );

    /* Disable the FPS signal when the window is out of focus */
    window.onfocus = function () {
        app.ports.hasFocus.send(true);
    };

    window.onblur = function () {
        app.ports.hasFocus.send(false);
    };
}
