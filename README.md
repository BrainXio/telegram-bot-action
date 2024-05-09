# Telegram Bot Action

[![Test Telegram Action](https://github.com/brainxio/telegram-bot-action/actions/workflows/test.yml/badge.svg)](https://github.com/brainxio/telegram-bot-action/actions/workflows/test.yml)

Send messages to Telegram directly from your GitHub Actions workflows.

## Usage

1. **Create a Telegram Bot** using [BotFather](https://core.telegram.org/bots#botfather) and note down the `bot_token`.
2. **Obtain the Chat ID** to which messages should be sent (use [IDBot](https://telegram.me/myidbot) or similar).
3. **Add Secrets** to your repository:
   - `TELEGRAM_BOT_TOKEN`: Your Telegram bot token.
   - `TELEGRAM_CHAT_ID`: The chat ID to which messages should be sent.

## Inputs

| Name        | Description                                     | Required | Default   |
|-------------|-------------------------------------------------|----------|-----------|
| `bot_token` | Telegram Bot Token                              | Yes      | -         |
| `chat_id`   | Telegram Chat ID                                | Yes      | -         |
| `message`   | Message to send                                 | Yes      | -         |
| `parse_mode`| Message format (`Markdown` or `HTML`)           | No       | `Markdown`|

## Example Workflow

Here's an example of how you can use this action in your GitHub Actions workflow:

```yaml
name: Hello Telegram Bot

on:
  push:
    branches:
      - main
      - develop
      - feature/**
      - release/**
  pull_request:
    branches:
      - main
    paths-ignore:
      - 'CHANGELOG.md'
      - 'README.md'
  workflow_dispatch:

jobs:
  test_telegram:
    name: Send Informative and Funny Message to Telegram
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2

      - name: Send Informative Message
        uses: brainxio/telegram-bot-action@v1
        with:
          bot_token: ${{ secrets.TELEGRAM_BOT_TOKEN }}
          chat_id: ${{ secrets.TELEGRAM_CHAT_ID }}
          message: |
            🔍 **Workflow Details:**

            - **Repository:** \`${{ github.repository }}\`
            - **Branch:** \`${{ github.ref_name }}\`
            - **Workflow Name:** \`${{ github.workflow }}\`
            - **Job Name:** \`${{ github.job }}\`
            - **Run ID:** \`${{ github.run_id }}\`
            - **Run Number:** \`${{ github.run_number }}\`
            - **Run Attempt:** \`${{ github.run_attempt }}\`
            - **Actor:** \`${{ github.actor }}\`

            ⚡️ *Sending this message via GitHub Actions from your friendly neighborhood bot.*
          parse_mode: 'Markdown'
```

## Contributing

Feel free to contribute! Please submit an issue or pull request if you have improvements or bug fixes.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

Special thanks to the Telegram Bot API and GitHub Actions community for their resources.

---

Enjoy using this action? Give it a 🌟 to show your support!
