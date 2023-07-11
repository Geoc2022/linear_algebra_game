import game.cauchy_schwarz_world.scalar_norm --hide
namespace tuple -- hide

/- 
# Cauchy Schwarz world

## Level 4: `Subtract norm square` 

-/

/- Lemma

||x - y||² = ||x||² - 2 * (x ⬝ y) + ||y||²

Background:

This is very similar to the proof we just did. Let's see if you can develop a structure similar to the last proof for this one!

Good luck!

Strategy:



-/


lemma sub_norm_square: ∀ {n : ℕ} (x y : ℝ ^ n)
,  ↑(norm_sq (x - y)) = ↑(norm_sq x) - (2 * (x ⬝ y)) + ↑(norm_sq y) :=
begin 
  intros n x y,
  rw sub_eq_add_neg,
  rw add_norm_square,
  rw neg_eq_neg_mul,
  rw dot_comm x ((-1 : ℝ) • y),
  rw scalar_through,
  rw dot_comm y x,
  simp,
  rw scalar_through,
  rw dot_comm y,
  rw scalar_through,
  linarith,
end

end tuple -- hide
