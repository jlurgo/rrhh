﻿///este módulo sirve para convertir una página con tabs
///en una SPA (maneja el 'back' y 'forward' del navegador)
///
///los componentes del html que tengan el atributo target_scr="#nombre_de_tab"
///dispara un eventode mostrar ese otro tab, y cambiar la url en el browser
///los tabs en el html tienen que tener el id="#nombre_de_tab"
define(['jquery'], function ($) {

    //cuando se hace click en "siguiente" (solapa home)
    var do_nothing = function (show_next_tab) {
        show_next_tab()
    }

    var mostrarTab = function (tab_name) {
        $('[role="tabpanel"]').hide()
        $(tab_name).show()
    }

    var tab_definition_from_url = function (url) {
        if (!url) {
            return {
                name: '',
                parameter: ''
            }
        }
        var tab_definition = url.split('/')
        var tab_name = tab_definition[0]
        var tab_parameter = tab_definition[1]
        return {
            name: tab_name,
            parameter: tab_parameter
        }
    }



    ///recibe tabs_config, con los métodos definiendo las acciones a realizar por cada solapa, de la forma:
    ///
    ///var tabs_config = [
    /// {
    ///    tab_name: '#scr_home',      <--nombre del tab html
    ///    on_next: on_scr_home_next   <--funcion evaluada al presionar "next" (que es un boton html tipo <button target_scr="#siguiente_tab">)
    /// }, ...
    ///]
    var createTabs = function (tabs_events) {
        $('[target_scr]').click(function (e) {
            e.preventDefault();
            var url = this.attributes.target_scr.value
            var next_tab = tab_definition_from_url(this.attributes.target_scr.value)
            var current_tab = tab_definition_from_url(location.hash)
            var tab_config = _.find(tabs_events, function (each) { return each.tab_name == current_tab.name })
            var url_param = current_tab.parameter
            var on_tab_leave = function () {
                mostrarTab(next_tab.name)
            }
            if (!tab_config) {
                tab_config = {
                    tab_name: current_tab.name,
                    on_next: do_nothing
                }
            }
            tab_config.on_next(on_tab_leave, url_param)
            
            history.pushState(null, null, url);
        })
    }

    

    window.addEventListener("popstate", function (e) {
        var tab = tab_definition_from_url(location.hash)
        var activeTab = $(tab.name);
        if (activeTab.length) {
            var url_param =  tab.parameter
            mostrarTab(tab.name)
        } else {
            mostrarTab('#scr_home')
        }
    });

    return {
        createTabs: createTabs
    }
})