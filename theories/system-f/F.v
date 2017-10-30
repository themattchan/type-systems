(* chapter 16 of harper's practical foundations of programming languages *)
Module SystemF.
  (* de bruijn indexed types *)
  Inductive tau : Type -> Type :=
  | TVar : nat -> tau nat
  | Arr  : forall t1 t2, tau t1 -> tau t2 -> tau (t1 -> t2)
  | All  : forall t, tau nat -> tau t -> tau (nat -> t)
  .

  Inductive exp : Type -> Type :=
  | EVar : forall t, t -> exp t
  | Lam  : forall t1 t2, tau t1 -> exp t1 -> exp t2 -> exp (t1 -> t2)
  | App  : forall t1 t2, exp (t1 -> t2) -> exp t1 -> exp t2
  | TLam : forall t, tau nat -> exp t -> exp (nat -> t)
  | TApp : forall t, tau nat -> exp (nat -> t) -> exp t
  .

End SystemF.
