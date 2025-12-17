import os

from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    secondary_id: int = 1

    @property
    def delay_seconds(self) -> int:
        env_var_name = f"SECONDARY_{self.secondary_id}_DELAY_SECONDS"

        value = os.getenv(env_var_name, "0")

        try:
            return int(value)
        except ValueError:
            return 0


settings = Settings()
