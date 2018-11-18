open Ast_mapper;
open Ast_helper;
open Asttypes;
open Parsetree;
open Longident;

let lid = name => {txt: Lident(name), loc: Location.none};

let cssMapper = _ => {
  ...default_mapper,
  structure_item: (mapper, item) =>
    switch (item.pstr_desc) {
    | Pstr_value(
        Nonrecursive,
        [
          {
            pvb_pat: {ppat_desc: Ppat_var(className)},
            pvb_expr: {
              pexp_desc:
                Pexp_extension((
                  {txt: "css"},
                  PStr([
                    {
                      pstr_desc:
                        Pstr_eval({pexp_desc: Pexp_construct(_, exp)}, []),
                    },
                  ]),
                )),
            },
          },
        ],
      ) =>
      Str.value(
        Nonrecursive,
        [
          Vb.mk(
            Pat.var(className),
            Exp.apply(
              Exp.ident(lid("css")),
              [
                (
                  "",
                  Exp.construct(
                    lid("::"),
                    Some(
                      Exp.tuple([
                        Exp.apply(
                          Exp.ident(lid("label")),
                          [
                            (
                              "",
                              Exp.constant(
                                Asttypes.Const_string(className.txt, None),
                              ),
                            ),
                          ],
                        ),
                        Exp.construct(lid("::"), exp),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    | _ => default_mapper.structure_item(mapper, item)
    },
};

let () = Ast_mapper.register("bs-emotion-ppx", cssMapper);
