import pyhocon

from src.db_conversion.keyvault import KeyVault

conf = pyhocon.ConfigFactory.parse_file('../app.config')
keyVault = KeyVault(conf)

keyVault_pass = keyVault.fetch_secret(conf.get("source.secret_name"), conf.get("source.secret_version")).value