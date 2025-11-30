
# Auto Parts Database

Ovaj projekat predstavlja kompletno dizajniranu SQL bazu podataka za upravljanje auto-dijelovima, proizvođačima, kupcima i narudžbama.  
Baza je kreirana u MySQL-u i uključuje sve ključne pojmove: normalizaciju, relacije 1:N i N:N, spoljna ograničenja, CHECK validacije, agregatne upite, JOIN-ove i operacije nad podacima.

---

## 🗂 Struktura baze

Baza sadrži sljedeće tabele:

- **proizvodjaci** – podaci o proizvođačima auto-dijelova  
- **kategorije** – vrste dijelova (motor, kočioni sistem, osvjetljenje…)  
- **dijelovi** – pojedinačni dijelovi sa detaljima, cijenom i stanjem  
- **kupci** – informacije o kupcima  
- **narudzbe** – narudžbe koje kupci prave  
- **stavkeNarudzbe** – stavke unutar svake narudžbe

Sve tabele imaju:

- primarni ključ (PK)
- strane ključeve (FK)
- logična ograničenja (NOT NULL, CHECK, UNIQUE)
- referencijalni integritet (ON DELETE / ON UPDATE)

---

