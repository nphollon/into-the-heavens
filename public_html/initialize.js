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
    var cullFaces = function () {
        var canvas = document.getElementsByTagName("canvas")[0];

        if (canvas === undefined) {
            setTimeout(cullFaces);
        } else {
            var context = canvas.getContext("webgl");
            
            if (!context) {
                setTimeout(cullFaces);
            } else {
                context.enable(WebGLRenderingContext.CULL_FACE);
            }
        }
    };

    setTimeout(cullFaces);
}
