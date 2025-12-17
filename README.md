# Vercel Deploy Plugin for Claude Code

A Claude Code plugin that enables seamless deployment to Vercel directly from your development workflow.

## Features

- **One-command deployment** - Deploy to Vercel with simple slash commands
- **Preview deployments** - Create preview URLs for testing before production
- **Deployment verification** - Monitor logs and verify deployments are healthy
- **Error detection** - Automatic error detection with context-aware fix suggestions
- **Rollback support** - Quickly rollback to previous deployments if needed

## Installation

### From Plugin Marketplace

```bash
claude /plugin marketplace add https://github.com/vercel-labs/vercel-deploy-claude-code-plugin
```

### Manual Installation

1. Clone this repository
2. Add the plugin to Claude Code:
```bash
claude /plugin add /path/to/vercel-deploy-claude-code-plugin
```

## Prerequisites

- [Vercel CLI](https://vercel.com/docs/cli) installed (`npm install -g vercel`)
- Vercel account and authentication (`vercel login`)

## Usage

### Slash Commands

| Command | Description |
|---------|-------------|
| `/deploy` | Deploy to production |
| `/deploy-preview` | Create a preview deployment |
| `/deploy-verify` | Deploy and verify with log monitoring |
| `/vercel-setup` | Set up Vercel CLI and project configuration |
| `/vercel-logs` | View deployment logs |
| `/vercel-rollback` | Rollback to a previous deployment |

### Skills (Auto-Invoked)

The plugin includes skills that Claude automatically uses based on context:

- **vercel-deploy** - Triggered by phrases like "deploy my app", "push to production"
- **deploy-verify** - Triggered by "deploy and test", "deploy and verify", "deploy and watch for errors"

### Examples

```
# Deploy to production
/deploy

# Create a preview for testing
/deploy-preview

# Deploy with monitoring
/deploy-verify

# Check deployment logs
/vercel-logs

# Rollback if something went wrong
/vercel-rollback
```

Or just ask naturally:
- "Deploy my app to Vercel"
- "Create a preview deployment"
- "Deploy and help me fix any errors"
- "Show me the deployment logs"

## Configuration

The plugin works with your existing Vercel configuration:

- `vercel.json` - Project settings
- `.vercelignore` - Files to exclude from deployment
- Environment variables set via `vercel env`

## Troubleshooting

### Vercel CLI not found
```bash
npm install -g vercel
```

### Not logged in
```bash
vercel login
```

### Project not linked
```bash
vercel link
```

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.
