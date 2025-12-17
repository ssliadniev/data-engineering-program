from fastapi import HTTPException

from .replicator import GrpcReplicator
from .config import settings


class MessageService:
    _messages = []
    _replicator = GrpcReplicator(settings.secondary_hosts, settings.timeout)

    async def append_message(self, content: str):
        success = await self._replicator.replicate_to_all(content)

        if not success:
            raise HTTPException(status_code=500, detail="Replication failed. Message not committed.")

        self._messages.append(content)
        return content

    def get_messages(self):
        return self._messages
