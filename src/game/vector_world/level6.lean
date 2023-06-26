import vectors.tuple -- hide
import data.real.basic
import game.vector_world.level5 
namespace tuple -- hide

/- 
# Vector world

## Level 6: `Scalars pass through` 

-/

/- Lemma
(cx)·y=c (x·y) for all x, y ∈ ℝⁿ and c ∈ R
-/

lemma scalar_through: ∀ {n : ℕ} (c : ℝ) (x y : ℝ ^ n), (c • x) ⬝ y = c * (x ⬝ y) :=
begin 
  intro n,
  induction n with d hd, 
  {intros c x y, 
  cases x, 
  cases y, 
  repeat {dsimp [dot_product, scalar_mul, map]}, simp,  
  },
  {
    intros c x y, 
    cases x, 
    cases y, 
    simp,
    rw mul_add,
    rw ← hd c x_tail y_tail,
    simp,
    rw mul_assoc, 
  },
end

end tuple -- hide
