var app = app || {};

app.fixture = function () {
    var xhr,
        configAjax = {
            url: '/torneo/[TORNEOID]/[GRUPO]',
            method: 'GET'
        },
        defaults = {
            torneoId: null,
            fixtureSelector: '.columna-fixture'
        },
        config = {},
        grupos = ['Grupo A', 'Grupo B', 'Grupo C', 'Grupo D', 'Grupo E', 'Grupo F', 'Grupo G', 'Grupo H'],
        grupoActualIndex = 0;

    function init(options) {
        config = $.extend({}, defaults, options);

        //if (xhr)
        //    xhr.abort();

        //xhr = $.ajax(getConfigAjax()).done(doneXhr);

        initEvents();
    }

    function initEvents() {
        $(config.fixtureSelector).on('click', '.grupo-anterior', prevGroup);
        $(config.fixtureSelector).on('click', '.grupo-siguiente', nextGroup);
    }

    function prevGroup(evt) {
        evt.preventDefault();

        if (xhr)
            xhr.abort();

        if (grupoActualIndex == 0)
            grupoActualIndex = grupos.length - 1;
        else
            --grupoActualIndex;
        xhr = $.ajax(getConfigAjax()).done(doneXhr);
    }

    function nextGroup(evt) {
        evt.preventDefault();

        if (xhr)
            xhr.abort();

        if (grupoActualIndex == (grupos.length -1))
            grupoActualIndex = 0;
        else
            ++grupoActualIndex;

        xhr = $.ajax(getConfigAjax()).done(doneXhr);
    }

    function getConfigAjax() {
        var url = configAjax.url.replace('[TORNEOID]', config.torneoId);
        url = url.replace('[GRUPO]', grupos[grupoActualIndex]);
        return {
            url: url,
            method: configAjax.method
        };
    }

    function doneXhr(html) {
        var $fixture = $(config.fixtureSelector);
        $fixture.fadeOut('fast', function() {
            $fixture.html(html);
            $fixture.fadeIn('fast');
        });
    }

    return {
        init: init
    };
}();