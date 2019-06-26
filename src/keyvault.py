
from azure.keyvault import KeyVaultClient, KeyVaultAuthentication
from azure.common.credentials import ServicePrincipalCredentials

class KeyVault(object):
    """
    Abstraction for the Azure Key Vaults
    """
    _config = None
    _client_id = ''
    _tenant = ''
    _secret = ''
    _resource = 'https://vault.azure.net'
    _client = None
    _vault = None

    def __init__(self, config):
        """
        :param config: config: pyhocon configuration object
        """
        _config = config
        self._tenant = config.get('azure.tenant')
        self._vault = config.get('azure.vaultid')
        self._client_id = config.get('azure.app')
        self._secret = config.get('azure.client-secret')
        self._client = KeyVaultClient(KeyVaultAuthentication(authorization_callback=self._auth_callback))


    def _auth_callback(self, server, resource, scope,x):
        credentials = ServicePrincipalCredentials(
            client_id= self._client_id,
            secret=self._secret,
            tenant=self._tenant,
            resource=self._resource
        )
        token = credentials.token
        return token['token_type'], token['access_token']

    def fetch_secret(self, secret_id, secret_version):
        """
        Fetch the known client secret from the KeyVault.
        :param secret_id: the secret's name
        :param secret_version: the secrets's version hex
        :return:
        """
        secret_bundle = self._client.get_secret(
            'https://{0}.vault.azure.net/'.format(self._vault),
            secret_id,
            secret_version)
        return secret_bundle
