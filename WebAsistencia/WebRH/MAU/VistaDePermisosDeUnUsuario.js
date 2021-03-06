﻿var VistaDePermisosDeUnUsuario = function (opt) {
    $.extend(this, opt, true);
    this.start();
};

VistaDePermisosDeUnUsuario.prototype.start = function () {
    var _this = this;
    this.repositorioDeFuncionalidades.todasLasFuncionalidades(
        function (funcionalidades) { //on success
            _this.funcionalidades = funcionalidades;
            var nodos_funcionalidades = [];
            var nodos_hijos = [];
            var primera_vez = true;
            var grupo = funcionalidades[0].Grupo;
            for (var i = 0; i < funcionalidades.length; i++) {
                if (grupo != funcionalidades[i].Grupo) {
                    nodos_funcionalidades.push({ title: grupo, isFolder: true, children: nodos_hijos, addClass: "dynatree_image" })
                    nodos_hijos = [];
                    nodos_hijos.push(new NodoEnArbolDeFuncionalidades(funcionalidades[i]));
                    grupo = funcionalidades[i].Grupo
                } else {
                    nodos_hijos.push(new NodoEnArbolDeFuncionalidades(funcionalidades[i]));
                }
                
                //nodos_funcionalidades.push(new NodoEnArbolDeFuncionalidades(funcionalidades[i]));
            }
            nodos_funcionalidades.push({ title: grupo, isFolder: true, children: nodos_hijos, addClass: "dynatree_image" })
            _this.ui.dynatree({
                checkbox: true,
                selectMode: 2,
                children: nodos_funcionalidades,
                debugLevel: 0,
                onClick: function (node, event) {
                    if(node.data.unselectable) return;
                    if (node.getEventTargetType(event) == 'checkbox') {
                        if (node.isSelected()) {
                            _this.autorizador.denegarFuncionalidadA(
                                _this.usuario.Id,
                                node.data.key,
                                function () {
                                    node.select(false);
                                },
                                function () { alertify.alert("", "error al denegar permisos"); }
                            );
                        }
                        else {
                            _this.autorizador.concederFuncionalidadA(
                                _this.usuario.Id,
                                node.data.key,
                                function () {
                                    node.select(true);
                                },
                                function () { alertify.alert("", "error al conceder permisos"); }
                            );
                            }
                        return false;
                    }
                }
            });
            _this.arbol = _this.ui.dynatree('getTree');
            _this.ui.dynatree("getRoot").visit(function (node) {
                node.expand(true);
            });
        },
        function (error) { //on error
            alertify.alert("", error);
        }
    );
};

VistaDePermisosDeUnUsuario.prototype.setUsuario = function (un_usuario) {
    this.arbol.visit(function (node) {
        node.select(false);
    }, true);
    this.usuario = un_usuario;
    var _this = this;
    var spinner = new Spinner({ scale: 3 });
    spinner.spin(this.ui[0]);
    this.repositorioDeFuncionalidades.FuncionalidadesOtorgadasA(un_usuario,
        function (funcionalidades) { //on success
            for (var i = 0; i < funcionalidades.length; i++) {
                var nodo = _this.arbol.getNodeByKey(funcionalidades[i].Id.toString());
                nodo.select(true);
            }
            spinner.stop();
        },
        function (error) { //on error
            alertify.alert("error al cargar funcionalidades del usuario", 'error');
            spinner.stop();
        }
    );
    this.repositorioDeFuncionalidades.todasLasFuncionalidades(
        function (funcionalidades) { //on success
            _.forEach(funcionalidades, function (f) {
                var nodo = _this.arbol.getNodeByKey(f.Id.toString());
                if (f.SoloParaVerificados && !un_usuario.Verificado) {
                    nodo.data.unselectable = true;
                    return;
                }
                if (f.SoloParaEmpleados && !un_usuario.Owner.Legajo) {
                    nodo.data.unselectable = true;
                    return;
                }
                nodo.data.unselectable = false;
            });
        },
        function (error) { //on error
            alertify.alert("error al cargar funcionalidades", 'error');
            spinner.stop();
        })
};