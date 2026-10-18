# OPAM – Rocq

The following versions are used:

- [ocaml-base-compiler](https://opam.ocaml.org/packages/ocaml-base-compiler/) 5.3.0
- [rocq-prover](https://opam.ocaml.org/packages/rocq-prover/) 9.3.0
- [vscoq-language-server](https://opam.ocaml.org/packages/vsrocq-language-server/) 9.3.0

Run these commands:

```bash
opam init --bare
eval $(opam env)

opam switch create rocq-latest ocaml-base-compiler.5.3.0
eval $(opam env)

opam install rocq-prover rocq-core=9.3.0
opam install vscoq-language-server.2.5.0
```
