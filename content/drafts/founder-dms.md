# Founder-to-Founder DMs — pre-launch validation
**Generado:** 2026-04-25 12:40 Madrid
**Status:** DRAFTS — pendiente Víctor seleccione targets reales y apruebe send (regla `feedback_real_client_review.md`)
**Plataforma:** LinkedIn DM + Twitter DM (según donde tengas más rapport)
**Objetivo:** validación 1:1 antes del Show HN del Martes 29. Detectar si el hook resuena con devs reales.

---

## ⚠️ Cómo usar este doc

1. Decide los 5 nombres reales (gente con la que has tenido al menos UNA interacción previa — like, reply, GitHub star). Cold DM a no-followers viola `feedback_twitter_dm_policy.md`.
2. Por cada uno: copia el template que mejor encaje, rellena `[PLACEHOLDERS]` con detalle específico.
3. Si yo (Claude) tengo acceso a su perfil público para personalizar, pídeme: "Personaliza el DM 1 para @username" y lo refino.
4. Envías tú desde tu sesión LinkedIn/Twitter (NO yo automático — regla hard).

**Regla de oro:** si después de leer el DM el receptor no se siente reconocido como persona específica, no lo envíes. Mejor 3 DMs personalizados que 5 plantillas reproducibles.

---

## TEMPLATE 1 — Fellow indie founder en AI dev tools (alta rapport)

**Target perfil:** alguien que también construye open-source dev tooling, ICP bootstrapper. Ej: Cline contributors, Aider users, OpenInterpreter folks, MCP server creators.

**Subject (LinkedIn):** *(LinkedIn DM no usa subject)*
**Twitter DM open / LinkedIn:**

> Hola [NAME],
>
> Te seguí desde [SPECIFIC: tu post sobre X / tu repo Y / tu charla en Z]. Tu enfoque sobre [SPECIFIC THING THEY DO] me influyó cuando empecé a construir mi propio stack.
>
> Te escribo porque acabo de open-sourcear algo que ataca un problema concreto: yo enviaba duplicados de cold emails con Claude Code porque las "memory rules" en markdown no se firaban en el momento. Lo arreglé con un PreToolUse hook de 30 líneas. Ese hook + 6 más + skills + agents son axiom-reflex (Apache 2.0): github.com/vdalhambra/axiom-reflex
>
> El martes 29 hago Show HN. Si te apetece mirarlo 5 min antes y decirme honestamente "esto es útil" / "esto es ruido" / "te falta esto", me sirves para ajustar la narrativa antes del lanzamiento.
>
> Y si te gusta y quieres beta del cloud sync (axiom-memory.vercel.app, $29/mo normal), tienes lifetime $19/mo si firmas en los próximos 7 días. Cero presión — tu feedback ya me sirve.
>
> Gracias.
> Víctor

**Length:** ~140 palabras.

---

## TEMPLATE 2 — Dev builder ES (mid rapport, comunidad española)

**Target perfil:** indie dev ES, audience medium (~5-50k followers), construye en público. Ej: builders en Twitter ES, IndieHackers ES.

**Twitter DM / LinkedIn (ES):**

> [NAME], qué tal,
>
> Te he leído mucho con [SPECIFIC: tu post sobre X / tu hilo sobre Y]. Pillé lo de [DETALLE CONCRETO] y lo apliqué.
>
> Acabo de open-sourcear axiom-reflex: hooks + skills + subagentes para Claude Code que bloquean errores conocidos al nivel de tool-call. Lo construí porque enviaba duplicados de cold emails y la "memoria" en markdown nunca se consultaba. Ahora un hook de 30 líneas lo bloquea: github.com/vdalhambra/axiom-reflex
>
> Lanzo en HN el martes. Antes me ayudaría si lo miras 5 min y me dices: ¿esto te resolvería un problema real, o se queda en juguete? Si quieres beta del cloud sync (axiom-memory.vercel.app), te lo dejo gratis primer mes + lifetime $19/mo (vs $29).
>
> Si no encaja, dale 0 vueltas. Solo quería pulsar contigo antes del lanzamiento.

**Length:** ~130 palabras.

---

## TEMPLATE 3 — Power user de Claude Code (engagement frecuente público)

**Target perfil:** alguien que tweetea sobre workflows con Claude Code/Cursor/Windsurf, vibe coding, agentic dev. Ej: @[handle] que postea threads de "10 cosas que aprendí con Claude Code".

**Twitter DM (EN o ES según interlocutor):**

> Hey [NAME],
>
> Read your thread on [SPECIFIC: managing Claude Code memory / hooks / agentic flows]. The point you made about [SPECIFIC POINT] is exactly the gap I tried to close.
>
> Open-sourced today: 7 PreToolUse hooks that block known-bad tool calls deterministically. The Gmail dedup one is 30 lines of bash and I haven't sent a duplicate cold email since. Apache 2.0: github.com/vdalhambra/axiom-reflex
>
> Show HN Tuesday. Before that, would love if you skimmed for 5 min and told me — does this scratch your real itch, or am I solving a problem you've already solved differently?
>
> If it works for you and you want the cloud sync beta (axiom-memory.vercel.app), I can set you up free first month + lifetime $19/mo lock-in.
>
> No pressure either way.
> — Víctor

