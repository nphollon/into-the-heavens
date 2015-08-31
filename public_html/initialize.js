window.onload = function () {
    "use strict";

    var app = Elm.embed(
        Elm.Main,
        document.getElementById("app"),
        { hasFocus : true }
    );

    /* Disable the FPS signal when the window is out of focus */
    window.onfocus = function () {
        app.ports.hasFocus.send(true);
    };

    window.onblur = function () {
        app.ports.hasFocus.send(false);
    };

    /* Cull back faces to speed up rendering */
    document
        .getElementsByTagName("canvas")[0]
        .getContext("webgl")
        .enable(WebGLRenderingContext.CULL_FACE);
}
