class MessageStorage:
    """
    Simple in-memory storage manager for messages.
    """

    def __init__(self):
        self._messages = []

    def add_message(self, msg: str):
        self._messages.append(msg)

    def get_all(self):
        return self._messages


storage = MessageStorage()
