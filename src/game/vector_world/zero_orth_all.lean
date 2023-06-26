import vectors.tuple -- hide
import vectors.orthogonal --hide
import data.real.basic
import game.vector_world.triangle_ineq --hide

namespace tuple -- hide

/- 
# Vector world

## Level 18: `Zero orthogonal` 

-/

/- Lemma
**0** is orthogonal to all vectors. 
-/

lemma zero_orth_all: ∀ {n : ℕ} (x: ℝ ^ n)
,  orthogonal 0 x   :=
begin
  intro n,
  induction n with n hn,
  { intro x,
    cases x,
    simp,
    refl, },
  { intro x,
    cases x with n head tail,
    simp,
    exact hn tail, },
end

end tuple
