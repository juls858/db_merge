import pyodbc
import pyhocon
from keyvault import KeyVault

class DatawarehouseWriter(object):
    _config = None
    _keyVault = None
    _connectionTemplate = 'DRIVER={0};SERVER={1};DATABASE={2};UID={3};PWD={4}'

    _connection = None

    def __init__(self, config):
        self._config = config
        self._keyVault = KeyVault(config)

    def write_billing_records(self, billing):
        if self._connection is None:
            self._initialize()
            if self._connection is None:
                raise ConnectionError("No Connection to Datawarehouse")

        cursor = None
        try:
            cursor = self._connection.cursor()
            insert = '''
            BULK INSERT dbo.[BillingRaw] from  '{0}/{1}'
            WITH ( DATAFILETYPE='char', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='\n', DATA_SOURCE='{2}')
            '''.format(self._config.get('blob.container', 'import'),
                       billing,
                       self._config.get('datawarehouse.blobstorename', 'DWExtFileStorage'))
            cursor.execute(insert)
            cursor.commit()
        except Exception as e:
            print("Exception writing sql: "+e)
        finally:
            if cursor is not None:
                cursor.close()

    def purge_billing_for_date(self, billing_dt):
        if self._connection is None:
            self._initialize()
            if self._connection is None:
                raise ConnectionError("No Connection to Datawarehouse")

        cursor = None
        try:
            cursor = self._connection.cursor()
            dt = '''DELETE FROM dbo.[BillingRaw] where [Date] = (?)'''
            cursor.execute(dt, billing_dt)
        except Exception as e:
            print("Unable to remove data for {0}".format(billing_dt), e)


    def _initialize(self):
        password = self._keyVault.fetch_secret(
            self._config.get('datawarehouse.secret-name'),
            self._config.get('datawarehouse.secret-version')
        )


        self._connection = pyodbc.connect(
            self._connectionTemplate.format(
                '{'+self._config.get('sqldriver', 'ODBC Driver 17 for SQL Server')+'}',
                'tcp:'+self._config.get('datawarehouse.host'),
                self._config.get('datawarehouse.db'),
                self._config.get('datawarehouse.username'),
                password.value
            )
        )

    def cleanup(self):
        if self._connection is not None:
            self._connection.close()