**Length:** ~145 palabras.

---

## TEMPLATE 4 — Educator/content creator (Twitter/LinkedIn audience grande, ES tech)

**Target perfil:** educadores tech con audiencia +30k. NO recomendado cold DM si no follow back. Solo si has interactuado antes.

**Twitter DM (ES):**

> [NAME], hola,
>
> Vi tu [SPECIFIC: video sobre X / post sobre Y]. Te quería preguntar algo concreto.
>
> Llevo 14 días dogfooding un stack open-source para Claude Code (hooks + skills + agentes con model tier routing). El insight clave que estoy intentando comunicar antes del Show HN del martes 29: "hooks > prompts" para fiabilidad. Y temo que se lea como buzzword en lugar de fix concreto.
>
> ¿Tendrías 5 min para mirar el repo y decirme si la narrativa hace click? Si después te apetece compartirlo en tu audiencia te paso assets visuales listos. Si no, ya me has ayudado.
>
> github.com/vdalhambra/axiom-reflex
>
> Gracias.

**Length:** ~115 palabras.

---

## TEMPLATE 5 — Funded founder de AI tooling (formal, value-first)

**Target perfil:** founder con startup VC-backed (Series A+) en AI dev/agent space. Cero rapport personal, only public profile. **Skip si nunca habéis interactuado.**

**LinkedIn DM (EN):**

> Hi [NAME],
>
> [Specific compliment on their work — 1 line, concrete: their seed round, a specific feature they shipped, a talk they gave].
>
> I'm Víctor, solo founder. Dogfooded a Claude Code reliability stack on my own revenue work for 2 weeks: 7 PreToolUse hooks + 6 skills + 6 subagents with explicit model tier routing (Haiku/Sonnet/Opus). Open-sourced today, Apache 2.0: github.com/vdalhambra/axiom-reflex
>
> The premise: instead of "better prompts" we enforce class-of-error blocking at tool-call time. 30 lines of bash blocks duplicate emails before they ship. Different from [their company]'s focus, but adjacent.
>
> Two specific questions if you have 5 minutes:
> 1. Does this look like something your customers would also need (vs build internal)?
> 2. What's the one piece you'd cut to make it tighter?
>
> Genuinely no agenda — your feedback before the Show HN Tuesday would be valuable.
>
> Thanks,
> Víctor — github.com/vdalhambra

**Length:** ~165 palabras.

---

## 🎯 Suggested targets (research público — Víctor: marca los reales)

> Estos son perfiles ICP a revisar. **No envíes a ninguno con quien no tengas rapport previo.** Marca con [√] los que ya conoces, [—] los que NO, [?] los a verificar.

| Categoría | Twitter | LinkedIn | Tier | Notes |
|---|---|---|---|---|
| 1. Indie founder AI tool | @sdrzn (Cline) | n/a | T1 | Open source, similar ICP |
| 1. Indie founder AI tool | @paulgauthier (Aider) | n/a | T1 | Open source |
| 2. Builder ES | @midudev | midu.dev | T2 | Already in influencer outreach Tier 2 — NO duplicar |
| 2. Builder ES | @mouredev | LinkedIn Brais Moure | T2 | Already in influencer outreach Tier 2 — NO duplicar |
| 3. Power user Claude | @mckaywrigley | n/a | T1 | Claude Code influencer, already in Tier 1 — NO duplicar |
| 3. Power user Claude | @swyx | latent.space | T1 | Already Tier 1 — NO duplicar |
| 4. Educator | @midudev | (above) | T2 | Already covered |
| 5. Funded founder | @aravsrinivas (Perplexity) | n/a | T3 | Cold, low prob |

**⚠️ Conflict warning:** Templates 2-3 y influencer outreach Tier 1+2 (axinflu1, axinflu2) podrían chocar si DM y reply en el mismo día. Coordinar:
- **Sat-Sun:** founder DMs (5, validation-focused, beta access offer)
- **Jue T+24h:** influencer replies (different message — drop launch URL, no beta offer)

**Mi recomendación CEO:** Víctor selecciona 5 nombres del network REAL (LinkedIn first-degree connections con interaction history >0). Si no tiene 5 con rapport previo, baja a 3 + pivot el resto al influencer reply path.

---

## ✅ Post-send tracking (rellenar tras envío)

| # | DM enviado a | Plataforma | Fecha | Respuesta? | Outcome |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |
| 4 | | | | | |
| 5 | | | | | |

**Targets de éxito:**
- 3+ respuestas (60% rate normal en network warm)
- 1+ feedback substantivo accionable
- 1+ early beta sign-up (best case 2)
