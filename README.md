<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="brand/png/logo-horizontal-dark.png">
    <img src="brand/png/logo-horizontal-900.png" alt="Arugula, Intent Exchange Network" width="450">
  </picture>
</p>

# Arugula

**Offers that fit, wherever people ask.**

Arugula is a matching engine. Someone says what they want, in their own words, in their assistant, on a website or
in a chat. Arugula matches the request on meaning against merchants' offers and returns the ones that fit, best
first. Each offer comes with its price, a one-line reason why it fits, and a link to buy from the merchant.

- **Ranked by fit only.** Nobody can pay to be placed higher.
- **Commission, disclosed.** Arugula may earn a commission if you buy through these links, at no extra cost to you.
  Every list of offers says so.
- **No account needed.** Every surface below works without signing up.
- **When nothing fits, nothing is shown.**

Website: [arugulanet.com](https://arugulanet.com) · Privacy: [arugulanet.com/privacy](https://arugulanet.com/privacy/) ·
Terms: [arugulanet.com/terms](https://arugulanet.com/terms/)

## Where to use it

| Surface | For | Status |
|---------|-----|--------|
| [MCP server](#mcp-server) | Claude, Cursor, Open WebUI, LibreChat, Jan, LM Studio and any MCP client | Live |
| [Telegram](#telegram) | Chats and groups | Live |
| [Site search](#site-search) | Any website with a search box | Live |
| [Shopify](#shopify) | Shopify stores | Live |
| [Google Tag Manager](#google-tag-manager) | Sites that use GTM | Live (import); gallery listing in review |
| [WordPress](#wordpress) | WordPress sites | Live (ZIP); WordPress.org listing in review |
| [Chatbots](#chatbots) | Chatwoot, Botpress, Rasa, Voiceflow and your own bot | Live, partner key on request |
| [Python](#python) | Your own agents (LangChain, LangGraph, CrewAI) | Live on PyPI |
| [JavaScript](#javascript) | Your own agents | Coming soon |
| Chrome and Firefox extensions | Your browser | Coming soon |
| Claude directory, ChatGPT app | Assistants | Coming soon |
| Discord | Servers | Coming soon |

## MCP server

`https://mcp.arugulanet.com/mcp`: Streamable HTTP. No key and no sign-in.

| Tool | What it does |
|------|--------------|
| `find_offers` | Takes a request in plain words and returns the offers that fit, best first. |
| `get_offers` | Gets the offers found for a request from `find_offers`; matching can take a few seconds. |
| `explain_match` | Says why an offer fits a request. |

Each client below has its own address, ending in `?ch=`. That tag only tells us which kind of client sent a
request, so we can see which ones people use.

**Claude** (web and desktop): Settings, then Connectors, then **Add custom connector**, with
`https://mcp.arugulanet.com/mcp?ch=claude-connector`. Custom connectors are available on some Claude plans only.

**Claude Code:**

```sh
claude mcp add --transport http arugula "https://mcp.arugulanet.com/mcp?ch=claude-connector"
```

**Cursor:** add this to `~/.cursor/mcp.json` (every project) or `.cursor/mcp.json` (one project). This repository is
also a Cursor plugin (`.cursor-plugin/plugin.json` and `mcp.json`).

```json
{
  "mcpServers": {
    "arugula": {
      "url": "https://mcp.arugulanet.com/mcp?ch=cursor"
    }
  }
}
```

One-click install, if your system opens `cursor://` links:

```
cursor://anysphere.cursor-deeplink/mcp/install?name=arugula&config=eyJ1cmwiOiJodHRwczovL21jcC5hcnVndWxhbmV0LmNvbS9tY3A/Y2g9Y3Vyc29yIn0=
```

**Open WebUI** (0.6.31 or later): Admin Settings, then External Tools, then **+ Add Server**. Type **MCP (Streamable
HTTP)**, URL `https://mcp.arugulanet.com/mcp?ch=open-webui`, Auth **None**. The URL must be reachable from the Open
WebUI server.

**LibreChat:** in `librechat.yaml`:

```yaml
mcpServers:
  arugula:
    type: streamable-http
    url: https://mcp.arugulanet.com/mcp?ch=librechat
    title: Arugula
    description: Find offers that fit what you want, ranked by fit only.
    timeout: 60000
```

**Jan:** Settings, then **MCP Servers**, then **+ Add MCP Server**. Name `arugula`, transport **HTTP**, URL
`https://mcp.arugulanet.com/mcp?ch=jan`. Turn tools on for the model you use.

**LM Studio** (0.3.17 or later): Program tab, then **Install**, then **Edit mcp.json**, and add this inside
`mcpServers`:

```json
"arugula": {
  "url": "https://mcp.arugulanet.com/mcp?ch=lm-studio"
}
```

**Any other MCP client:** use `https://mcp.arugulanet.com/mcp` with the Streamable HTTP transport and no
authentication.

The entry for the official MCP registry is [`server.json`](server.json) (`com.arugulanet/arugula`).

## Telegram

Open [@ArugulaNetBot](https://t.me/ArugulaNetBot) and say what you want. To use it with others, add it to a group.
To use it in any chat, type `@ArugulaNetBot` followed by your request.

## Site search

One line on any page with a search box. When a visitor searches, offers that fit show up under your search form.
The script sets no cookies.

```html
<script async src="https://api.arugulanet.com/embed/v0.5.0/search.js"
        integrity="sha384-J3S8wL7BiucOTsplqZ9Sc3itJKtaWwnOB5tzv6KEEp4RiNOVo+XalwwRcnUaGdmG"
        crossorigin="anonymous" data-channel="site-search"></script>
```

It finds your search box by itself: `input[type=search]`, a search form, or an input named `q`, `s`, `search` or
`query`. All of these attributes are optional:

| Attribute | What it sets | Default |
|-----------|--------------|---------|
| `data-selector` | Your search input, for example `#q` | Found automatically |
| `data-container` | Where the offers go | Right after the search form |
| `data-limit` | How many offers to show | 3 |

The hashes for each release are at `https://api.arugulanet.com/embed/v0.5.0/integrity.json`. Each release path
never changes.

## Shopify

In your theme, open **Edit code**, then `layout/theme.liquid`, and paste this just before `</body>`:

```html
<script async src="https://api.arugulanet.com/embed/v0.5.0/search.js"
        integrity="sha384-J3S8wL7BiucOTsplqZ9Sc3itJKtaWwnOB5tzv6KEEp4RiNOVo+XalwwRcnUaGdmG"
        crossorigin="anonymous" data-channel="shopify"></script>
```

It attaches to your store's search the same way as [site search](#site-search).

## Google Tag Manager

The tag template is [`template.tpl`](template.tpl) in this repository. It loads the site-search script.

1. In GTM, open **Templates**, then **New** under Tag Templates.
2. Open the menu at the top right, choose **Import**, and select `template.tpl`. Save.
3. Add a new tag of type **Arugula** that fires on **All Pages**. Publish the container.

You can also download the template as a ZIP from `https://api.arugulanet.com/arugula-gtm-template.zip`.

## WordPress

Download [arugula-wordpress.zip](https://api.arugulanet.com/arugula-wordpress.zip). In WordPress, open **Plugins**,
then **Add New**, then **Upload Plugin**. Choose the file and activate it. It attaches to your site's search with
nothing to set up. The plugin's `readme.txt` lists everything it sends and stores.

## Chatbots

A bot you already run can forward a user's message to Arugula and show the offers that come back:

```
POST https://api.arugulanet.com/v1/partner/intents
Authorization: Bearer <partner key>

{"text": "a linen sofa under S$1,500", "user_id": "<your user's id>"}
```

The answer has `offers`, each with a `tracked_url`, and a ready-made `text` reply. For Chatwoot, set the agent bot's
webhook to `https://api.arugulanet.com/hooks/chatwoot/<partner id>?key=<partner key>`. To get a partner key,
[open an issue](https://github.com/ArugulaNet/arugula/issues).

## Python

[`arugulanet` on PyPI](https://pypi.org/project/arugulanet/). Needs Python 3.9 or later, has no dependencies, and needs
no account.

```sh
pip install arugulanet
```

```python
from arugulanet import Arugula

offers = Arugula().find_offers("a hotel room in Singapore for two nights", party_size=2)
```

For LangChain and LangGraph, install `"arugulanet[langchain]"` or `"arugulanet[langgraph]"` and use
`from arugulanet.langchain import find_offers_tool`. For CrewAI, install `"arugulanet[crewai]"` and use
`from arugulanet.crewai import FindOffersTool`.

## JavaScript

Coming soon to npm as `arugulanet`. Needs Node 18 or later and has no runtime dependencies. Includes tools for
OpenAI function calling, LangChain.js and CrewAI-style agents.

```js
import { Arugula } from "arugulanet";

const offers = await new Arugula().findOffers("a hotel room in Singapore for two nights", { party_size: 2 });
```

## Showing offers

If you build on Arugula, show this line with the offers:

> Ranked by fit only. Arugula may earn a commission if you buy through these links, at no extra cost to you.

The tools and the API return it with every list of offers, as `disclosure`.

## Brand

Logos, icons, avatars, favicons and social images are in [`brand/`](brand/), with the rules in
[`brand/BRAND.md`](brand/BRAND.md). Use them as they are: no recolouring, outlines or effects.

## Help

Questions, problems and requests: [open an issue](https://github.com/ArugulaNet/arugula/issues).

## Licence

This repository is under the [Apache License 2.0](LICENSE). The packages carry their own licences: MIT for the
Python and JavaScript packages, and GPLv2 or later for the WordPress plugin.
