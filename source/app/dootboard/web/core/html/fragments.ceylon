import ceylon.html {
    ...
}

shared Head newHead({Content<MetadataCategory>*} additional) =>
        Head {
            Meta {
                charset = "utf-8";
            },
            Title {
                "Dootboard"
            },
            Link {
                rel = "stylesheet";
                href = "https://fonts.googleapis.com/icon?family=Material+Icons";
            },
            Link {
                rel = "stylesheet";
                href = "https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css";
            },
            Link {
                rel = "stylesheet";
                href = "/static/css/index.css";
            },
            Script {
                defer = true;
                src = "https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js";
            },
            *additional
        };

shared Body newBody() =>
        Body {
            clazz = "mdc-typography";
            Header {
                clazz = "mdc-toolbar mdc-toolbar--fixed";
                Div {
                    clazz = "mdc-toolbar__row";
                    Section {
                        clazz = "mdc-toolbar__section mdc-toolbar__section--align-start";
                        Span {
                            clazz = "mdc-toolbar__title";
                            "Dootboard - Home"
                        }
                    }
                }
            },
            Div {
                clazz = "page-content mdc-toolbar-fixed-adjust";
                Aside {
                    clazz = "mdc-drawer mdc-drawer--permanent";
                    Nav {
                        clazz = "mdc-drawer__drawer";
                        Nav {
                            clazz = "mdc-drawer__content mdc-list-group";
                            Div {
                                clazz = "mdc-list";
                                A {
                                    clazz = "mdc-list-item mdc-list-item--selected";
                                    href = "#";
                                    "Home"
                                },
                                A {
                                    clazz = "mdc-list-item";
                                    href = "#";
                                    "Servers"
                                },
                                A {
                                    clazz = "mdc-list-item";
                                    href = "#";
                                    "Logs"
                                },
                                A {
                                    clazz = "mdc-list-item";
                                    href = "#";
                                    "Players"
                                },
                                A {
                                    clazz = "mdc-list-item";
                                    href = "#";
                                    "Tickets"
                                },
                                A {
                                    clazz = "mdc-list-item";
                                    href = "#";
                                    "Site Admin"
                                }
                            },
                            Hr {
                                clazz = "mdc-list-divider";
                            },
                            Div {
                                clazz = "mdc-list";
                                A {
                                    clazz = "mdc-list-item";
                                    href = "#";
                                    "Logout"
                                }
                            }
                        }
                    }
                }
            },
            Main {
            }
        };