import requests
from requests.exceptions import RequestException
from github import Github
from os import getenv

def send_telegram_message():
    try:
        bot_token = getenv('INPUT_BOT_TOKEN')
        chat_id = getenv('INPUT_CHAT_ID')
        message = getenv('INPUT_MESSAGE')
        parse_mode = getenv('INPUT_PARSE_MODE', 'Markdown')

        url = f"https://api.telegram.org/bot{bot_token}/sendMessage"

        payload = {
            'chat_id': chat_id,
            'parse_mode': parse_mode,
            'text': message,
        }

        response = requests.post(url, json=payload)
        response.raise_for_status()

        print('Message sent successfully:', response.json())

    except RequestException as error:
        print(f"Action failed with error: {error}")

if __name__ == '__main__':
    send_telegram_message()
