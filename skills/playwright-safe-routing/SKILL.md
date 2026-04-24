---
name: playwright-safe-routing
description: Safe patterns for network interception in Playwright — avoid `page.route('**')` which crashes the MCP. Use waitForResponse() and specific route matchers instead.
when_to_use: Before using any Playwright network interception or route handler
allowed-tools: mcp__playwright__browser_network_requests mcp__playwright__browser_evaluate
---

# Playwright safe routing — NO global route interception

**Hard rule:** `page.route('**', route => route.fetch())` → **MCP CRASHES** (consumes all traffic, deadlocks browser process).

## Patterns válidos

### Para esperar una respuesta específica

```js
// ✅ CORRECTO — wait for specific response
await page.waitForResponse(resp =>
  resp.url().includes('/api/save') && resp.status() === 200
);
```

```
mcp__playwright__browser_evaluate function: () => {
  // navigate, click, etc
}
```

### Para modificar requests específicos

```js
// ✅ CORRECTO — specific route with narrow matcher
await page.route('**/api/tracking/**', route => route.abort());
```

### Para observar requests sin interceptar

```
mcp__playwright__browser_network_requests
```

Esto devuelve lista de requests sin interferir. Preferir siempre si solo necesitas leer.

## Anti-pattern (NUNCA USAR)

```js
// ❌ MATA EL MCP
await page.route('**', route => route.fetch());
await page.route('**/*', route => route.continue());
```

Incluso con `route.continue()`, el overhead mata el proceso Playwright.

## Troubleshooting

- **Browser hangs tras route handler:** limpiar con `page.unroute('pattern')` antes de cerrar.
- **Handler dispara miles de veces:** matcher demasiado amplio. Narrow con regex específica.
- **Necesito mock de toda la app:** usar `playwright-test` en script separado, no MCP live.

## Pattern axiom-perception

Si detecto intención de interceptar globalmente → llamar `recall_pattern(task="playwright routing", app="playwright")` para verificar este patrón antes.
