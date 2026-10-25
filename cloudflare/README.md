# Arugula on Cloudflare

Arugula shows offers that fit what visitors search for on your site, next to your own search results. Each offer has a tracked link. It attaches to the search box you already have.

Under every list of offers, the script shows:

> Ranked by fit only. Arugula may earn a commission if you buy through these links, at no extra cost to you.

By using Arugula you agree to [arugulanet.com/terms](https://arugulanet.com/terms). Privacy: [arugulanet.com/privacy](https://arugulanet.com/privacy).

Pick one of three ways in. All three load the same pinned script:
`https://api.arugulanet.com/embed/v0.5.1/search.js`.

## (a) Zaraz Custom HTML (works today for any Zaraz user)

1. In the Cloudflare dashboard, go to **Tag setup** → **Tools Configuration** → **Third-party tools** → **Add new tool**.
2. Choose **Custom HTML** and select **Continue**.
3. Paste this as the tool's HTML:

   ```html
   <script async src="https://api.arugulanet.com/embed/v0.5.1/search.js"
     integrity="sha384-X4k3s69VsfRmYH9tdbbuEnV4cAd/fQqqVBD0V0ufGlckBax2Aqh7Ji8UibiGIUFG"
     crossorigin="anonymous" data-channel="zaraz"></script>
   ```

4. Give the tool an action with the **Pageview** trigger, then **Save**.

Optional attributes: `data-selector` (the search box, as a CSS selector; empty means it finds it itself), `data-container` (where offers go; empty means right after the search form) and `data-limit` (how many offers, default 3).

## (b) Zaraz Custom Managed Component (channel `zaraz`)

The component is in `component/`. It is one file with no imports, so there is nothing to build.

1. Sign in to Cloudflare from a terminal: `npx wrangler login`.
2. In `component/`, deploy it as a Worker:

   ```sh
   npx managed-component-to-cloudflare-worker ./index.js arugula
   ```

   `npm run deploy` runs the same command. The Worker shows up under **Workers & Pages** as `custom-mc-arugula` (the tool adds the `custom-mc-` prefix).
3. In the dashboard: **Tag setup** → **Tools Configuration** → **Third-party tools** → **Add new tool** → **Custom Managed Component** → **Continue**.
4. Under **Select Custom MC**, choose `custom-mc-arugula` → **Continue**.
5. Under **Permissions**, grant the one to execute scripts (`execute_unsafe_scripts`). The component needs it to add the script to the page. **Continue**.
6. Under **Set up**, the settings are all optional: `selector`, `container` and `limit` (as in `manifest.json`). **Save**.
7. Add an action of type **Pageview** with the **Pageview** trigger. Zaraz does not call the component until the tool has an action.

The deploy tool does not read `manifest.json`, and the docs do not say whether Zaraz does for a Custom Managed Component. The manifest is there for the Managed Components format.

## (c) Cloudflare Worker, for sites on Cloudflare without Zaraz (channel `cloudflare`)

The Worker is in `worker/`. It adds the script tag to every HTML page at the edge.

1. In `worker/wrangler.toml`, add a route in front of your site, for example
   `routes = [{ pattern = "shop.example.com/*", zone_name = "example.com" }]`.
2. Optional, under `[vars]`: `ARUGULA_SELECTOR`, `ARUGULA_CONTAINER`, `ARUGULA_LIMIT`.
3. `npx wrangler login`, then `npx wrangler deploy` in `worker/`.

## Sources

Read on 2026-10-25:

- Cloudflare, "Custom Managed Components" (last updated 2026-04-16): https://developers.cloudflare.com/zaraz/advanced/load-custom-managed-component/
- The deploy tool's README (sign in with `npx wrangler login`; bundle first): https://github.com/cloudflare/managed-component-to-cloudflare-worker
- Managed Components permissions (`execute_unsafe_scripts` is needed for `client.execute`): https://managedcomponents.dev/specs/manifest/permissions
- Zaraz supported tools (Custom HTML) and FAQ (tools without an automatic Pageview action need one added): https://developers.cloudflare.com/zaraz/reference/supported-tools/
