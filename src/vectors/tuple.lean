import data.real.basic


inductive tuple : ℕ → Type
| nil : tuple 0
| cons {n : ℕ} (car : ℝ) (cdr : tuple n) : (tuple (n + 1))

notation `[[` l:(foldr `, ` (h t, tuple.cons h t) tuple.nil `]]`) := l


protected meta def tuple.repr : ∀ {n : ℕ}, tuple n → string
| 0 _ := "tuple.nil"
| n (tuple.cons a b) := "(tuple.cons " ++ repr a ++ " " ++ tuple.repr b ++ ")"

meta instance (n : ℕ) : has_repr (tuple n) := ⟨tuple.repr⟩


protected def tuple.add : ∀ {n : ℕ}, tuple n → tuple n → tuple n
| 0 _ _ := tuple.nil
| _ (tuple.cons head₁ tail₁) (tuple.cons head₂ tail₂) := tuple.cons (head₁ + head₂) (tuple.add tail₁ tail₂)

instance (n : ℕ) : has_add (tuple n) := ⟨tuple.add⟩


def tuple.dot_product : ∀ {n : ℕ}, tuple n → tuple n → ℝ
| 0 _ _ := 0
| _ (tuple.cons head₁ tail₁) (tuple.cons head₂ tail₂) := (head₁ * head₂) + tuple.dot_product tail₁ tail₂

infix ` ⬝ `:72 := tuple.dot_product


def tuple.cross_product : tuple 3 → tuple 3 → tuple 3
| [[a, b, c]] [[d, e, f]] := [[b * f - c * e, c * d - a * f, a * e - b * d]]

infixl ` ×ᵥ `:74 := tuple.cross_product


def tuple.scalar_mul: ∀ {n : ℕ}, ℝ → tuple n → tuple n
| 0 _ _ := [[]]
| _ a (tuple.cons head tail) := tuple.cons (a*head) (tuple.scalar_mul a tail)

infix ` ** `:69 := tuple.scalar_mul


def tuple.norm_sq {n : ℕ} (v : tuple n) : ℝ  := v ⬝ v
