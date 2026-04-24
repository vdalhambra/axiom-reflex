---
name: reddit-comment-tone
description: Tone, structure, and affiliate disclosure rules for Reddit posts and comments. Keeps tone conversational (max 2-3 short paragraphs), avoids AI-slop, handles affiliate disclosure correctly (link in comment → article → disclosure there, NOT in Reddit post).
when_to_use: Before publishing any Reddit post or comment, especially with affiliate links or promotional content
---

# Reddit comment & post tone

## Hard rules

1. **Tono:** BREVE, coloquial, conversacional. Máximo 2-3 párrafos cortos. Sin jerga corporate.
2. **Estructura comment:** observación/pregunta del OP → contexto útil → propuesta concreta o recurso con link.
3. **Lexical editor paste:** Reddit usa Lexical. `execCommand` falla. Usar clipboard.writeText + Ctrl+V (pattern `ac34c17a` axiom-perception).
4. **NO afiliado disclosure en Reddit post** — el disclosure va en el artículo Medium/blog linkado, no en el post Reddit. Incidente 2026-04-20: posts con "[Divulgación afiliado]" cancelados por ser counterproductivo.
5. **No fabricar experiencia** — no "llevo X meses usando Y" si no es verificable (incidente 2026-04 con Opus 4.7 salido el día antes → 7 downvotes).

## Format check pre-publish

- ¿Longitud ≤3 párrafos cortos?
- ¿Zero corporate phrases ("game-changer", "leveraging", "synergies", "actionable insights")?
- ¿Link es deep link a artículo/tool específico, no home?
- ¿Idioma correcto? (r/Inversiones español, r/AskReddit inglés, etc.)
- ¿Afiliado disclosure solo en artículo target, no en post?
- ¿Firma? Reddit no firma, handle visible ya da autoría.

## Templates

### Comment de valor + recurso

```
Para [contexto del OP], yo normalmente [insight específico].

[Dato concreto o ejemplo].

Si te interesa profundizar: [link deep a artículo específico].
```

### Post informativo con link

```
[Título conversacional, no clickbait]

[Párrafo 1: el problema/contexto en 2-3 frases.]

[Párrafo 2: lo que he descubierto / hecho].

[Párrafo 3: link al recurso + 1 frase CTA].
```

## Subreddits target (Axiom)

- **r/Inversiones** (ES) — brokerclaro, finance content
- **r/AskReddit** — rarely relevant
- **r/LocalLLaMA** — MCPs, agent tools
- **r/ClaudeAI / r/ChatGPTCoding** — Claude/AI content
- **r/programming** — technical deep dives
- **r/EntrepreneurRideAlong** — solo founder stories (cuidado self-promo rules)

## Anti-patterns

- Posts con "Check out my new ___!" → downvote guaranteed.
- Comments stuffed con emojis 🚀✨💡 → AI-slop signal.
- Links repeated across multiple comments in same thread → spam flag.
- Edit post adding CTA hours later → mods remove.

## Pattern axiom-perception

`recall_pattern(task="reddit lexical paste", app="reddit")` → pattern ac34c17a con steps exactos.
