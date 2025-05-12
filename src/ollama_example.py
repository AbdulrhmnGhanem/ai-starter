import asyncio
import logging

from ollama import AsyncClient

client = AsyncClient()

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


async def chat() -> None:
    message = {"role": "user", "content": "Why is the sky blue?"}
    response = await client.chat(model="gemma3:1b", messages=[message])
    logger.info("Response: %s", response)


asyncio.run(chat())
