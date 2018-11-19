open Ast_mapper;
open Ast_helper;
open Asttypes;
open Parsetree;
open Longident;

let lid = name => {txt: Lident(name), loc: Location.none};

let css = (className, decls) =>
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
                    Exp.constant(Asttypes.Const_string(className.txt, None)),
                  ),
                ],
              ),
              switch (decls) {
              | Some(decls) => Exp.construct(lid("::"), decls)
              | None => Exp.construct(lid("[]"), None)
              },
            ]),
          ),
        ),
      ),
    ],
  );

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
                        Pstr_eval(
                          {
                            pexp_desc:
                              Pexp_construct({txt: Lident("[]")}, None),
                          },
                          [],
                        ),
                    },
                  ]),
                )),
            },
          },
        ],
      ) =>
      Str.value(
        Nonrecursive,
        [Vb.mk(Pat.var(className), css(className, None))],
      )

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
        [Vb.mk(Pat.var(className), css(className, Some(exp)))],
      )

    | Pstr_value(
        Nonrecursive,
        [
          {
            pvb_pat: {ppat_desc: Ppat_var(className)},
            pvb_expr: {
              pexp_desc:
                Pexp_fun(
                  label,
                  optExp,
                  pat,
                  {
                    pexp_desc:
                      Pexp_extension((
                        {txt: "css"},
                        PStr([
                          {
                            pstr_desc:
                              Pstr_eval(
                                {pexp_desc: Pexp_construct(_, exp)},
                                [],
                              ),
                          },
                        ]),
                      )),
                  },
                ),
            },
          },
        ],
      ) =>
      Str.value(
        Nonrecursive,
        [
          Vb.mk(
            Pat.var(className),
            Exp.fun_(label, optExp, pat, css(className, Some(exp))),
          ),
        ],
      )

    | Pstr_value(
        Nonrecursive,
        [
          {
            pvb_pat: {ppat_desc: Ppat_var(className)},
            pvb_expr: {
              pexp_desc:
                Pexp_fun(
                  label1,
                  optExp1,
                  pat1,
                  {
                    pexp_desc:
                      Pexp_fun(
                        label2,
                        optExp2,
                        pat2,
                        {
                          pexp_desc:
                            Pexp_extension((
                              {txt: "css"},
                              PStr([
                                {
                                  pstr_desc:
                                    Pstr_eval(
                                      {pexp_desc: Pexp_construct(_, exp)},
                                      [],
                                    ),
                                },
                              ]),
                            )),
                        },
                      ),
                  },
                ),
            },
          },
        ],
      ) =>
      Str.value(
        Nonrecursive,
        [
          Vb.mk(
            Pat.var(className),
            Exp.fun_(
              label1,
              optExp1,
              pat1,
              Exp.fun_(label2, optExp2, pat2, css(className, Some(exp))),
            ),
          ),
        ],
      )
    | _ => default_mapper.structure_item(mapper, item)
    },
};

let () = Ast_mapper.register("bs-emotion-ppx", cssMapper);
