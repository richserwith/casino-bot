import discord
from discord.ext import commands
from modules.helpers import *
import yaml
import os

with open('/workspaces/casino-bot/config.yml', 'r') as file:
    config = yaml.safe_load(file)

client = commands.Bot(
    command_prefix=config['bot']['prefix'],
    owner_ids=set(config['bot']['owner_ids']),
    intents=discord.Intents.all()
)

client.remove_command('help')

async def load_extensions():
    for filename in os.listdir(COG_FOLDER):
        if filename.endswith('.py'):
            await client.load_extension(f'cogs.{filename[:-3]}')

async def main():
    await load_extensions()
    if '--private' in os.sys.argv:
        print("Running in private mode")
    await client.start(os.getenv('TOKEN'))

import asyncio
asyncio.run(main())
