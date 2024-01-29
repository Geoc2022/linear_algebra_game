import game.r3_vector_space.vec_assoc --hide
namespace tuple -- hide
namespace r3 -- hide

/- 

# R^3 world

Strategy:
Here we will be proving that vector addition is commutative. 

## Level 2: `vector_comm` 

-/

/- Lemma
u + v = v + u ∀u,v ∈ R³
-/

lemma vec_comm : ∀ (u v : ℝ ^ 3), u + v = v + u :=
begin
  intros u v,
  cases_tuple u 3,
  cases_tuple v 3,
  simp,
  exact ⟨by ring, by ring, by ring⟩,
end

end r3 -- hide
end tuple -- hide
